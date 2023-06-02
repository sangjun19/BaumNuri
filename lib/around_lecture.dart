import 'package:flutter/material.dart';
import 'package:nuri_01/information.dart';
import 'package:nuri_01/models/lecture_card_model.dart';
import 'package:nuri_01/more_lecture.dart';
import 'package:nuri_01/services/api_service.dart';
import 'package:nuri_01/services/firebase_data.dart';

class around_lecture extends StatelessWidget {
  final List<String> lecture_image = <String>[
    'images/japan.png',
    'images/speech2.png',
    'images/guitar.png',
  ];
  final List<String> lecture_name = <String>[
    "   영어회화 초급",
    "   원예치료",
    "   한국무용"
  ];
  final List<String> lecture_period = <String>[
    "   수강기간: 2023년",
    "   수강기간: 2023년",
    "   수강기간: 2023년"
  ];
  final List<String> lecture_content = <String>[
    "   강좌내용:",
    "   강좌내용:",
    "   강좌내용:"
  ];
  final List<String> lecture_cost = <String>[
    "   수강료: 30,000원",
    "   수강료: 30,000원",
    "   수강료: 30,000"
  ];
  final List<String> lecture_operator = <String>[
    "   운영기관: 유성구청",
    "   운영기관: 유성구청",
    "   운영기관: 유성구청"
  ];
  final Future<List<LectureCardModel>> lectureCards =
  ApiService.getLectureCards();

  around_lecture({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
          Text(
            '     맞춤강좌',
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
            ...create_lecture(context),
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

  List<Widget> create_lecture(BuildContext context) {
    List<Widget> lecture = [];
    for (int i = 0; i < lecture_name.length; i++) {
      Widget lec = FutureBuilder<List<LectureCardModel>>(
        future: ApiService.getLectureCards(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
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
                    ),
                  ),
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
          return Container();
        },
      );
      lecture.add(lec);
    }
    return lecture;
  }
}