// Mocks generated by Mockito 5.0.12 from annotations
// in app/test/ui/widgets/footer_player_sheet_test.dart.
// Do not manually edit this file.

import 'dart:async' as i11;
import 'dart:ui' as i12;

import 'package:app/models/album.dart' as i15;
import 'package:app/models/artist.dart' as i14;
import 'package:app/models/song.dart' as i9;
import 'package:app/providers/album_provider.dart' as i5;
import 'package:app/providers/artist_provider.dart' as i4;
import 'package:app/providers/audio_provider.dart' as i10;
import 'package:app/providers/download_provider.dart' as i6;
import 'package:app/providers/playable_provider.dart' as i13;
import 'package:app/router.dart' as i16;
import 'package:app/ui/widgets/app_bar.dart' as i7;
import 'package:assets_audio_player/assets_audio_player.dart' as i2;
import 'package:flutter/cupertino.dart' as i8;
import 'package:mockito/mockito.dart' as i1;
import 'package:rxdart/rxdart.dart' as i3;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeAssetsAudioPlayer extends i1.Fake
    implements i2.AssetsAudioPlayer {}

class _FakeValueStream<T> extends i1.Fake implements i3.ValueStream<T> {}

class _FakeArtistProvider extends i1.Fake implements i4.ArtistProvider {}

class _FakeAlbumProvider extends i1.Fake implements i5.AlbumProvider {}

class _FakeCacheProvider extends i1.Fake implements i6.DownloadProvider {}

class _FakeCoverImageStack extends i1.Fake implements i7.CoverImageStack {
  @override
  String toString({i8.DiagnosticLevel? minLevel = i8.DiagnosticLevel.info}) =>
      super.toString();
}

class _FakeSong extends i1.Fake implements i9.Song {}

