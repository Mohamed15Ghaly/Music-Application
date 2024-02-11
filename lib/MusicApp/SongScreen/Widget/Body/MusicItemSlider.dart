// ignore_for_file: must_be_immutable

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/core/resourses/colors.dart';

class MusicItemSlider extends StatefulWidget {
  MusicItemSlider(
      {super.key,
      required this.position,
      required this.duration,
      required this.audioPlayer});

  Duration position;
  Duration duration;
  final AudioPlayer audioPlayer;

  @override
  State<MusicItemSlider> createState() => _MusicItemSliderState();
}

class _MusicItemSliderState extends State<MusicItemSlider> {
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
          valueIndicatorTextStyle: const TextStyle(
            color: ColorsManager.primary,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: "ClashDisplay",
          ),
          trackShape: const RoundedRectSliderTrackShape(),
          overlayShape: SliderComponentShape.noOverlay,
          activeTrackColor: ColorsManager.secondary,
          inactiveTrackColor: ColorsManager.third,
          thumbColor: ColorsManager.secondary,
          overlayColor: ColorsManager.secondary,
          trackHeight: 5,
          thumbShape: const RoundSliderThumbShape(
            enabledThumbRadius: 10,
            disabledThumbRadius: 15,
            elevation: 0,
          )),
      child: Slider(
        onChanged: (value) {
          setState(() {
            widget.position = Duration(seconds: value.toInt());
            widget.audioPlayer.seek(widget.position);
          });
        },
        min: 0,
        max: widget.duration.inSeconds.toDouble(),
        value: widget.position.inSeconds.toDouble(),
        divisions: 100,
        label:
            "${widget.position.inMinutes}:${widget.position.inSeconds.remainder(60)}",
      ),
    );
  }
}
