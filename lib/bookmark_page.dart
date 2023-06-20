import 'package:flutter/material.dart';
import 'package:nuri_01/services/firebase_data.dart';

final List<String> lecture_image = <String>[
  'images/english.png',
  'images/guitar.png',
  'images/japanese.png',
  'images/english.png',
  'images/guitar.png',
  'images/japanese.png',
  'images/english.png',
  'images/guitar.png',
  'images/japanese.png',
  'images/english.png',
  'images/guitar.png',
  'images/japanese.png',
];

final List<String> lecture_name = <String>[];
final List<String> lecture_period = <String>[];
final List<String> lecture_content = <String>[];
final List<String> lecture_cost = <String>[];
final List<String> lecture_operator = <String>[];

class bookmark_page extends StatefulWidget {
  const bookmark_page({Key? key}) : super(key: key);

  @override
  _bookmark_pageState createState() => _bookmark_pageState();
}

class _bookmark_pageState extends State<bookmark_page> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    setState(() {
      isLoading = true;
    });

    await readLectureData();

    setState(() {
      isLoading = false;
    });
  }

  List<Widget> createLecture(BuildContext context) {
    List<Widget> lectureWidgets = [];
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
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Transform.scale(
                  scaleY: 1.3,
                  child: Image.asset(
                    lecture_image[i],
                    width: 100,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              lecture_name[i],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: const Offset(5, -10),
                            child: ElevatedButton(
                              onPressed: () {
                                deleteLectureData(lecture_name[i], lecture_content[i]);
                                setState(() {
                                  lecture_name.removeAt(i);
                                  lecture_period.removeAt(i);
                                  lecture_content.removeAt(i);
                                  lecture_cost.removeAt(i);
                                  lecture_operator.removeAt(i);
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                elevation: 0,
                              ),
                              child: const Text(
                                "삭제",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 245, 75, 3),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(lecture_period[i]),
                      const SizedBox(height: 5),
                      Text(
                        lecture_content[i],
                        maxLines: 1,
                      ),
                      const SizedBox(height: 5),
                      Text(lecture_cost[i]),
                      const SizedBox(height: 5),
                      Text(lecture_operator[i]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      lectureWidgets.add(lec);
    }
    return lectureWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/savedbackground.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Container(
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: const Offset(0, 3),
                        blurRadius: 4,
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
                const SizedBox(height: 30),
                ...createLecture(context),
              ],
            ),
          ),
          if (isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
