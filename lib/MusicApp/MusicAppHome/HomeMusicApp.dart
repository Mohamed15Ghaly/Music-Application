// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/MusicApp/MusicAppHome/ScreensDetails.dart';
import 'package:music_app/MusicApp/MusicAppHome/Search.dart';
import 'package:music_app/core/resourses/colors.dart';

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> with TickerProviderStateMixin {
  int BottomNavigationBarIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: ColorsManager.primary,
            elevation: 5,
            leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.light_mode_outlined,
                )),
            iconTheme: const IconThemeData(color: ColorsManager.secondary),
            actionsIconTheme:
                const IconThemeData(color: ColorsManager.secondary),
            toolbarHeight: 50,
            titleTextStyle: const TextStyle(
              color: ColorsManager.secondary,
              fontWeight: FontWeight.bold,
            ),
            title: Text("${Screens.screens[BottomNavigationBarIndex]["title"]}",
                style: const TextStyle(
                  color: ColorsManager.secondary,
                  fontWeight: FontWeight.bold,
                  fontFamily: "ClashDisplay",
                )),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: Search(),
                    );
                  },
                  icon: const Icon(
                    Icons.search,
                  )),
              IconButton(
                  onPressed: () {
                    showCupertinoDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (builder) => CupertinoAlertDialog(
                              title: const Text("Log Out"),
                              content: const Text("are you sure ?"),
                              actions: [
                                CupertinoDialogAction(
                                  isDestructiveAction: true,
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("No"),
                                ),
                                CupertinoDialogAction(
                                  onPressed: () {
                                    exit(0);
                                  },
                                  isDefaultAction: false,
                                  child: const Text("Yes"),
                                ),
                              ],
                            ));
                  },
                  icon: const Icon(
                    Icons.logout_outlined,
                    color: ColorsManager.secondary,
                  ))
            ]),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              BottomNavigationBarIndex = index;
            });
          },
          currentIndex: BottomNavigationBarIndex,
          backgroundColor: Colors.transparent,
          selectedItemColor: ColorsManager.secondary,
          iconSize: 25,
          selectedFontSize: 15,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(color: ColorsManager.primary),
          unselectedItemColor: ColorsManager.third,
          elevation: 50,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home_rounded),
              label: '${Screens.screens[BottomNavigationBarIndex]["title"]}',
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.music_note,
              ),
              label: '${Screens.screens[BottomNavigationBarIndex]["title"]}',
            ),
          ],
        ),
        body: Screens.screens[BottomNavigationBarIndex]["screen"]);
  }
}
