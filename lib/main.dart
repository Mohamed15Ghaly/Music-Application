import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_app/MusicApp/MyApp.dart';
import 'package:music_app/core/resourses/colors.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: ColorsManager.primary,
    ),
  );
}
