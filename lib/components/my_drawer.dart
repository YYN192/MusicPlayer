import 'package:flutter/material.dart';
import 'package:music_player/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          //logo head

          DrawerHeader(
              child: Center(
                  child: Icon(
            Icons.queue_music_outlined,
            size: 40,
            color: Theme.of(context).colorScheme.inversePrimary,
          ))),

          //home tile
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 25),
            child:  ListTile(
              title: const Text("H O M E"),
              leading: Icon(Icons.home,size: 20,color: Theme.of(context).colorScheme.inversePrimary,),
              onTap: () => Navigator.pop(context),
            ),
          ) ,
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 0),
            child:  ListTile(
              title: const Text("Settings"),
              leading: Icon(Icons.settings,size: 20,color: Theme.of(context).colorScheme.inversePrimary,),
              onTap: (){
                //pop drawer
                Navigator.pop(context);

                //navigate to setting page
                Navigator.push(context,MaterialPageRoute(builder: (context) => const SettingsPage(),
                ),
                );
              },
            ),
          )
          // settings tile
        ],
      ),
    );
  }
}
