import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  //playlist of songs
  final List<Song> _playlist = [
    Song(
        songName: 'Harder, Better, Faster, Stronger',
        artistName: 'Daft Punk',
        AlbumArtImagePath: 'assets/images/Discovery.jpg',
        audioPath:
            'audio/Daft Punk - Harder, Better, Faster, Stronger (Official Audio).mp3'),
    Song(
        songName: 'Digital Baptism',
        artistName: 'Falconite',
        AlbumArtImagePath: 'assets/images/Digital Baptism.jpg',
        audioPath: 'audio/Digital Baptism.mp3'),
    Song(
        songName: 'Infinity Repeating  ',
        artistName: 'Daft Punk',
        AlbumArtImagePath:
            'assets/images/Random Access Memories(10th Anniversary Edition).jpg',
        audioPath:
            'audio/Infinity Repeating (2013 Demo) (feat. Julian Casablancas+The Voidz).mp3'),
  ];
  // current song playing
  int? _currentSongIndex;
  /*

  A U D I O P L A Y E R

 */

  // audio player
  final AudioPlayer _audioPlayer = AudioPlayer(); 

  // durations
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  // constructor
  PlaylistProvider() {
    listenToDuration();
  }

  // initially not playing
  bool _isPlaying = false;

  //play the song
  void play() async {
    final String path = _playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
    _isPlaying = true;
    notifyListeners();
  }

  // pause the song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  // resume playing
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  // pause or resume
  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  // seek to a specific position in the current song
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  // play the next song
  void playNextSong() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length - 1) {
        // go to next song if its not the last song
        currentSongIndex = _currentSongIndex!+ 1;
      }else{
        // go to first song
        currentSongIndex = 0;
      }
    }
  }
  //play previous song
  void playPreviousSong() async {
    // if more than 2 seconds have passed, restart the current song
    if(_currentDuration.inSeconds > 2) {
      // if its within first 2 second of the song , go to previous song
      seek(Duration.zero);
    }else {
      if (_currentSongIndex!>0){
        currentSongIndex = _currentSongIndex!-1;
      }else{
        //if its not hte first song loop back to the last song
        currentSongIndex = _playlist.length -1;
      }
    }
  }
  // list durations
  void listenToDuration() {
    // listen for the total duration
    _audioPlayer.onDurationChanged.listen((neuDuration) {
      _totalDuration = neuDuration;
      notifyListeners();
    });

    // listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });
    // listen for song competition
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }

  // dispose audio player

  /*

  G E T T E R S

  */
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuraion => _totalDuration;
  /*

  S E T T E R S

  */

  set currentSongIndex(int? newIndex) {
    // update current song index
    _currentSongIndex = newIndex;

    if (newIndex != null) {
      play(); // play the song at the new index
    }

    // update UI
    notifyListeners();
  }
}
