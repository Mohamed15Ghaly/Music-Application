// ignore_for_file: file_names, non_constant_identifier_names, must_be_immutable

import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:music_app/MusicApp/MusicAppHome/MusicModel.dart';
import 'package:music_app/MusicApp/SongScreen/Widget/Body/MusicItemDetails.dart';
import 'package:music_app/MusicApp/SongScreen/Widget/Body/MusicItemImage.dart';
import 'package:music_app/MusicApp/SongScreen/Widget/Body/MusicItemSlider.dart';
import 'package:music_app/MusicApp/SongScreen/Widget/Body/MusicItemTime.dart';
import 'package:music_app/MusicApp/SongScreen/Widget/Header/MusicItemHeader.dart';
import 'package:music_app/core/resourses/colors.dart';

class Song extends StatefulWidget {
  int MusicIndex;
  Song({super.key, required this.MusicIndex});

  @override
  State<Song> createState() => _SongState();
}

class _SongState extends State<Song> with TickerProviderStateMixin {
  final AudioPlayer _audioPlayer = AudioPlayer();
  late AnimationController _animationControllerPlayPause,
      _animationControllerMenuClose;
  Duration duration = Duration.zero, position = Duration.zero;
  bool isPlaying = false, isOpen = false;
  double Roating = 0;
  int Time = 1000;
  Random randomNumber = Random();
  List<int> i = [];

  @override
  void initState() {
    _animationControllerPlayPause = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animationControllerMenuClose = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    super.initState();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _animationControllerPlayPause.dispose();
    _animationControllerMenuClose.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Column(children: [
          MusicItemHeader(FavouriteMusicIndex: widget.MusicIndex),
          const Divider(),
          const Gap(20),
          Column(children: [
            MusicItemImage(widget: widget, Roating: Roating, Time: Time),
            const Gap(20),
            MusicItemDetails(widget: widget),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        isOpen = !isOpen;
                      });
                      if (isOpen) {
                        _animationControllerMenuClose.forward();
                        showModalBottomSheet(
                            isDismissible: true,
                            context: context,
                            builder: (builder) => Container(
                                  height: MediaQuery.sizeOf(context).height / 4,
                                  color: ColorsManager.primary,
                                  child: ListView.builder(
                                      itemBuilder: (cxt, index) => Card(
                                            child: ListTile(
                                                onTap: () {
                                                  setState(() {
                                                    widget.MusicIndex = index;
                                                    Time = 0;
                                                    Roating = 0;
                                                    _audioPlayer.pause();
                                                    _animationControllerPlayPause
                                                        .reverse();
                                                  });
                                                },
                                                title: Text(
                                                  "${Music.MusicItems[index]["title"]}",
                                                ),
                                                leading: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  child: SizedBox(
                                                    height: 50,
                                                    width: 50,
                                                    child: Image.asset(
                                                      "${Music.MusicItems[index]["image"]}",
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                                subtitle: Text(
                                                  "${Music.MusicItems[index]["artist"]}",
                                                ),
                                                tileColor:
                                                    ColorsManager.primary,
                                                trailing: Icon(
                                                  widget.MusicIndex == index
                                                      ? Icons.arrow_left
                                                      : null,
                                                ),
                                                selected:
                                                    widget.MusicIndex == index),
                                          ),
                                      itemCount: Music.MusicItems.length),
                                )).whenComplete(() => setState(() {
                              isOpen = false;
                              _animationControllerMenuClose.reverse();
                              Time = 0;
                              Roating = 0;
                              duration = Duration.zero;
                              position = Duration.zero;
                              _audioPlayer.pause();
                              _animationControllerPlayPause.reverse();
                            }));
                      }
                    },
                    icon: AnimatedIcon(
                      icon: AnimatedIcons.menu_close,
                      progress: _animationControllerMenuClose,
                      color: ColorsManager.secondary,
                      size: 30,
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.volume_up_rounded)),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        Time = 0;
                        Roating = 0;
                        duration = Duration.zero;
                        position = Duration.zero;
                        _audioPlayer.pause();
                        _animationControllerPlayPause.reverse();
                        if (widget.MusicIndex > 0) {
                          widget.MusicIndex = widget.MusicIndex - 1;
                        } else {
                          widget.MusicIndex = Music.MusicItems.length - 1;
                        }
                      });
                    },
                    icon: const Icon(Icons.skip_previous),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      print(position);
                      setState(() {
                        isPlaying = !isPlaying;
                        if (isPlaying) {
                          _animationControllerPlayPause.forward();
                          _audioPlayer.play(AssetSource(
                              "${Music.MusicItems[widget.MusicIndex]["song"]}"));
                          _audioPlayer.onPlayerComplete.listen((event) {
                            setState(() {
                              Time = 0;
                              Roating = 0;
                              position = Duration.zero;
                              _audioPlayer.pause();
                              _animationControllerPlayPause.reverse();
                              isPlaying = !isPlaying;
                            });
                          });
                          _audioPlayer.onDurationChanged.listen((newDuration) {
                            duration = newDuration;
                          });
                          _audioPlayer.onPositionChanged.listen((event) {
                            setState(() {
                              Roating = Roating + .1;
                              Time = Time + 500;
                              position = event;
                            });
                          });
                        } else {
                          Time = 0;
                          Roating = 0;
                          _audioPlayer.pause();
                          _animationControllerPlayPause.reverse();
                          _audioPlayer.onDurationChanged.listen((newDuration) {
                            duration = newDuration;
                          });
                        }
                      });
                    },
                    icon: AnimatedIcon(
                      icon: AnimatedIcons.play_pause,
                      progress: _animationControllerPlayPause,
                      color: ColorsManager.secondary,
                      size: 30,
                    ),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        Time = 0;
                        Roating = 0;
                        duration = Duration.zero;
                        position = Duration.zero;
                        _audioPlayer.pause();
                        _animationControllerPlayPause.reverse();
                        if (widget.MusicIndex < Music.MusicItems.length - 1) {
                          widget.MusicIndex = widget.MusicIndex + 1;
                        } else {
                          widget.MusicIndex = 0;
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.skip_next,
                    ),
                  ),
                ),
                Expanded(
                    child: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.repeat))),
                Expanded(
                    child: IconButton(
                        onPressed: () {
                          for (int n = 0; n < Music.MusicItems.length; n++) {
                            if (n != widget.MusicIndex) {
                              i.add(n);
                            }
                          }
                          setState(() {
                            widget.MusicIndex = i[randomNumber
                                .nextInt(Music.MusicItems.length - 1)];
                            Time = 0;
                            Roating = 0;
                            duration = Duration.zero;
                            position = Duration.zero;
                            _audioPlayer.pause();
                            _animationControllerPlayPause.reverse();
                            i.clear();
                          });
                        },
                        icon: const Icon(Icons.shuffle))),
              ],
            ),
            MusicItemSlider(
                position: position,
                duration: duration,
                audioPlayer: _audioPlayer),
            MusicItemTime(position: position, duration: duration)
          ])
        ]),
      )),
    );
  }
}
