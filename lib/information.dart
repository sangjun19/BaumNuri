import 'package:flutter/material.dart';

class information extends StatefulWidget {
  final String title;
  final String tutorName;
  final String content;
  final String date;
  final String time;
  final String agency;
  final String place;
  final String price;
  final String how;
  final String number;
  final AssetImage img;

  const information({
    super.key,
    required this.title,
    required this.tutorName,
    required this.content,
    required this.date,
    required this.time,
    required this.agency,
    required this.place,
    required this.price,
    required this.how,
    required this.number,
    required this.img,
  });

  @override
  State<information> createState() => _informationState();
}

bool isStored = false;
class _informationState extends State<information> {
  // String name = "안녕하세요 영어회화";
  // final Future<List<LectureCardModel>> lectureCards =
  //     ApiService.getLectureCards();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Flexible(
              flex: 10,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  ),
                  image: DecorationImage(image: widget.img, fit: BoxFit.cover),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          iconSize: 30,
                          icon: const Icon(Icons.arrow_back_ios),
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
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                          flex: 1,
                          child: SizedBox(
                            width: 40,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: SizedBox(
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                widget.title,
                                style: const TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: IconButton(
                            iconSize: 34,
                            color: const Color(0xFF336D58),
                            icon: Icon((isStored)
                                ? Icons.bookmark
                                : Icons.bookmark_outline),
                            onPressed: () {
                              setState(() {
                                if (isStored == false) {
                                  isStored = true;
                                  //writeLectureData()
                                } else {
                                  isStored = false;
                                }
                                print(isStored);
                              });
                            },
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
                                Icons.category_outlined,
                                size: 40,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Center(
                              child: Icon(
                                Icons.price_check_rounded,
                                size: 40,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Center(
                              child: Icon(
                                Icons.calendar_month,
                                size: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                            flex: 1,
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
                            flex: 1,
                            child: Center(
                                child: Text(
                                  widget.price,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF336D58),
                                  ),
                                ))),
                        Flexible(
                          flex: 1,
                          child: Text(
                            widget.date,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF336D58),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              child: Container(
                height: 2,
                width: 370.0,
                color: const Color(0xFF336D58),
              ),
            ),
            Flexible(
              flex: 15,
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "강사명 : ${widget.tutorName}",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "내용 : ${widget.content}",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "기간 : ${widget.date}",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "시간 : ${widget.time}",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "기관 : ${widget.agency}",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "장소 : ${widget.place}",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "수강료 : ${widget.price}",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "신청 방법 : ${widget.how}",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "전화번호 : ${widget.number}",
                      style: const TextStyle(
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