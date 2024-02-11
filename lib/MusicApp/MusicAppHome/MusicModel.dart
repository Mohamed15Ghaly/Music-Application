// ignore_for_file: file_names, non_constant_identifier_names, constant_identifier_names

class Music {
  static List<bool> isFavouriteMusic = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  static const List<Map<String, dynamic>> MusicItems = [
    {
      "id": 0,
      "image": "assets/images/Imagine-Dragons-Believer-art.jpg",
      "title": "Believer",
      "artist": "Imagine - Dragons",
      "song": "Music/MusicItem/Believer.mp3",
    },
    {
      "id": 1,
      "image":
          "assets/images/Havana_(featuring_Young_Thug)_(Official_Single_Cover)_by_Camila_Cabello.png",
      "title": "Havana",
      "artist": "Camila Cabello",
      "song": "Music/MusicItem/Havana.mp3",
    },
    {
      "id": 2,
      "image": "assets/images/maxresdefault.jpg",
      "title": "Shape of You",
      "artist": "Ed Sheeran",
      "song": "Music/MusicItem/ShapeOfYou.mp3",
    },
    {
      "id": 3,
      "image": "assets/images/ef70d9a1db14a75975e9b28d1967b659.jpg",
      "title": "Hello",
      "artist": "Adele",
      "song": "Music/MusicItem/Hello.mp3",
    },
    {
      "id": 4,
      "image": "assets/images/sddefault.jpg",
      "title": "Faded",
      "artist": "Alan Walker",
      "song": "Music/MusicItem/Faded.mp3",
    },
    {
      "id": 5,
      "image": "assets/images/artworks-000539543664-jb677z-t500x500.jpg",
      "title": "lovely",
      "artist": "Billie Eilish , Khalid",
      "song": "Music/MusicItem/b66d-4b5f-4362-957a-fbf92e4ed53c.mp3",
    },
    {
      "id": 6,
      "image": "assets/images/artworks-000282362234-xm8qt3-t500x500.jpg",
      "title": "New Rules",
      "artist": "Dua Lipa",
      "song": "Music/MusicItem/NewRules.mp3",
    },
    {
      "id": 7,
      "image": "assets/images/maxresdefault (2).jpg",
      "title": "I Was Never There feat",
      "artist": "The Weeknd",
      "song": "Music/MusicItem/IWasNeverThere.mp3",
    },
    {
      "id": 8,
      "image":
          "assets/images/Dusk-till-Dawn-by-Zayn-ft-Sia-Hits-1-Billion-01.jpg",
      "title": "Dusk Till Dawn",
      "artist": "Zayn",
      "song": "Music/MusicItem/DuskTillDawn.mp3",
    },
    {
      "id": 9,
      "image": "assets/images/maxresdefault (1).jpg",
      "title": "Chandelier",
      "artist": "Sia",
      "song": "Music/MusicItem/Chandelier.mp3",
    },
  ];
}

class FavouriteMusic {
  int id;
  String title;
  String image;
  String artist;
  String song;

  FavouriteMusic({
    required this.id,
    required this.title,
    required this.image,
    required this.artist,
    required this.song,
  });

  static Set<FavouriteMusic> FavMusics = {};
  static Set<int> FavMusicsIndex = {};
}
