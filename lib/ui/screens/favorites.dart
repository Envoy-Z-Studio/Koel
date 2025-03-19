import 'package:app/app_state.dart';
import 'package:app/constants/constants.dart';
import 'package:app/enums.dart';
import 'package:app/extensions/extensions.dart';
import 'package:app/providers/providers.dart';
import 'package:app/ui/placeholders/placeholders.dart';
import 'package:app/ui/widgets/widgets.dart';
import 'package:app/values/values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide AppBar;
import 'package:provider/provider.dart';

class FavoritesScreen extends StatefulWidget {
  static const routeName = '/favorites';

  const FavoritesScreen({super.key});

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  var _errored = false;
  var _loading = false;
  var _searchQuery = '';
  var cover = CoverImageStack(playables: []);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => makeRequest());
  }

  Future<void> makeRequest({bool forceRefresh = false}) async {
    if (_loading) return;

    setState(() {
      _errored = false;
      _loading = true;
    });

    try {
      await context.read<FavoriteProvider>().fetch(forceRefresh: forceRefresh);
    } catch (_) {
      setState(() => _errored = true);
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
  var sortConfig = AppState.get(
      'favorites.sort',
      PlayableSortConfig(field: 'title', order: SortOrder.asc),
    )!;

    return Scaffold(
      body: GradientDecoratedContainer(
        child: Consumer<FavoriteProvider>(
          builder: (_, provider, __) {
            if (provider.playables.isEmpty) {
              if (_loading) return const PlayableListScreenPlaceholder();
              if (_errored) return OopsBox(onRetry: makeRequest);
            }

            if(provider.playables.isEmpty){

              return PullToRefresh(
                onRefresh: () => _loading ? Future(() => null) : makeRequest(),
                child: CustomScrollView(slivers: [ 
                  SliverAppBar(
                  backgroundColor: AppColors.flexibleScreenHeaderBackground),
                  NoFavouritesScreen()
]));
           
            }

            if (cover.isEmpty) {
              cover = CoverImageStack(playables: provider.playables);
            }

            final songs =
                provider.playables.$sort(sortConfig).$filter(_searchQuery);

            var  a=  PullToRefresh(
              onRefresh: () {
                return _loading
                    ? Future(() => null)
                    : makeRequest(forceRefresh: true);
              },
              child: ScrollsToTop(
                child: CustomScrollView(
                  slivers: provider.playables.isEmpty
                      ? <Widget>[NoFavouritesScreen()]
                      : <Widget>[
                          AppBar(
                            headingText: 'Favorites',
                            coverImage: cover,
                            actions: [
                              SortButton(
                                fields: ['title', 'artist_name', 'created_at'],
                                currentField: sortConfig.field,
                                currentOrder: sortConfig.order,
                                onMenuItemSelected: (sortConfig) {
                                  setState(() => sortConfig = sortConfig);
                                  AppState.set('favorites.sort', sortConfig);
                                },
                              ),
                            ],
                          ),
                          SliverToBoxAdapter(
                            child: PlayableListHeader(
                              playables: songs,
                              onSearchQueryChanged: (String query) {
                                setState(() => _searchQuery = query);
                              },
                            ),
                          ),
                          SliverPlayableList(
                            playables: songs,
                            listContext: PlayableListContext.favorites,
                            onDismissed: provider.unlike,
                            dismissIcon: const Icon(CupertinoIcons.heart_slash),
                          ),
                          const BottomSpace(),
                        ],
                ),
              ),
            );
          
          return a;
          },
        ),
      ),
    );
  }
}


class NoFavouritesScreen extends StatelessWidget {

  const NoFavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      child: Wrap(
        spacing: 16.0,
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          const Icon(
                CupertinoIcons.heart,
                size: 56.0,
                color: Colors.grey,
              ),
          Text(
                'No favorites',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
           
        ],
      ),
    );
  }
}
