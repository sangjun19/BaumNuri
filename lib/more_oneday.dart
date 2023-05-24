import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuri_01/information.dart';

final List<String> lecture_image = <String>['images/basicenglish.png','images/gardentherapy.png','images/kdance.png'];
final List<String> lecture_name = <String>["   영어회화 초급","   유리공예 전등","   봉제인형 만들기",];
final List<String> lecture_period = <String>["   수강기간: 2023년","   수강기간: 2023년","   수강기간: 2023년"];
final List<String> lecture_content = <String>["   강좌내용:","   강좌내용:","   강좌내용:","   강좌내용:"];
final List<String> lecture_cost = <String>["   수강료: 30,000원","   수강료: 30,000원","   수강료: 30,000"];
final List<String> lecture_operator = <String>["  운영기관: 유성구청","   운영기관: 유성구청","   운영기관: 유성구청"];

class more_oneday extends StatelessWidget {
  const more_oneday({super.key});

  List<Widget> create_lecture(BuildContext context) {
    List<Widget> lecture = [];
    for (int i = 0; i < lecture_name.length; i++) {
      InkWell lec = InkWell(
        onTap: () {
          print(lecture_name[i]);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => information()),
          );
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.chevron_left_outlined),
            color: Colors.black,
            iconSize: 40,
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            '원데이 클래스',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/savedbackground.png'),
                  fit: BoxFit.cover
              )
          ),
          child: Column(
            children: [
              Container(
                /*
                height: 90,
                // color: Colors.white,
                decoration: BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.circular(8), // Add border radius for rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Set shadow color
                      offset: Offset(0, 3), // Set the offset of the shadow
                      blurRadius: 4, // Set the blur radius of the shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 32),
                    child: Text(
                      "내 주변 강좌",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),*/
              ),
              SizedBox(height: 30,),
              ...create_lecture(context)
            ],
          ),
        )
      //backgroundColor: Color(0xFFECECEC),

    );
  }
}