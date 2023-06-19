import 'package:flutter/material.dart';

class CategoryItemCard extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String date;
  final String content;
  final String price;
  final String agency;

  const CategoryItemCard(
      {super.key,
        required this.imgUrl,
        required this.title,
        required this.date,
        required this.content,
        required this.price,
        required this.agency});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 0,
              blurRadius: 7,
              offset: const Offset(0, 5),
            ),
          ]),
      child: Row(
        children: [
          Flexible(
            flex: 3,
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Image.asset(imgUrl),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Flexible(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 8,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  content,
                  style: const TextStyle(
                    fontSize: 9,
                  ),
                ),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 9,
                  ),
                ),
                Text(
                  agency,
                  style: const TextStyle(
                    fontSize: 9,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
