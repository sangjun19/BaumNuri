import 'package:flutter/material.dart';

void main() {
  runApp(information());
}

class information extends StatelessWidget {
  information({Key? key}) : super(key: key);

  String name = "강의 제목";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(
            children: [
              Flexible(
                flex: 10,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(10),
                    ),
                    image: DecorationImage(
                        image: AssetImage("assets/images/image.png"),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            iconSize: 30,
                            icon: Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 5,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Flexible(
                            flex: 1,
                            child: SizedBox(
                              width: 30,
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Text(
                              "$name",
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: IconButton(
                              iconSize: 30,
                              icon: Icon(Icons.bookmark_outline),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Center(
                                child: Icon(
                                  Icons.circle_outlined,
                                  size: 40,
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Center(
                                child: Icon(
                                  Icons.circle_outlined,
                                  size: 40,
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Center(
                                child: Icon(
                                  Icons.circle_outlined,
                                  size: 40,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: Center(
                                child: Text(
                                  "어학",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF336D58),
                                  ),
                                ))),
                        Flexible(
                            child: Center(
                                child: Text(
                                  "어학",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF336D58),
                                  ),
                                ))),
                        Flexible(
                            child: Center(
                                child: Text(
                                  "어학",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF336D58),
                                  ),
                                ))),
                      ],
                    )
                  ],
                ),
              ),
              Container(height: 2, width: 370.0, color: Color(0xFF336D58)),
              Flexible(
                flex: 15,
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "강사명 : ",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "내용 : ",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "기간 : ",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "시간 : ",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "기관 : ",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "장소 : ",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),

                      Text(
                        "수강료 : ",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "신청 방법 : ",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "전화번호 : ",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}