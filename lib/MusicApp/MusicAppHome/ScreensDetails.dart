// ignore_for_file: file_names


import 'package:music_app/MusicApp/FavouriteMusicScreen/FavouriteMusicScreen.dart';
import 'package:music_app/MusicApp/HomeScreen/Screen/Home.dart';

class Screens {

  static const List<Map<String, dynamic>> screens = [
    {
      "id": 1,
      "title": "Home",
      "screen": Home(),
    },
    {
      "id": 2,
      "title": "Favourite Music",
      "screen": FavouriteSongScreen(),
    }
  ];
}
