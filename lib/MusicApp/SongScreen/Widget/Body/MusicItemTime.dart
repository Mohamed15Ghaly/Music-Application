import 'package:flutter/material.dart';
import 'package:music_app/core/resourses/colors.dart';

class MusicItemTime extends StatelessWidget {
  const MusicItemTime({
    super.key,
    required this.position,
    required this.duration,
  });

  final Duration position;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${position.inMinutes}:${position.inSeconds.remainder(60)}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.secondary),
            ),
            Text(
              "${duration.inMinutes}:${duration.inSeconds.remainder(60)}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.secondary),
            ),
          ]),
    );
  }
}