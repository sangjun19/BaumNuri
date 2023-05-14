import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final List<String> lecture_image = <String>['images/flutter.jpg','images/flutter.jpg','images/flutter.jpg','images/flutter.jpg',];
final List<String> lecture_name = <String>["영어회화 초급","영어회화 초급","영어회화 초급","영어회화 초급"];
final List<String> lecture_period = <String>["2023","2023","2023","2023"];
final List<String> lecture_content = <String>["영어","영어","영어","영어"];
final List<String> lecture_cost = <String>["30000","30000","30000","30000"];
final List<String> lecture_operator = <String>["대전광역시","대전광역시","대전광역시","대전광역시"];

List<Widget> create_lecture() {
  List<Widget> lecture = [];
  for(int i=0;i<lecture_name.length;i++) {
    InkWell lec = InkWell(
      onTap: () {print(lecture_name[i]);},
      child: Container(
        margin: EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        color: Colors.yellow,
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
                        '${lecture_period[i]}\n\n'
                        '${lecture_content[i]}\n'
                        '${lecture_cost[i]}\n'
                        '${lecture_operator[i]}'
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