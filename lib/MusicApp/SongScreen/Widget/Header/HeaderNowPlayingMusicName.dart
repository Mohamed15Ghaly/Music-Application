import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:music_app/MusicApp/MusicAppHome/MusicModel.dart';
import 'package:music_app/MusicApp/SongScreen/Widget/Header/MusicItemHeader.dart';


class HeaderNowPlayingMusicName extends StatelessWidget {
  const HeaderNowPlayingMusicName({
    super.key,
    required this.widget,
  });

  final MusicItemHeader widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 25,
        width: MediaQuery.sizeOf(context).width,
        child: Marquee(
          text:
              'Now playing : ${Music.MusicItems[widget.FavouriteMusicIndex]["title"]}',
          style: const TextStyle(fontWeight: FontWeight.bold),
          scrollAxis: Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.start,
          blankSpace: 20.0,
          velocity: 100.0,
          startPadding: 10.0,
          accelerationCurve: Curves.linear,
          decelerationCurve: Curves.easeOut,
        ),
      ),
    );
  }
}
