import 'package:flutter/material.dart';
import 'package:music_app/MusicApp/MusicAppHome/MusicModel.dart';
import 'package:music_app/MusicApp/SongScreen/Screen/Song.dart';
import 'package:music_app/core/resourses/colors.dart';

class MusicItemImage extends StatelessWidget {
  const MusicItemImage({
    super.key,
    required this.widget,
    required this.Roating,
    required this.Time,
  });

  final Song widget;
  final double Roating;
  final int Time;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "${Music.MusicItems[widget.MusicIndex]["id"]}",
      transitionOnUserGestures: true,
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height / 3,
        width: MediaQuery.sizeOf(context).width,
        child: Tooltip(
            showDuration: const Duration(milliseconds: 1000),
            waitDuration: const Duration(milliseconds: 1000),
            triggerMode: TooltipTriggerMode.tap,
            preferBelow: false,
            verticalOffset: -125,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ColorsManager.secondary.withOpacity(.5),
            ),
            padding: const EdgeInsets.all(10),
            textStyle: const TextStyle(
              color: ColorsManager.primary,
              fontSize: 12,
            ),
            message: "${Music.MusicItems[widget.MusicIndex]["title"]}",
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    bottom: 0,
                    right: 0,
                    left: 175,
                    top: 0,
                    child: AnimatedRotation(
                      turns: Roating,
                      duration: Duration(milliseconds: Time),
                      child: Image.asset(
                        "assets/images/cd.png",
                      ),
                    )),
                Positioned(
                  bottom: 0,
                  right: 85,
                  left: 0,
                  top: 00,
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: ColorsManager.secondary,
                            blurRadius: 1,
                          )
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: ColorsManager.secondary.withOpacity(.5),
                        image: DecorationImage(
                            image: AssetImage(
                              "${Music.MusicItems[widget.MusicIndex]["image"]}",
                            ),
                            fit: BoxFit.fill)),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
