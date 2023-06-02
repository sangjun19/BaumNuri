import 'package:flutter/material.dart';

final List<String> lecture_image = <String>[
  'images/english.png',
  'images/glass.png',
  'images/japan.png',
];
final List<String> lecture_name = <String>[
  "   영어회화 초급",
  "   유리공예 전등",
  "   생활일본어",
];
final List<String> lecture_period = <String>[
  "   수강기간: 2023년~",
  "   수강기간: 2023년~",
  "   수강기간: 2018년~"
];
final List<String> lecture_content = <String>[
  "   강좌내용:기본부터 익히는 영어회화",
  "   강좌내용:쉽게 즐기는 유리공예",
  "   강좌내용:기초부터 실용회화 학습을 위한 일본어",
  "   강좌내용:"
];
final List<String> lecture_cost = <String>[
  "   수강료: 30,000원",
  "   수강료: 20,000원",
  "   수강료: 30,000원"
];
final List<String> lecture_operator = <String>[
  "   운영기관: 유성구청",
  "   운영기관: 유성구청",
  "   운영기관: 유성구청"
];

class bookmark_page extends StatelessWidget {
  const bookmark_page({super.key});

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
          margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lecture_name[i],
                    ),
                    Text(
                      lecture_period[i],
                    ),
                    Text(
                      lecture_content[i],
                      maxLines: 1,
                    ),
                    Text(
                      lecture_cost[i],
                    ),
                    Text(
                      lecture_operator[i],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
      lecture.add(lec);
    }
    return lecture;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/savedbackground.png'),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              Container(
                height: 90,
                // color: Colors.white,
                decoration: BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.circular(8), // Add border radius for rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Set shadow color
                      offset: const Offset(0, 3), // Set the offset of the shadow
                      blurRadius: 4, // Set the blur radius of the shadow
                    ),
                  ],
                ),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 32),
                    child: Text(
                      "저장됨",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ...create_lecture(context)
            ],
          ),
        )
      //backgroundColor: Color(0xFFECECEC),

    );
  }
}