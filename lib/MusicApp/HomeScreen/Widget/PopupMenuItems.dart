import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mini_music_visualizer/mini_music_visualizer.dart';
import 'package:music_app/MusicApp/MusicAppHome/MusicModel.dart';
import 'package:music_app/MusicApp/SongScreen/Screen/Song.dart';
import 'package:music_app/core/resourses/colors.dart';

class MusicItemPopupMenu extends StatefulWidget {
  const MusicItemPopupMenu({super.key, required this.index});
  final int index;

  @override
  State<MusicItemPopupMenu> createState() => _MusicItemPopupMenuState();
}

class _MusicItemPopupMenuState extends State<MusicItemPopupMenu>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
    _audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        color: ColorsManager.secondary,
        icon: const Icon(
          Icons.more_vert_rounded,
          color: ColorsManager.primary,
        ),
        itemBuilder: (context) => [
              PopupMenuItem(
                onTap: () {
                  showBottomSheet(
                      context: context,
                      enableDrag: false,
                      builder: (context) => Container(
                            padding: const EdgeInsets.all(10),
                            height: MediaQuery.sizeOf(context).height / 10,
                            width: MediaQuery.sizeOf(context).width,
                            child: Row(
                              children: [
                                const Gap(10),
                                const SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: MiniMusicVisualizer(
                                    color: ColorsManager.secondary,
                                  ),
                                ),
                                const Gap(20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        "${Music.MusicItems[widget.index]["title"]}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        )),
                                    const Gap(5),
                                    Text(
                                        "${Music.MusicItems[widget.index]["artist"]}",
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: ColorsManager.secondary,
                                        ))
                                  ],
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: ColorsManager.secondary,
                                      child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              isPlaying = !isPlaying;
                                              if (isPlaying) {
                                                _animationController.forward();
                                                _audioPlayer.play(AssetSource(
                                                    "${Music.MusicItems[widget.index]["song"]}"));
                                              } else {
                                                _audioPlayer.pause();
                                                _animationController.reverse();
                                              }
                                            });
                                          },
                                          icon: AnimatedIcon(
                                            icon: AnimatedIcons.play_pause,
                                            progress: _animationController,
                                            color: ColorsManager.primary,
                                            size: 20,
                                          )),
                                    ),
                                    const Gap(10),
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: ColorsManager.secondary,
                                      child: IconButton(
                                          onPressed: () {
                                            isPlaying = !isPlaying;
                                            _audioPlayer.pause();
                                            _animationController.reverse();
                                            Navigator.pop(context);
                                          },
                                          icon: const Icon(Icons.close,
                                              color: ColorsManager.primary)),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ));
                },
                child: const Row(
                  children: [
                    Icon(Icons.play_circle_filled_rounded),
                    Gap(5),
                    Text("Play Music"),
                  ],
                ),
              ),
              PopupMenuItem(
                onTap: () {
                  _audioPlayer.stop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => Song(
                                MusicIndex: widget.index,
                              )));
                },
                child: const Row(
                  children: [
                    Icon(Icons.view_compact),
                    Gap(5),
                    Text("View Details"),
                  ],
                ),
              ),
              PopupMenuItem(
                onTap: () {
                  if (Music.isFavouriteMusic[widget.index] == false) {
                    setState(() {
                      Music.isFavouriteMusic[widget.index] = true;
                    });
                    FavouriteMusic.FavMusics.add(FavouriteMusic(
                      id: Music.MusicItems[widget.index]["id"],
                      title: Music.MusicItems[widget.index]["title"],
                      image: Music.MusicItems[widget.index]["image"],
                      artist: Music.MusicItems[widget.index]["artist"],
                      song: Music.MusicItems[widget.index]["song"],
                    ));
                    FavouriteMusic.FavMusicsIndex.add(
                        Music.MusicItems[widget.index]["id"]);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Successfully Added to Favourite",
                          style: TextStyle()),
                      duration: Duration(seconds: 3),
                      backgroundColor: ColorsManager.secondary,
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                      showCloseIcon: true,
                      closeIconColor: ColorsManager.primary,
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("ALREADY ADDED TO FAVOURITE",
                          style: TextStyle()),
                      duration: Duration(seconds: 3),
                      backgroundColor: ColorsManager.secondary,
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                      showCloseIcon: true,
                      closeIconColor: ColorsManager.primary,
                    ));
                  }
                },
                child: const Row(
                  children: [
                    Icon(Icons.favorite),
                    Gap(5),
                    Text("Add to Favourite"),
                  ],
                ),
              ),
            ]);
  }
}
