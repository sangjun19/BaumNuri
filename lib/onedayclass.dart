import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuri_01/information.dart';
import 'package:nuri_01/more_lecture.dart';
import 'package:nuri_01/more_oneday.dart';

final List<String> lecture_image = <String>[
  'images/macrame.png',
  'images/stainedglass.png',
  'images/doll.png'
];
final List<String> lecture_name = <String>[
  "   마크라메 체험",
  "   유리공예 전등",
  "   봉제인형 만들기",
];
final List<String> lecture_period = <String>[
  "   수강기간: 2023년",
  "   수강기간: 2023년",
  "   수강기간: 2023년"
];
final List<String> lecture_content = <String>[
  "   강좌내용:",
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
  "  운영기관: 유성구청",
  "   운영기관: 유성구청",
  "   운영기관: 유성구청"
];

class oneday_lecture extends StatelessWidget {
  const oneday_lecture({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
            ...create_lecture(context),
            Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const more_oneday()));
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
}

List<Widget> create_lecture(BuildContext context) {
  List<Widget> lecture = [];
  for (int i = 0; i < lecture_name.length; i++) {
    InkWell lec = InkWell(
      onTap: () {
        // print(lecture_name[i]);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => information()),
        // );
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
                  offset: const Offset(0, 5))
            ]),
        child: Row(
          children: [
            Image.asset(
              lecture_image[i],
              width: 100,
              height: 100,
            ),
            Column(
              children: [
                Text(
                  '${lecture_name[i]}\n'
                  '${lecture_period[i]}\n'
                  '${lecture_content[i]}\n'
                  '${lecture_cost[i]}\n'
                  '${lecture_operator[i]}',
                ),
              ],
            )
          ],
        ),
      ),
    );
    lecture.add(lec);
  }
  return lecture;
}
