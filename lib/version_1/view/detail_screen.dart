import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mvvm_practice/version_1/model/webtoon_model.dart';
import 'package:mvvm_practice/version_1/view_model/detail_screen_view_model.dart';
import 'package:mvvm_practice/version_1/view_model/webtoon_episodes_view_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DetailScreen extends ConsumerWidget {
  const DetailScreen({super.key, required this.item});

  final WebtoonModel item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final webtoonDetailModel =
        ref.watch(detailViewModelProvider).webtoonDetailModel;
    final webtoonEpisodeModel =
        ref.watch(webtoonEpisodeListProvider).webtoonEpisodeModels;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: const Text(
          'MVVM',
          style: TextStyle(
            fontSize: 26,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: webtoonEpisodeModel == null
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline_rounded,
                      size: 100,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          ref.read(detailViewModelProvider.notifier).load(item);
                          ref
                              .read(webtoonEpisodeListProvider.notifier)
                              .load(item.id);
                        },
                        child: const Text('Try again')),
                  ],
                ),
              )
            : webtoonEpisodeModel.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Hero(
                            tag: item.id,
                            child: Container(
                              height: 200,
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black,
                                      blurRadius: 10,
                                      spreadRadius: -5),
                                ],
                              ),
                              child: CachedNetworkImage(
                                imageUrl: item.img,
                              ),
                            ),
                          ),
                          Container(
                            height: 200,
                            width: 200,
                            child: Center(
                              child: webtoonDetailModel == null
                                  ? const CircularProgressIndicator()
                                  : SizedBox(
                                      height: 200,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            webtoonDetailModel.title,
                                            style: const TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            webtoonDetailModel.author,
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(
                                            //color: Colors.yellow,
                                            width: 200,
                                            child: Text(
                                              webtoonDetailModel.synopsys,
                                              maxLines: 5,
                                              style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '${webtoonDetailModel.genre} / ${webtoonDetailModel.age}',
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemCount: webtoonEpisodeModel.length,
                          itemBuilder: (context, index) {
                            var episode = webtoonEpisodeModel[index];
                            return GestureDetector(
                              onTap: () async {
                                await launchUrlString(
                                    "https://comic.naver.com/webtoon/detail?titleId=${episode.id}&no=${episode.episodeId}");
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Container(
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 13,
                                          spreadRadius: -10),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          clipBehavior: Clip.hardEdge,
                                          child: CachedNetworkImage(
                                            imageUrl: episode.thumbUrl,
                                            height: 110,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Container(
                                            width: 200,
                                            //color: Colors.green,
                                            child: Text(
                                              episode.title,
                                              style: const TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ),
                                          ),
                                        ),
                                        const Icon(
                                            Icons.arrow_forward_ios_rounded),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox();
                          },
                        ),
                      ),
                    ],
                  ),
      ),
    );
  }
}
