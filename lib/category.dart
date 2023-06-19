import 'package:flutter/material.dart';

import 'category_item_list.dart';

final List<String> category_images = <String>['images/articon.png','images/workouticon.png','images/gardenicon.png','images/stockicon.png', 'images/studyicon.png', 'images/elseicon.png'];
final List<String> category_name = <String>['예술/문화','운동/건강','원예','주식/부동산', '공부/자격증', '기타'];

class category extends StatelessWidget {
  const category({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: create_button(context),
      ),
    );
  }
}
List<Widget> create_button(BuildContext context) {
  List<Widget> button_list = [];
  int i;
  for(i=0;i<category_images.length;i++) {
    Column button =  Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 5),
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
              color: Color(0xFFFFFFFF),
              shape: BoxShape.circle
          ),
          child: IconButton(
              padding: const EdgeInsets.all(0),
              iconSize: 80,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryItemList()),
                );
              },
              icon: Image.asset(
                  category_images[i],
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover
              )
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Text(
            category_name[i],
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12),
          ),)
      ],
    );
    button_list.add(button);
  }
  return button_list;
}