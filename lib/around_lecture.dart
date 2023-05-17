import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final List<String> lecture_image = <String>['images/basicenglish.png','images/gardentherapy.png','images/kdance.png','images/indiancook.png',];
final List<String> lecture_name = <String>["   영어회화 초급","   원예치료","   한국무용","   인도요리"];
final List<String> lecture_period = <String>["   수강기간: 2023년","   수강기간: 2023년","   수강기간: 2023년","   수강기간: 2023년"];
final List<String> lecture_content = <String>["   강좌내용:","   강좌내용:","   강좌내용:","   강좌내용:"];
final List<String> lecture_cost = <String>["   수강료: 30,000원","   수강료: 30,000원","   수강료: 30,000","  수강료: 30,000"];
final List<String> lecture_operator = <String>["  운영기관: 유성구청","   운영기관: 유성구청","   운영기관: 유성구청","  운영기관: 유성구청"];

class around_lecture extends StatelessWidget {
  const around_lecture({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text('   내 주변 교육강좌',
                style: TextStyle(
                  color: Color(0xFF336D58),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ]
        ),
        Container(
            margin: const EdgeInsets.fromLTRB(20, 5, 20, 20),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color(0xFFECECEC),
            ),
            child: Column(
              children: create_lecture(),
            )
        )
      ],
    );
  }
}



List<Widget> create_lecture() {
  List<Widget> lecture = [];
  for(int i=0;i<lecture_name.length;i++) {
    InkWell lec = InkWell(
      onTap: () {print(lecture_name[i]);},
      child: Container(
        margin: EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  spreadRadius: 0,
                  blurRadius: 7,
                  offset: const Offset(0, 5)
              )
            ]
        ),
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