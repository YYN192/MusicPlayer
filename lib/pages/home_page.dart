import 'package:flutter/material.dart';
import 'package:music_player/models/playlist_provider.dart';
import 'package:music_player/components/my_drawer.dart';
import 'package:music_player/pages/song_page.dart';
import 'package:provider/provider.dart';

import '../models/song.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // get the play list provider
  late final dynamic playlistProvider;

  @override
  void initState() {
    super.initState();

    // get playlist provider
    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }
  // go to a song
  void goToSong(int songIndex) {
    // update current song index
    playlistProvider.currentSongIndex = songIndex;
    // navigate to song page
    Navigator.push(context, MaterialPageRoute(builder: (context)=> const SongPage(),),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
      Theme.of(context).colorScheme.surface, // Use background color
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(right: 30),
          child: Center(child: Text("P L A Y L I S T")),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context)
            .colorScheme
            .primary, // Use primary color for the AppBar
      ),
      body: Consumer<PlaylistProvider>(
        builder: (context, value, child) {
          // get the playlist
          final List<Song> playlist = value.playlist;

          // return list view UI
          return ListView.builder(
            itemCount: playlist.length,
            itemBuilder: (context, index) {
              // get individual song
              final Song song = playlist[index];

              // return list tile UI
              return ListTile(
                title: Text(song.songName),
                subtitle: Text(song.artistName),
                leading: Image.asset(song.AlbumArtImagePath),
                onTap: () => goToSong(index),
              );
            },
          );
        },
      ),
    );
  }
}
