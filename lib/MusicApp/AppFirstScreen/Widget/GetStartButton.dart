import 'package:flutter/material.dart';
import 'package:music_app/MusicApp/MusicAppHome/HomeMusicApp.dart';
import 'package:music_app/core/resourses/colors.dart';

class GetStartButton extends StatelessWidget {
  const GetStartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: MediaQuery.sizeOf(context).height / 12,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorsManager.primary,
      ),
      child: TextButton(
          onPressed: () {
            Navigator.pushReplacement(
                context, (MaterialPageRoute(builder: (builder) =>const  AppHome())));
          },
          child: const Text(
            "Get Started",
            style: TextStyle(color: ColorsManager.secondary),
          )),
    );
  }
}
