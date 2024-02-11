import 'package:flutter/material.dart';
import 'package:music_app/MusicApp/AppFirstScreen/Screen/AppFirstScreen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "ClashDisplay", useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home: const AppFirstScreen(),
    );
  }
}
