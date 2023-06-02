import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuri_01/servey2.dart';
import 'package:nuri_01/servey3.dart';

final List<String> button_name = <String>["원예", "요리",  "어학", "독서", "운동", "공예", "투자", "음악", "토론"];

class servey2 extends StatefulWidget{
  servey2_state createState() => servey2_state();
}
class servey2_state  extends State<servey2> {
  List<bool> buttonStates = List.generate(9, (index) => false);
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/servey_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(top: 46, left: 8),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                  iconSize: 36,
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Spacer(),
            Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 100),
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 30),
                        child: Text(
                          '다음 중 흥미있는 분야를 모두\n 선택해주세요.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 80),
                        child: Wrap(
                            alignment: WrapAlignment.center,
                            children: List.generate(9, (index){
                              return Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                                child:  ElevatedButton(
                                    onPressed: (){
                                      setState(() {
                                        buttonStates[index] = !buttonStates[index];
                                      });
                                    },
                                    style: ButtonStyle(
                                      minimumSize: MaterialStateProperty.all(Size(80, 40)),
                                      backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                                        if (states.contains(MaterialState.pressed)) {
                                          return Color(0xFF336D58);
                                        }
                                        return buttonStates[index] ? Color(0xFF336D58) : Colors.white;
                                      }),
                                      elevation: MaterialStateProperty.all(8),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                      ),
                                    ),
                                    child:Text(
                                      '${button_name[index]}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16
                                      ),
                                    )
                                ),
                              );
                            })
                        ),
                      ),
                      ElevatedButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) => servey3(),
                              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                              transitionDuration: Duration(milliseconds: 500),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(260, 50),
                          textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                          primary: Colors.white,
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          "다음",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}