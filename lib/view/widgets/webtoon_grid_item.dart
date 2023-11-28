part of '../home_screen.dart';

class WebtoonGridItem extends StatelessWidget {
  const WebtoonGridItem({
    super.key,
    required this.webtoon,
  });

  final WebtoonModel webtoon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                spreadRadius: -5,
                blurRadius: 10,
              ),
            ]),
        //gridview.builder로 생성된 각각의 그리드(webtoon card)에 borderRadius를 주기 위해
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          clipBehavior: Clip.hardEdge,
          //image, text 순서로 표시
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Image.network에 borderRadius를 주기 위해 container로 감쌈
              //image 영역
              WebtoonGridItemImage(webtoon: webtoon),
              //text 영역
              WebtoonGridItemText(webtoon: webtoon),
            ],
          ),
        ),
      ),
    );
  }
}