import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:music_app/MusicApp/MusicAppHome/MusicModel.dart';
import 'package:music_app/MusicApp/SongScreen/Screen/Song.dart';
import 'package:music_app/core/resourses/colors.dart';

class PopularMusic extends StatefulWidget {
  const PopularMusic({
    super.key,
  });

  @override
  State<PopularMusic> createState() => _PopularMusicState();
}

class _PopularMusicState extends State<PopularMusic> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) => Container(
              height: 75,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorsManager.primary,
              ),
              child: Row(
                children: [
                  const Gap(10),
                  ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => Song(
                                        MusicIndex: index,
                                      )));
                        },
                        child: Hero(
                          tag: "${Music.MusicItems[index]["id"]}",
                          child: Image.asset(
                            "${Music.MusicItems[index]["image"]}",
                            width: 75,
                            height: 75,
                            fit: BoxFit.fill,
                          ),
                        ),
                      )),
                  const Gap(20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("${Music.MusicItems[index]["title"]}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          )),
                      const Gap(5),
                      Text("${Music.MusicItems[index]["artist"]}",
                          style: const TextStyle(
                            fontSize: 10,
                            color: ColorsManager.secondary,
                          ))
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builder) => Song(
                                MusicIndex: index,
                              ),
                            ));
                      },
                      icon: const Icon(
                        Icons.headphones_rounded,
                        color: ColorsManager.secondary,
                      )),
                ],
              ),
            ),
        separatorBuilder: (index, context) => const Gap(5),
        itemCount: Music.MusicItems.length);
  }
}
