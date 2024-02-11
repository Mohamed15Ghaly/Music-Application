import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:music_app/MusicApp/MusicAppHome/MusicModel.dart';
import 'package:music_app/MusicApp/SongScreen/Screen/Song.dart';
import 'package:music_app/core/resourses/colors.dart';


class MusicItemDetails extends StatelessWidget {
  const MusicItemDetails({
    super.key,
    required this.widget,
  });

  final Song widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "${Music.MusicItems[widget.MusicIndex]["title"]}",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
          ),
          const Gap(5),
          Text(
            "${Music.MusicItems[widget.MusicIndex]["artist"]}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: ColorsManager.third,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
