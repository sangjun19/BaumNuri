import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuri_01/screens/main_page.dart';
import 'package:nuri_01/servey2.dart';

class servey3 extends StatefulWidget{
  @override
  servey3_state createState() => servey3_state();
}
class servey3_state extends State<servey3> {
  double sliderValue = 0;
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
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 180),
                        child: Text(
                          '수강료는 어느정도로 희망하세요?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 40),
                        child: Column(
                          children: [
                            Text(
                              '${sliderValue.toInt()}원',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Slider(
                              value: sliderValue,
                              min: 0,
                              max: 50000,
                              divisions: 10,
                              onChanged: (value) {
                                setState(() {
                                  sliderValue = value;
                                });
                              },
                              activeColor: Colors.white,
                              inactiveColor: Color(0xFF336D58),
                            ),
                          ],
                        )
                      ),
                      SizedBox(height: 20), // Add spacing between the text and the button
                      ElevatedButton(

                        onPressed: (){
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation, secondaryAnimation) => MainPage(),
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
                          "적용하기",
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