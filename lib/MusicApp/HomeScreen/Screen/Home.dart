import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:music_app/MusicApp/HomeScreen/Widget/PopularMusic.dart';
import 'package:music_app/MusicApp/HomeScreen/Widget/TrendingMusic.dart';
import 'package:music_app/MusicApp/HomeScreen/Widget/WelcomeBanner.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: const EdgeInsets.all(20),
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WelcomeBanner(),
                Gap(25),
                Text(
                  "Trending Music",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Gap(10),
                TrendingMusic(),
                Gap(25),
                Text(
                  "Popular Music",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Gap(10),
              ],
            ),
          ),
        ],
        body: const PopularMusic(),
      ),
    )));
  }
}
