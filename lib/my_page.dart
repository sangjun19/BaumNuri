import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class my_page extends StatelessWidget {
  const my_page({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/savedbackground.png'),
                fit: BoxFit.cover
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    "마이페이지",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, 40, 30, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '회원이름',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF336D58),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '김이박',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 48),
                  Text(
                    '전화번호',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF336D58),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '010-1234-5678',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            SizedBox(height: 300),
            ButtonTheme(
              child: ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 18),
                        backgroundColor: Colors.green,
                      ),
                      onPressed: (){

                      },
                      child: Text(
                        '로그아웃',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      )
                  ),
                  SizedBox(height: 16, width: 20),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 35, vertical: 18),
                        backgroundColor: Colors.green,
                      ),
                      onPressed: (){

                      },
                      child: Text(
                        '회원탈퇴',
                        style: TextStyle(fontSize:16, fontWeight: FontWeight.bold),
                      )
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}