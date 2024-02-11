import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:music_app/core/resourses/colors.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Gap(10),
        SizedBox(
          height: 50,
          child: TextField(
            cursorColor: ColorsManager.secondary,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(color: ColorsManager.secondary)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(color: ColorsManager.third)),
              labelText: 'Search Music',
              labelStyle: TextStyle(
                color: ColorsManager.third,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              prefixIcon: Icon(
                Icons.search,
                color: ColorsManager.third,
                size: 25,
              ),
              suffixIcon: Icon(
                Icons.filter_list_sharp,
                color: ColorsManager.third,
                size: 20,
              ),
            ),
          ),
        )
      ],
    );
  }
}
