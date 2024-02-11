import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:music_app/MusicApp/MusicAppHome/MusicModel.dart';
import 'package:music_app/MusicApp/SongScreen/Screen/Song.dart';
import 'package:music_app/core/resourses/colors.dart';

class FavouriteSongScreen extends StatefulWidget {
  const FavouriteSongScreen({super.key});

  @override
  State<FavouriteSongScreen> createState() => _FavouriteSongScreenState();
}

class _FavouriteSongScreenState extends State<FavouriteSongScreen>
    with TickerProviderStateMixin {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
          behaviour: RandomParticleBehaviour(
              options: const ParticleOptions(
            spawnOpacity: 0.0,
            opacityChangeRate: 0.25,
            minOpacity: 0.1,
            maxOpacity: 1,
            spawnMinSpeed: 30.0,
            spawnMaxSpeed: 70.0,
            spawnMinRadius: 7.0,
            spawnMaxRadius: 15.0,
            particleCount: 50,
            image: Image(
                image: AssetImage("assets/images/icons8-musical-notes-24.png")),
          )),
          vsync: this,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Expanded(
              child: ListView.separated(
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
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (builder) => Song(
                                                MusicIndex: FavouriteMusic
                                                        .FavMusicsIndex
                                                    .elementAt(index))));
                                  },
                                  child: Hero(
                                    tag:
                                        "${Music.MusicItems[FavouriteMusic.FavMusics.elementAt(index).id]["id"]}",
                                    child: Image.asset(
                                      "${Music.MusicItems[FavouriteMusic.FavMusics.elementAt(index).id]["image"]}",
                                      height: 75,
                                      width: 75,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                )),
                            const Gap(20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    "${Music.MusicItems[FavouriteMusic.FavMusics.elementAt(index).id]["title"]}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    )),
                                const Gap(5),
                                Text(
                                    "${Music.MusicItems[FavouriteMusic.FavMusics.elementAt(index).id]["artist"]}",
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: ColorsManager.secondary,
                                    ))
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () async {
                                  setState(() {
                                    Music.isFavouriteMusic[
                                        FavouriteMusic.FavMusicsIndex.elementAt(
                                            index)] = false;
                                    FavouriteMusic.FavMusics.removeWhere(
                                        (element) =>
                                            element.id ==
                                            FavouriteMusic.FavMusicsIndex
                                                .elementAt(index));
                                  });
                                  FavouriteMusic.FavMusicsIndex.removeWhere(
                                      (element) => element == index);
                                },
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ))
                          ],
                        ),
                      ),
                  separatorBuilder: (index, context) => const Gap(5),
                  itemCount: FavouriteMusic.FavMusics.length),
            ),
          )),
    );
  }
}
