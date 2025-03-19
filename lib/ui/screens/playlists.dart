import 'package:app/constants/constants.dart';
import 'package:app/models/models.dart';
import 'package:app/providers/providers.dart';
import 'package:app/router.dart';
import 'package:app/ui/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/material/app_bar.dart' as Material;
import 'package:app/ui/widgets/app_bar.dart' as App;
class PlaylistsScreen extends StatefulWidget {
  static const routeName = '/playlists';
  final AppRouter router;

  const PlaylistsScreen({
    super.key,
    this.router = const AppRouter(),
  });

  @override
  _PlaylistsScreenState createState() => _PlaylistsScreenState();
}

class _PlaylistsScreenState extends State<PlaylistsScreen> {
  var _loading = false;

  Future<void> makeRequest() async {
    if (_loading) return;

    setState(() => _loading = true);

    try {
      await context.read<PlaylistProvider>().fetchAll();
    } catch (_) {
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: CupertinoTheme(
        data: const CupertinoThemeData(primaryColor: Colors.white),
        child: GradientDecoratedContainer(
          child: Consumer<PlaylistProvider>(
            builder: (context, provider, navigationBar) {
              final playlists = provider.playlists
                ..sort((a, b) => a.name.compareTo(b.name));

              late var widgets = <Widget>[];

              if (playlists.isEmpty) {
                widgets = [
                  SliverAppBar(
      backgroundColor: AppColors.flexibleScreenHeaderBackground,

                  ),
                  SliverToBoxAdapter(
                    child: NoPlaylistsScreen(
                      onTap: () {
                        widget.router.showCreatePlaylistSheet(context);
                      },
                    ),
                  )
                ];
              } else {
                widgets = [
                  navigationBar!,
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        Playlist playlist = playlists[index];

                        return Card(
                          child: Dismissible(
                            direction: DismissDirection.endToStart,
                            confirmDismiss: (_) async => await confirmDelete(
                              context,
                              playlist: playlist,
                            ),
                            onDismissed: (_) => provider.remove(playlist),
                            background: Container(
                              alignment: AlignmentDirectional.centerEnd,
                              color: AppColors.red,
                              child: const Padding(
                                padding: EdgeInsets.only(right: 28),
                                child: Icon(CupertinoIcons.delete),
                              ),
                            ),
                            key: ValueKey(playlist),
                            child: PlaylistRow(playlist: playlist),
                          ),
                        );
                      },
                      childCount: playlists.length,
                    ),
                  ),
                  const BottomSpace(),
                ];
              }

              return PullToRefresh(
                onRefresh: () => _loading ? Future(() => null) : makeRequest(),
                child: CustomScrollView(slivers: widgets),
              );
            },
            child: CupertinoSliverNavigationBar(
              backgroundColor: AppColors.staticScreenHeaderBackground,
              largeTitle: const LargeTitle(text: 'Playlists'),
              trailing: IconButton(
                onPressed: () => widget.router.showCreatePlaylistSheet(context),
                icon: const Icon(CupertinoIcons.add_circled),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> confirmDelete(
    BuildContext context, {
    required Playlist playlist,
  }) async {
    return await showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: <InlineSpan>[
                const TextSpan(text: 'Delete the playlist '),
                TextSpan(
                  text: playlist.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: '?'),
              ],
            ),
          ),
          content: const Text('You cannot undo this action.'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text('Cancel'),
              onPressed: () => Navigator.pop(context, false),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }
}

class NoPlaylistsScreen extends StatelessWidget {
  final void Function() onTap;

  const NoPlaylistsScreen({super.key, required this.onTap});

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
            MaterialButton(
                child: Text("X"),
                onPressed: ()=>{
                Navigator.of(context).pop()
              }),
          const Icon(
            CupertinoIcons.exclamationmark_square,
            size: 56.0,
          ),
          const Text('You have no playlists in your library.'),
          ElevatedButton(onPressed: onTap, child: Text('Create Playlist')),
        ],
      ),
    );
  }
}
