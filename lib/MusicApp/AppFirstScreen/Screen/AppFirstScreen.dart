import 'package:flutter/material.dart';
import 'package:music_app/MusicApp/AppFirstScreen/Widget/AppFirstScreenBody.dart';
import 'package:music_app/MusicApp/AppFirstScreen/Widget/BackGround.dart';

class AppFirstScreen extends StatefulWidget {
  const AppFirstScreen({super.key});

  @override
  State<AppFirstScreen> createState() => _AppFirstScreenState();
}

class _AppFirstScreenState extends State<AppFirstScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: const Stack(
        children: [
          BackGround(),
          AppFirstScreenBody(),
        ],
      ),
    ));
  }
}
