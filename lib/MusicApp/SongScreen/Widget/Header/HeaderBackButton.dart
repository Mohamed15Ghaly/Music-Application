import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/MusicApp/MusicAppHome/HomeMusicApp.dart';
import 'package:music_app/core/resourses/colors.dart';


class HeaderBackButton extends StatefulWidget {
  const HeaderBackButton({
    super.key,
    required AudioPlayer audioPlayer,
  }) : _audioPlayer = audioPlayer;

  final AudioPlayer _audioPlayer;

  @override
  State<HeaderBackButton> createState() => _HeaderBackButtonState();
}

class _HeaderBackButtonState extends State<HeaderBackButton> {
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
            widget._audioPlayer.stop();
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const AppHome()));
          },
          icon: const Icon(
            Icons.arrow_back,
            color: ColorsManager.secondary,
            size: 15,
          )),
    );
  }
}
