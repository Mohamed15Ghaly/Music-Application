import 'package:flutter/material.dart';
import 'package:music_app/MusicApp/MusicAppHome/MusicModel.dart';
import 'package:music_app/MusicApp/SongScreen/Widget/Header/MusicItemHeader.dart';
import 'package:music_app/core/resourses/colors.dart';

class HeaderMusicItemFavouriteButton extends StatefulWidget {
  const HeaderMusicItemFavouriteButton({
    super.key,
    required this.widget,
  });
  final MusicItemHeader widget;

  @override
  State<HeaderMusicItemFavouriteButton> createState() =>
      _HeaderMusicItemFavouriteButtonState();
}

class _HeaderMusicItemFavouriteButtonState
    extends State<HeaderMusicItemFavouriteButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: ColorsManager.secondary,
            width: 1.5,
          )),
      child: IconButton(
          onPressed: () {
            setState(() {
              Music.isFavouriteMusic[
                  Music.MusicItems[widget.widget.FavouriteMusicIndex]
                      ["id"]] = !Music.isFavouriteMusic[
                  Music.MusicItems[widget.widget.FavouriteMusicIndex]["id"]];
            });
            if (Music.isFavouriteMusic[
                Music.MusicItems[widget.widget.FavouriteMusicIndex]["id"]]) {
              FavouriteMusic.FavMusics.add(FavouriteMusic(
                id: Music.MusicItems[widget.widget.FavouriteMusicIndex]["id"],
                title: Music.MusicItems[widget.widget.FavouriteMusicIndex]
                    ["title"],
                image: Music.MusicItems[widget.widget.FavouriteMusicIndex]
                    ["image"],
                artist: Music.MusicItems[widget.widget.FavouriteMusicIndex]
                    ["artist"],
                song: Music.MusicItems[widget.widget.FavouriteMusicIndex]
                    ["song"],
              ));
              FavouriteMusic.FavMusicsIndex.add(
                  Music.MusicItems[widget.widget.FavouriteMusicIndex]["id"]);
            } else {
              FavouriteMusic.FavMusics.removeWhere((element) =>
                  element.id ==
                  Music.MusicItems[widget.widget.FavouriteMusicIndex]["id"]);
              FavouriteMusic.FavMusicsIndex.remove(
                  Music.MusicItems[widget.widget.FavouriteMusicIndex]["id"]);
            }
          },
          icon: Icon(
            Icons.favorite,
            size: 15,
            color: Music.isFavouriteMusic[
                    Music.MusicItems[widget.widget.FavouriteMusicIndex]["id"]]
                ? Colors.red
                : ColorsManager.third,
          )),
    );
  }
}
