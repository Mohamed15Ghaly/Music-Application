import 'package:flutter/material.dart';
import 'package:music_app/core/resourses/colors.dart';

class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 5,
      width: MediaQuery.sizeOf(context).width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            top: 50,
            child: Container(
              height: MediaQuery.sizeOf(context).height / 8,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorsManager.secondary,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 150,
            top: 0,
            child: Image.asset(
                "assets/images/listening-music-115309617275qhovryso9.png",
                fit: BoxFit.contain),
          ),
          const Positioned(
              bottom: 0,
              right: 175,
              left: 35,
              top: 75,
              child: Text("Welcome Dear Find Your Favourite Music",
                  style: TextStyle(
                    fontSize: 17,
                    color: ColorsManager.primary,
                    fontWeight: FontWeight.bold,
                  )))
        ],
      ),
    );
  }
}
