// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:music_app/MusicApp/AppFirstScreen/Widget/AppFirstScreenBodyItems.dart';
import 'package:music_app/core/resourses/colors.dart';

class BackGroundDecoration extends StatelessWidget {
  const BackGroundDecoration({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                ColorsManager.secondary.withOpacity(.5),
                ColorsManager.secondary
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.5, 0.7],
              tileMode: TileMode.clamp)),
      child: const AppFirstScreenBodyItems(),
    );
  }
}
