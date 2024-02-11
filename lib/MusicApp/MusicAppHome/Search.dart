// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:music_app/MusicApp/MusicAppHome/MusicModel.dart';
import 'package:music_app/MusicApp/SongScreen/Screen/Song.dart';
import 'package:music_app/core/resourses/colors.dart';


class Search extends SearchDelegate {
  List<Map<String, dynamic>> MusicSearch = [];
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear),
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back_rounded),
      );

  @override
  Widget buildResults(BuildContext context) =>
      SearchResult(MusicSearch: MusicSearch);

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == "") {
      return FutureBuilder(
          future: Future.delayed(
            const Duration(seconds: 1),
          ),
          builder: (context, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(
                  color: ColorsManager.secondary,
                ))
              : Padding(
                  padding: const EdgeInsets.all(15.0),
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
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
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
                                          tag:
                                              "${Music.MusicItems[index]["id"]}",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          "${Music.MusicItems[index]["title"]}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          )),
                                      const Gap(5),
                                      Text(
                                          "${Music.MusicItems[index]["artist"]}",
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
                        itemCount: Music.MusicItems.length),
                  ),
                ));
    } else {
      MusicSearch =
          Music.MusicItems.where((element) => element.containsValue(query))
              .toList();

      return SearchResult(MusicSearch: MusicSearch);
    }
  }
}

class SearchResult extends StatelessWidget {
  const SearchResult({
    super.key,
    required this.MusicSearch,
  });

  final List<Map<String, dynamic>> MusicSearch;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView.separated(
        itemCount: MusicSearch.length,
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
                    child: Image.asset(
                      "${MusicSearch[index]["image"]}",
                      width: 75,
                      height: 75,
                      fit: BoxFit.fill,
                    ),
                  )),
              const Gap(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${MusicSearch[index]["title"]}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      )),
                  const Gap(5),
                  Text("${MusicSearch[index]["artist"]}",
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
                            MusicIndex: MusicSearch[index]["id"],
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
        separatorBuilder: (ctx, index) => const Gap(5),
      ),
    );
  }
}