/// A class which mocks [AudioProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockAudioProvider extends i1.Mock implements i10.AudioProvider {
  MockAudioProvider() {
    i1.throwOnMissingStub(this);
  }

  @override
  i2.AssetsAudioPlayer get player =>
      (super.noSuchMethod(Invocation.getter(#player),
          returnValue: _FakeAssetsAudioPlayer()) as i2.AssetsAudioPlayer);

  @override
  List<i9.Song> get queuedSongs =>
      (super.noSuchMethod(Invocation.getter(#queuedSongs),
          returnValue: <i9.Song>[]) as List<i9.Song>);

  @override
  i3.ValueStream<i2.PlayerState> get playerState =>
      (super.noSuchMethod(Invocation.getter(#playerState),
              returnValue: _FakeValueStream<i2.PlayerState>())
          as i3.ValueStream<i2.PlayerState>);

  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);

  @override
  i11.Future<void> init() => (super.noSuchMethod(Invocation.method(#init, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as i11.Future<void>);

  @override
  i11.Future<bool> queued(i9.Song? song) =>
      (super.noSuchMethod(Invocation.method(#queued, [song]),
          returnValue: Future<bool>.value(false)) as i11.Future<bool>);

  @override
  i11.Future<int> getQueuePosition(i9.Song? song) =>
      (super.noSuchMethod(Invocation.method(#indexInQueue, [song]),
          returnValue: Future<int>.value(0)) as i11.Future<int>);

  @override
  i11.Future<void> play({i9.Song? song}) => (super.noSuchMethod(
      Invocation.method(#play, [], {#song: song}),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as i11.Future<void>);

  @override
  i11.Future<void> stop() => (super.noSuchMethod(Invocation.method(#stop, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as i11.Future<void>);

  @override
  i11.Future<int> queueToTop({i9.Song? song}) =>
      (super.noSuchMethod(Invocation.method(#queueToTop, [], {#song: song}),
          returnValue: Future<int>.value(0)) as i11.Future<int>);

  @override
  i11.Future<int> queueToBottom({i9.Song? song}) =>
      (super.noSuchMethod(Invocation.method(#queueToBottom, [], {#song: song}),
          returnValue: Future<int>.value(0)) as i11.Future<int>);

  @override
  i11.Future<int> queueAfterCurrent({i9.Song? song}) => (super.noSuchMethod(
      Invocation.method(#queueAfterCurrent, [], {#song: song}),
      returnValue: Future<int>.value(0)) as i11.Future<int>);

  @override
  i11.Future<bool> playNext() =>
      (super.noSuchMethod(Invocation.method(#playNext, []),
          returnValue: Future<bool>.value(false)) as i11.Future<bool>);

  @override
  i11.Future<void> playOrPause() => (super.noSuchMethod(
      Invocation.method(#playOrPause, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as i11.Future<void>);

  @override
  i11.Future<void> replaceQueue(List<i9.Song>? songs,
          {dynamic shuffle = false}) =>
      (super.noSuchMethod(
              Invocation.method(#replaceQueue, [songs], {#shuffle: shuffle}),
              returnValue: Future<void>.value(),
              returnValueForMissingStub: Future<void>.value())
          as i11.Future<void>);

  @override
  void clearQueue() => super.noSuchMethod(Invocation.method(#clearQueue, []),
      returnValueForMissingStub: null);

  @override
  i11.Future<void> removeFromQueue({i9.Song? song}) => (super.noSuchMethod(
      Invocation.method(#removeFromQueue, [], {#song: song}),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as i11.Future<void>);

  @override
  void reorderQueue(int? oldIndex, int? newIndex) =>
      super.noSuchMethod(Invocation.method(#reorderQueue, [oldIndex, newIndex]),
          returnValueForMissingStub: null);

  @override
  i11.Future<void> cleanUpUponLogout() => (super.noSuchMethod(
      Invocation.method(#cleanUpUponLogout, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as i11.Future<void>);

  @override
  void unsubscribeAll() =>
      super.noSuchMethod(Invocation.method(#unsubscribeAll, []),
          returnValueForMissingStub: null);

  @override
  void subscribe(i11.StreamSubscription<dynamic>? sub) =>
      super.noSuchMethod(Invocation.method(#subscribe, [sub]),
          returnValueForMissingStub: null);

  @override
  void addListener(i12.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]),
          returnValueForMissingStub: null);

  @override
  void removeListener(i12.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]),
          returnValueForMissingStub: null);

  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);

  @override
  void notifyListeners() =>
      super.noSuchMethod(Invocation.method(#notifyListeners, []),
          returnValueForMissingStub: null);
}

/// A class which mocks [playableProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockplayableProvider extends i1.Mock implements i13.PlayableProvider {
  MockplayableProvider() {
    i1.throwOnMissingStub(this);
  }

  @override
  i4.ArtistProvider get _artistProvider =>
      (super.noSuchMethod(Invocation.getter(#artistProvider),
          returnValue: _FakeArtistProvider()) as i4.ArtistProvider);

  @override
  set _artistProvider(i4.ArtistProvider? artistProvider) =>
      super.noSuchMethod(Invocation.setter(#artistProvider, artistProvider),
          returnValueForMissingStub: null);

  @override
  i5.AlbumProvider get _albumProvider =>
      (super.noSuchMethod(Invocation.getter(#albumProvider),
          returnValue: _FakeAlbumProvider()) as i5.AlbumProvider);

  @override
  set _albumProvider(i5.AlbumProvider? albumProvider) =>
      super.noSuchMethod(Invocation.setter(#albumProvider, albumProvider),
          returnValueForMissingStub: null);

  @override
  i6.DownloadProvider get _downloadProvider =>
      (super.noSuchMethod(Invocation.getter(#cacheProvider),
          returnValue: _FakeCacheProvider()) as i6.DownloadProvider);

  @override
  set _downloadProvider(i6.DownloadProvider? cacheProvider) =>
      super.noSuchMethod(Invocation.setter(#cacheProvider, cacheProvider),
          returnValueForMissingStub: null);

  @override
  i7.CoverImageStack get coverImageStack =>
      (super.noSuchMethod(Invocation.getter(#coverImageStack),
          returnValue: _FakeCoverImageStack()) as i7.CoverImageStack);

  @override
  set coverImageStack(i7.CoverImageStack? coverImageStack) =>
      super.noSuchMethod(Invocation.setter(#coverImageStack, coverImageStack),
          returnValueForMissingStub: null);

  @override
  List<i9.Song> get playables =>
      (super.noSuchMethod(Invocation.getter(#songs), returnValue: <i9.Song>[])
          as List<i9.Song>);

  @override
  i11.Future<void> init(List<dynamic>? songData) => (super.noSuchMethod(
      Invocation.method(#init, [songData]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as i11.Future<void>);

  @override
  void initInteractions(List<dynamic>? interactionData) => super.noSuchMethod(
      Invocation.method(#initInteractions, [interactionData]),
      returnValueForMissingStub: null);

  @override
  List<i9.Song> recentlyAdded({int? limit = 5}) => (super.noSuchMethod(
      Invocation.method(#recentlyAdded, [], {#limit: limit}),
      returnValue: <i9.Song>[]) as List<i9.Song>);

  @override
  List<i9.Song> mostPlayed({int? limit = 15}) =>
      (super.noSuchMethod(Invocation.method(#mostPlayed, [], {#limit: limit}),
          returnValue: <i9.Song>[]) as List<i9.Song>);

  @override
  List<i9.Song> leastPlayed({int? limit = 15}) =>
      (super.noSuchMethod(Invocation.method(#leastPlayed, [], {#limit: limit}),
          returnValue: <i9.Song>[]) as List<i9.Song>);

  @override
  i9.Song byId(String? id) =>
      (super.noSuchMethod(Invocation.method(#byId, [id]),
          returnValue: _FakeSong()) as i9.Song);

  @override
  i9.Song? tryById(String? id) =>
      (super.noSuchMethod(Invocation.method(#tryById, [id])) as i9.Song?);

  @override
  List<i9.Song> byIds(List<String>? ids) =>
      (super.noSuchMethod(Invocation.method(#byIds, [ids]),
          returnValue: <i9.Song>[]) as List<i9.Song>);

  @override
  List<i9.Song> byArtist(i14.Artist? artist) =>
      (super.noSuchMethod(Invocation.method(#byArtist, [artist]),
          returnValue: <i9.Song>[]) as List<i9.Song>);

  @override
  List<i9.Song> byAlbum(i15.Album? album) =>
      (super.noSuchMethod(Invocation.method(#byAlbum, [album]),
          returnValue: <i9.Song>[]) as List<i9.Song>);

  @override
  List<i9.Song> favorites() =>
      (super.noSuchMethod(Invocation.method(#favorites, []),
          returnValue: <i9.Song>[]) as List<i9.Song>);
}

/// A class which mocks [AppRouter].
///
/// See the documentation for Mockito's code generation for more information.
class MockAppRouter extends i1.Mock implements i16.AppRouter {
  MockAppRouter() {
    i1.throwOnMissingStub(this);
  }

  @override
  i11.Future<void> gotoAlbumDetailsScreen(i8.BuildContext? context,
          {i15.Album? album}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #gotoAlbumDetailsScreen, [context], {#album: album}),
              returnValue: Future<void>.value(),
              returnValueForMissingStub: Future<void>.value())
          as i11.Future<void>);

  @override
  i11.Future<void> gotoArtistDetailsScreen(i8.BuildContext? context,
          {i14.Artist? artist}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #gotoArtistDetailsScreen, [context], {#artist: artist}),
              returnValue: Future<void>.value(),
              returnValueForMissingStub: Future<void>.value())
          as i11.Future<void>);

  @override
  i11.Future<void> openNowPlayingScreen(i8.BuildContext? context) =>
      (super.noSuchMethod(Invocation.method(#openNowPlayingScreen, [context]),
              returnValue: Future<void>.value(),
              returnValueForMissingStub: Future<void>.value())
          as i11.Future<void>);

  @override
  i11.Future<void> showCreatePlaylistSheet(i8.BuildContext? context) => (super
          .noSuchMethod(Invocation.method(#showCreatePlaylistSheet, [context]),
              returnValue: Future<void>.value(),
              returnValueForMissingStub: Future<void>.value())
      as i11.Future<void>);

  @override
  i11.Future<void> showPlayableActionSheet(i8.BuildContext? context,
          {i9.Song? playable}) =>
      (super.noSuchMethod(
              Invocation.method(#showActionSheet, [context], {#song: playable}),
              returnValue: Future<void>.value(),
              returnValueForMissingStub: Future<void>.value())
          as i11.Future<void>);
}
