
import 'dart:math';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:nuri_01/information.dart';
import 'dart:convert';

import '../bookmark_page.dart';
import '../models/lecture_card_model.dart';


readLectureData() async {
  const collectionName = '010-1234-5678';

  // 리스트 초기화
  lecture_name.clear();
  lecture_period.clear();
  lecture_content.clear();
  lecture_cost.clear();
  lecture_operator.clear();

  try {
    final querySnapshot = await FirebaseFirestore.instance.collection(collectionName).get();

    if (querySnapshot.size > 0) {
      final dataList = querySnapshot.docs.map((doc) => doc.data()).toList();

      final listData = dataList.map((data) {
        final title = data['title'];
        final content = data['content'];
        final date = data['date'];
        final agency = data['agency'];
        final price = data['price'];

        return [title, content, date, agency, price];
      }).toList();

      // 리스트에 저장된 데이터 활용하기
      for (var data in listData) {
        final title = data[0];
        final content = data[1];
        final date = data[2];
        final agency = data[3];
        final price = data[4];
        // 리스트에 데이터 저장
        lecture_name.add(title);
        lecture_period.add(date);
        lecture_content.add(content);
        lecture_cost.add(price);
        lecture_operator.add(agency);
      }
    } else {
      print('No documents found in the collection.');
    }
  } catch (e) {
    print('Error fetching Firestore data: $e');
  }
}


// void writeLectureData(LectureCardModel lec) async {
//   try {
//     // Firestore 컬렉션 참조
//     CollectionReference lectureCollection = FirebaseFirestore.instance.collection('010-1234-5678');
//
//     // LectureCardModel을 Map으로 변환
//     Map<String, dynamic> lectureData = {
//       'title': lec.title,
//       'date': lec.date,
//       'about': lec.about,
//       'price': lec.price,
//       'agency': lec.agency,
//     };
//
//     // Firestore에 데이터 추가
//     await lectureCollection.add(lectureData); //아이디 없이
//     //await lectureCollection.doc('0').set(lectureData); //아이디 지정해서
//     print('LectureCard added successfully!');
//   } catch (e) {
//   print('Error adding LectureCard: $e');
//   }
// }

Future<bool> checkDuplicateData(information widget) async {
  try {
    CollectionReference lectureCollection = FirebaseFirestore.instance.collection('010-1234-5678');

    QuerySnapshot querySnapshot = await lectureCollection
        .where('title', isEqualTo: widget.title)
        .where('date', isEqualTo: widget.date)
        .get();

    return querySnapshot.docs.isNotEmpty;
  } catch (e) {
    print('Error checking duplicate data: $e');
    return false;
  }
}

void writeLectureInfor(information widget) async {
  try {
    bool isDuplicate = await checkDuplicateData(widget);

    if (isDuplicate) {
      print('Duplicate data found. Aborting data write.');
      return;
    }

    CollectionReference lectureCollection = FirebaseFirestore.instance.collection('010-1234-5678');

    Map<String, dynamic> lectureData = {
      'title': widget.title,
      'date': widget.date,
      'content': widget.content,
      'price': widget.price,
      'agency': widget.agency,
    };

    await lectureCollection.add(lectureData);
    print('LectureCard added successfully!');
  } catch (e) {
    print('Error adding LectureCard: $e');
  }
}

void deleteLectureData(String title, String content) async {
  try {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('010-1234-5678')
        .where('title', isEqualTo: title)
        .where('content', isEqualTo: content)
        .get();

    for (final doc in querySnapshot.docs) {
      await doc.reference.delete();
    }

    print('Documents deleted successfully.');
  } catch (e) {
    print('Error deleting documents: $e');
  }
}
