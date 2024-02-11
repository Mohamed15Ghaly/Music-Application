// ignore_for_file: file_names

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:music_app/MusicApp/HomeScreen/Widget/PopupMenuItems.dart';
import 'package:music_app/MusicApp/MusicAppHome/MusicModel.dart';
import 'package:music_app/core/resourses/colors.dart';


class TrendingMusic extends StatelessWidget {
  const TrendingMusic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 4,
      width: MediaQuery.sizeOf(context).width,
      child: Swiper(
        viewportFraction: .7,
        scale: .9,
        itemCount: Music.MusicItems.length,
        layout: SwiperLayout.DEFAULT,
        itemBuilder: (context, index) => ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GridTile(
            footer: GridTileBar(
                title: Text("${Music.MusicItems[index]["title"]}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "ClashDisplay",
                    )),
                subtitle: Text("${Music.MusicItems[index]["artist"]}",
                    style: const TextStyle(
                      fontFamily: "ClashDisplay",
                    )),
                leading: const Icon(Icons.queue_music_outlined),
                trailing: MusicItemPopupMenu(index: index),
               
                backgroundColor: ColorsManager.secondary.withOpacity(.5)),
            child: Tooltip(
              showDuration: const Duration(milliseconds: 1000),
              waitDuration: const Duration(milliseconds: 1000),
              triggerMode: TooltipTriggerMode.tap,
              preferBelow: false,
              verticalOffset: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorsManager.secondary.withOpacity(.5),
              ),
              padding: const EdgeInsets.all(10),
              textStyle: const TextStyle(
                color: ColorsManager.primary,
                fontSize: 12,
              ),
              message: "${Music.MusicItems[index]["title"]}",
              child: Image.asset(
                "${Music.MusicItems[index]["image"]}",
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
