import 'package:flutter/material.dart';
import 'package:music_player/components/neu_box.dart';
import 'package:music_player/models/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  // convert duration into min:sec
  String formatTime(Duration duration) {
    String twoDigitSeconds = duration.inSeconds.remainder(60).toString().padLeft(2,'0');
    String formattedTime = '${duration.inMinutes}:$duration.twoDigitSeconds';

    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) {
        // get playlist

        final playlist = value.playlist;

        //get current song index

        final currentSong = playlist[value.currentSongIndex ?? 0];

        //return scaffold ui

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App bar
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back button
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                      // Title
                      const Text('P L A Y L I S T'),
                      // Menu button
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.menu),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25), // Space between app bar and content

                // Album artwork
                NeuBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Album artwork
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          currentSong.AlbumArtImagePath,
                          width: double.infinity,
                          fit: BoxFit
                              .cover, // Ensure image covers the container while maintaining aspect ratio
                        ),
                      ),
                      const SizedBox(
                          height: 10), // Space between image and text

                      // Song details
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Song and artist name
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentSong.songName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(currentSong.artistName),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // song duration
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // start time
                          Text(formatTime(value.currentDuration)),
                          // shuffle icon
                          Icon(Icons.shuffle),
                          // repeat icon
                          Icon(Icons.repeat),
                          // end time
                          Text(formatTime(value.totalDuraion)),
                        ],
                      ),
                    ),

                    // song duration progress
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 0),
                      ),
                      child: Slider(
                        min: 0,
                        max: value.totalDuraion.inSeconds.toDouble(),
                        value: value.totalDuraion.inSeconds.toDouble(),
                        activeColor: Colors.green,
                        onChanged: (double double) {},
                        onChangeEnd: (double double) {
                          value.seek(Duration(seconds: double.toInt()));
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),

                // playback controls
                Row(
                  children: [
                    // skip previous
                    Expanded(
                      child: GestureDetector(
                        onTap: value.playPreviousSong,
                        child: const NeuBox(child: Icon(Icons.skip_previous)),
                      ),
                    ),
                    const SizedBox(width: 20),

                    // play pause
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        child: NeuBox(
                            child: Icon(value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow)),
                        onTap: value.pauseOrResume,
                      ),
                    ),
                    const SizedBox(width: 20),

                    // skip forward
                    Expanded(
                      child: GestureDetector(
                        child: const NeuBox(child: Icon(Icons.skip_next)),
                        onTap: value.playNextSong,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
