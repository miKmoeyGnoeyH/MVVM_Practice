part of '../home_screen.dart';

class WebtoonGridItemText extends StatelessWidget {
  const WebtoonGridItemText({
    super.key,
    required this.webtoon,
  });

  final WebtoonModel webtoon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 10, vertical: 10),
        child: Center(
          child: Center(
              child: Text(
                webtoon.title,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                ),
              )),
        ),
      ),
    );
  }
}