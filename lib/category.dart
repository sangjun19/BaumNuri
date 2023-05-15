import 'package:flutter/material.dart';
import 'package:nuri_01/category_item_list.dart';

final List<String> category_images = <String>[
  'images/flutter.jpg',
  'images/flutter.jpg',
  'images/flutter.jpg',
  'images/flutter.jpg'
];
final List<String> category_name = <String>['원예', '원예', '원예', '원예'];

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
  List<Widget> buttonList = [];
  int i;
  for (i = 0; i < category_images.length; i++) {
    Column button = Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          width: 120,
          height: 120,
          decoration:
              const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
          child: IconButton(
              padding: const EdgeInsets.all(20),
              iconSize: 80,
              onPressed: () {
                print("원예");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryItemList()),
                );
              },
              icon: Image.asset(
                category_images[i],
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              )),
        ),
        Text(category_name[i]),
      ],
    );
    buttonList.add(button);
  }
  return buttonList;
}
