import 'package:flutter/material.dart';
import 'package:nuri_01/information.dart';
import 'package:nuri_01/lecturecard_widget.dart';
import 'package:nuri_01/models/lecture_card_model.dart';
import 'package:nuri_01/more_oneday.dart';
import 'package:nuri_01/services/api_service2.dart';

class OnedayClass extends StatelessWidget {
  final List<String> lecture_image = <String>[
    'images/healing_travel.jpg',
    'images/healing_travel.jpg',
    'images/semu.jpeg',
    'images/rpa.jpg',
    'images/com_internet.png',
  ];
  // final Map<String?, String> lecture_image = {
  //   '생활일본어': 'images/japanese.png',
  //   '생활스피치': 'images/speech.png',
  //   '기타C': 'images/guitar.png',
  // };
  final Future<List<LectureCardModel>> lectureCards =
  ApiService.getLectureCards();

  OnedayClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text(
            '     하루완성! 원데이클래스',
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
    for (int i = 0; i < 9; i++) {
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


// ------------------이전꺼-----------------------------------------

// import 'package:flutter/material.dart';
// import 'package:nuri_01/more_oneday.dart';

// final List<String> lecture_image = <String>[
//   'images/macrame.png',
//   'images/stainedglass.png',
//   'images/doll.png'
// ];
// final List<String> lecture_name = <String>[
//   "   마크라메 체험",
//   "   유리공예 전등",
//   "   봉제인형 만들기",
// ];
// final List<String> lecture_period = <String>[
//   "   수강기간: 2023년",
//   "   수강기간: 2023년",
//   "   수강기간: 2023년"
// ];
// final List<String> lecture_content = <String>[
//   "   강좌내용:",
//   "   강좌내용:",
//   "   강좌내용:",
//   "   강좌내용:"
// ];
// final List<String> lecture_cost = <String>[
//   "   수강료: 30,000원",
//   "   수강료: 30,000원",
//   "   수강료: 30,000"
// ];
// final List<String> lecture_operator = <String>[
//   "  운영기관: 유성구청",
//   "   운영기관: 유성구청",
//   "   운영기관: 유성구청"
// ];

// class oneday_lecture extends StatelessWidget {
//   const oneday_lecture({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//           Text(
//             '     하루완성! 원데이클래스',
//             style: TextStyle(
//               color: Color(0xFF336D58),
//               fontWeight: FontWeight.bold,
//               fontSize: 18,
//             ),
//           ),
//         ]),
//         Container(
//           margin: const EdgeInsets.fromLTRB(20, 5, 20, 20),
//           padding: const EdgeInsets.all(10),
//           decoration: const BoxDecoration(
//             color: Color(0xFFECECEC),
//             borderRadius: BorderRadius.all(Radius.circular(15)),
//           ),
//           child: Column(children: [
//             ...create_lecture(context),
//             Align(
//                 alignment: Alignment.bottomRight,
//                 child: GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const more_oneday()));
//                     },
//                     child: const Padding(
//                       padding: EdgeInsets.only(right: 10),
//                       child: Text(
//                         '더보기',
//                         style: TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFF336D58)),
//                       ),
//                     )))
//           ]),
//         )
//       ],
//     );
//   }
// }

// List<Widget> create_lecture(BuildContext context) {
//   List<Widget> lecture = [];
//   for (int i = 0; i < lecture_name.length; i++) {
//     InkWell lec = InkWell(
//       onTap: () {
//         // print(lecture_name[i]);
//         // Navigator.push(
//         //   context,
//         //   MaterialPageRoute(builder: (context) => information()),
//         // );
//       },
//       child: Container(
//         margin: const EdgeInsets.all(10),
//         padding: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//             color: const Color(0xFFFFFFFF),
//             borderRadius: BorderRadius.circular(10),
//             boxShadow: [
//               BoxShadow(
//                   color: Colors.grey.withOpacity(0.7),
//                   spreadRadius: 0,
//                   blurRadius: 7,
//                   offset: const Offset(0, 5))
//             ]),
//         child: Row(
//           children: [
//             Image.asset(
//               lecture_image[i],
//               width: 100,
//               height: 100,
//             ),
//             Column(
//               children: [
//                 Text(
//                   '${lecture_name[i]}\n'
//                   '${lecture_period[i]}\n'
//                   '${lecture_content[i]}\n'
//                   '${lecture_cost[i]}\n'
//                   '${lecture_operator[i]}',
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//     lecture.add(lec);
//   }
//   return lecture;
// }
