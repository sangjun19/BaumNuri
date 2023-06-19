import 'package:flutter/material.dart';
import 'package:nuri_01/information.dart';
import 'package:nuri_01/lecturecard_widget.dart';
import 'package:nuri_01/models/lecture_card_model.dart';
import 'package:nuri_01/more_lecture.dart';
import 'package:nuri_01/services/api_service.dart';

class around_lecture extends StatelessWidget {
  final List<String> lecture_image = <String>[
    'images/japanese.png',
    'images/speech.png',
    'images/guitar.png',
    'images/song_class.jpeg',
    'images/biggold.jpg',
  ];

  // final Map<String?, String> lecture_image = {
  //   '생활일본어': 'images/japanese.png',
  //   '생활스피치': 'images/speech.png',
  //   '기타C': 'images/guitar.png',
  // };
  final Future<List<LectureCardModel>> lectureCards =
  ApiService.getLectureCards();

  around_lecture({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
          Text(
            '     맞춤 강좌',
            style: TextStyle(
              color: Color(0xFF336D58),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ]),
        Container(
          margin: const EdgeInsets.fromLTRB(20, 5, 20, 20),
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Color(0xFFECECEC),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Column(children: [
            // ...create_lecture(context),
            FutureBuilder(
              future: lectureCards,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    height: 250,
                    child: makeList(snapshot),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            // SizedBox(
            //   height: 100,
            //   child: makeList2(create_lecture(context)),
            // ),
            Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const more_lecture()));
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        '더보기',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF336D58)),
                      ),
                    )))
          ]),
        )
      ],
    );
  }

  // ListView makeList2(List<Widget> cardList) {
  //   // return ListView.separated(
  //   //   shrinkWrap: true,
  //   //   scrollDirection: Axis.horizontal,
  //   //   itemCount: 3,
  //   //   padding: const EdgeInsets.symmetric(
  //   //     vertical: 10,
  //   //     horizontal: 20,
  //   //   ),
  //   //   itemBuilder: (context, index) {
  //   //     var lectureCard = cardList[index];
  //   //     return lectureCard;
  //   //   },
  //   //   separatorBuilder: (context, index) {
  //   //     return const SizedBox(
  //   //       width: 30,
  //   //     );
  //   //   },
  //   // );
  //   return ListView(
  //     shrinkWrap: true,
  //     padding: const EdgeInsets.all(8),
  //     scrollDirection: Axis.horizontal,
  //     children: const [
  //       Text("asd"),
  //       Text("qwe"),
  //     ],
  //   );
  // }

  ListView makeList(AsyncSnapshot<List<LectureCardModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      itemBuilder: (context, index) {
        var lectureCard = snapshot.data![index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => information(
                    title: lectureCard.title,
                    tutorName: lectureCard.name,
                    content: lectureCard.about,
                    date: lectureCard.date,
                    time: lectureCard.time,
                    agency: lectureCard.agency,
                    place: lectureCard.place,
                    price: lectureCard.price,
                    how: lectureCard.how,
                    number: lectureCard.number,
                    img: AssetImage(lecture_image[index]),
                  )),
            );
          },
          child: LectureCard(
            title: lectureCard.title,
            img: AssetImage(lecture_image[index]),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          width: 30,
        );
      },
    );
  }

  List<Widget> create_lecture(BuildContext context) {
    List<Widget> lecture = [];
    for (int i = 0; i <9; i++) {
      FutureBuilder<List<LectureCardModel>> lec = FutureBuilder(
        future: lectureCards,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => information(
                        title: snapshot.data![i].title,
                        tutorName: snapshot.data![i].name,
                        content: snapshot.data![i].about,
                        date: snapshot.data![i].date,
                        time: snapshot.data![i].time,
                        agency: snapshot.data![i].agency,
                        place: snapshot.data![i].place,
                        price: snapshot.data![i].price,
                        how: snapshot.data![i].how,
                        number: snapshot.data![i].number,
                        img: AssetImage(lecture_image[i]),
                      )),
                );
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 0,
                      blurRadius: 7,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Image.asset(
                      lecture_image[i],
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data![i].title,
                            maxLines: 1,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "수강기간: ${snapshot.data![i].date}",
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            "강좌내용: ${snapshot.data![i].about}",
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            "수강료: ${snapshot.data![i].price}원",
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          Text(
                            "운영기관: ${snapshot.data![i].agency}",
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const CircularProgressIndicator();
        },
      );
      lecture.add(lec);
    }
    return lecture;
  }
}
