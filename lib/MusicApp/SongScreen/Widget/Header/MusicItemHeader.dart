// ignore_for_file: non_constant_identifier_names

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:music_app/MusicApp/SongScreen/Widget/Header/HeaderBackButton.dart';
import 'package:music_app/MusicApp/SongScreen/Widget/Header/HeaderMusicItemFavouriteButton.dart';
import 'package:music_app/MusicApp/SongScreen/Widget/Header/HeaderNowPlayingMusicName.dart';

class MusicItemHeader extends StatefulWidget {
  final int FavouriteMusicIndex;
  const MusicItemHeader({super.key, required this.FavouriteMusicIndex});

  @override
  State<MusicItemHeader> createState() => _FavouriteMusicHeaderState();
}

class _FavouriteMusicHeaderState extends State<MusicItemHeader> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HeaderBackButton(audioPlayer: _audioPlayer),
        const Gap(10),
        HeaderNowPlayingMusicName(widget: widget),
        const Gap(10),
        HeaderMusicItemFavouriteButton(widget: widget)
      ],
    );
  }
}
