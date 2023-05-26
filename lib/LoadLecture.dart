import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'LectureData.dart';

class LoadLecture extends StatelessWidget {
  Future<List<Lecture>> fetchData() async {
    var url = Uri.parse('http://api.data.go.kr/openapi/tn_pubr_public_lftm_lrn_lctre_api');
    var queryParams = {
      'serviceKey': 'NujPfara6x2Y5732ziEuwNtVw95viV+rwbnfuCaGFXhK0p7/hhRLQGEjQDqCD9oJqWY0a3M8P9baBKr9Y4d5zw==',
      'pageNo': '1',
      'numOfRows': '300',
      'type': 'json',
      // 'lctreNm': '',
      // 'instrctrNm': '',
      // 'edcStartDay': '',
      // 'edcEndDay': '',
      // 'edcStartTime': '',
      // 'edcColseTime': '',
      // 'lctreCo': '',
      // 'edcTrgetType': '',
      // 'edcMthType': '',
      // 'operDay': '',
      //'edcPlace': '성산아트홀', //장소
      // 'psncpa': '',
      // 'lctreCost': '',
      // 'edcRdnmadr': '', //주소
      // 'operInstitutionNm': '',
      // 'operPhoneNumber': '',
      // 'rceptStartDate': '',
      // 'rceptEndDate': '',
      // 'rceptMthType': '',
      // 'slctnMthType': '',
      // 'homepageUrl': '',
      // 'oadtCtLctreYn': '',
      // 'pntBankAckestYn': '',
      // 'lrnAcnutAckestYn': '',
      // 'referenceDate': '',
      // 'instt_code': ''
    };

    var uri = Uri(queryParameters: queryParams);
    var response = await http.get(url.replace(query: uri.query));
    List<Lecture> lectureList = [];
    if (response.statusCode == 200) {
      final body = utf8.decode(response.bodyBytes);
      Map<String, dynamic> json = jsonDecode(body);
      //print(response.body);
      final lecture = json['response']['body']['items'];
      if (lecture != null) {
        List<dynamic> itemList = lecture;
        for (var item in itemList) {
          Lecture lectureItem = Lecture.fromJson(item);
          lectureList.add(lectureItem);
        }
      }
      return lectureList;
    }
    else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Explorer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('API'),
        ),
        body: Center(
          child: FutureBuilder<List<Lecture>>(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Lecture lecture = snapshot.data![index];
                    return ListTile(
                      title: Text(lecture.lctreNm),
                      subtitle: Text(lecture.edcRdnmadr),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
