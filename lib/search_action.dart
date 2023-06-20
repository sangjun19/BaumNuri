import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuri_01/search_lecture.dart';

String searchValue = '';
class search_action extends StatelessWidget {
  const search_action({Key? key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 290,
          height: 42,
          child: TextField(
            decoration: const InputDecoration(
              labelText: '찾으시는 강좌를 입력하세요',
              labelStyle: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w200),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
            onChanged: (text) {
              searchValue = text;
            },
            obscureText: false,
          ),
        ),
        IconButton(
          iconSize: 40,
          icon: const Icon(Icons.search),
          color: Colors.white,
          tooltip: 'Increase volume by 10',
          onPressed: () {
            print(searchValue);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => search_lecture(searchValue),
              ),
            );
          },
        ),
      ],
    );
  }
}
