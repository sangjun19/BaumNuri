import 'package:flutter/material.dart';

class LectureCard extends StatelessWidget {
  final String title;
  final AssetImage img;

  const LectureCard({
    super.key,
    required this.title,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                offset: const Offset(5, 5),
                color: Colors.black.withOpacity(0.5),
              ),
            ],
          ),
          height: 180,
          clipBehavior: Clip.hardEdge,
          child: Image(image: img),
        ),
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
