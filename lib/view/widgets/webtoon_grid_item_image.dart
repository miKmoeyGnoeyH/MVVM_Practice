part of '../home_screen.dart';

class WebtoonGridItemImage extends StatelessWidget {
  const WebtoonGridItemImage({
    super.key,
    required this.webtoon,
  });

  final WebtoonModel webtoon;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.hardEdge,
      child: Image.network(
        webtoon.img,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}