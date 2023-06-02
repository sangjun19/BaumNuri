import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../models/lecture_card_model.dart';

void readLectureData() async {
  const collectionName = '010-1234-5678';
  const documentId = '1JmDbgeu1kWw0GILpZEO';

  try {
    final documentSnapshot = await FirebaseFirestore.instance.collection(collectionName).doc(documentId).get();

    if (documentSnapshot.exists) {
      final data = documentSnapshot.data();
      if (data != null) {
        print('Data: $data');
      }
      else {
        print('Document is empty.');
      }
    }
    else {
      print('Document does not exist.');
    }
  }
  catch (e) {
    print('Error fetching Firestore data: $e');
  }
}



void writeLectureData(LectureCardModel lec) async {
  try {
    // Firestore 컬렉션 참조
    CollectionReference lectureCollection = FirebaseFirestore.instance.collection('010-1234-5678');

    // LectureCardModel을 Map으로 변환
    Map<String, dynamic> lectureData = {
      'title': lec.title,
      'date': lec.date,
      'about': lec.about,
      'price': lec.price,
      'agency': lec.agency,
    };

    // Firestore에 데이터 추가
    await lectureCollection.add(lectureData); //아이디 없이
    //await lectureCollection.doc('0').set(lectureData); //아이디 지정해서
    print('LectureCard added successfully!');
  } catch (e) {
  print('Error adding LectureCard: $e');
  }
}