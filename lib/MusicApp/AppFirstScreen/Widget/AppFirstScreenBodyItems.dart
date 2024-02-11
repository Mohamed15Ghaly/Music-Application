// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:music_app/MusicApp/AppFirstScreen/Widget/AppHint.dart';
import 'package:music_app/MusicApp/AppFirstScreen/Widget/GetStartButton.dart';

class AppFirstScreenBodyItems extends StatelessWidget {
  const AppFirstScreenBodyItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Spacer(),
      // UserChooseMode(),
      Gap(35),
      AppHint(),
      GetStartButton(),
      Gap(75),
    ]);
  }
}
