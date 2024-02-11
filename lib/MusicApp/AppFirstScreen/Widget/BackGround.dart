import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  const BackGround({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
        "assets/images/front-view-smiley-woman-with-headphones.jpg",
        fit: BoxFit.contain);
  }
}
