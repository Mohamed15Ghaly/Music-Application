import 'package:flutter/material.dart';
import 'package:music_app/core/resourses/colors.dart';

class AppHint extends StatelessWidget {
  const AppHint({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("Enjoy Listening to Music",
        style: TextStyle(
          color: ColorsManager.primary,
          fontWeight: FontWeight.bold,
          fontSize: 25,
        )),
    Padding(
      padding: EdgeInsets.all(20.0),
      child: Text(
          textAlign: TextAlign.center,
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
          style: TextStyle(
            color: ColorsManager.primary,
            fontSize: 10,
            overflow: TextOverflow.fade,
          )),
    ),
      ]
    );
  }
}