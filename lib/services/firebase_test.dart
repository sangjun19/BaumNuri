import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../models/lecture_card_model.dart';

// void readLectureData() async {
//   const collectionName = 'account';
//   const documentId = 'NxD9jBlZMYSGbRsx5AUs';
//
//   try {
//     final documentSnapshot = await FirebaseFirestore.instance.collection(collectionName).doc(documentId).get();
//
//     if (documentSnapshot.exists) {
//       final data = documentSnapshot.data();
//       if (data != null) {
//         print('Data: $data');
//       } else {
//         print('Document is empty.');
//       }
//     } else {
//       print('Document does not exist.');
//     }
//   } catch (e) {
//     print('Error fetching Firestore data: $e');
//   }
// }



void writeLectureData(LectureCardModel lec) async {
  // CollectionReference<Map<String, dynamic>> collectionReference = FirebaseFirestore.instance.collection('01085178246');
  // Map<String, dynamic> userData = {
  //   'name': 'John Doe',
  //   'email': 'johndoe@example.com',
  //   'age': 25,
  // };
  // Map<String, LectureCardModel> lectureMap = Map.fromIterable(
  //   list.data!,
  //   key: (title) => '0', // 예시로 'id' 필드를 키로 사용합니다. 실제 필드에 따라 변경해주세요.
  //   value: (title) => title,
  // );
  // //await collectionReference.doc('1').update(userData);
  // await collectionReference.doc('0').set(lectureMap);
  try {
    // Firestore 컬렉션 참조
    CollectionReference lectureCollection = FirebaseFirestore.instance.collection('lectures');

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