import 'dart:convert';

import 'package:nuri_01/models/lecture_card_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static final baseUrl = Uri.parse(
      "http://api.data.go.kr/openapi/tn_pubr_public_lftm_lrn_lctre_api");
  static final queryParams = {
    'serviceKey':
        'NujPfara6x2Y5732ziEuwNtVw95viV+rwbnfuCaGFXhK0p7/hhRLQGEjQDqCD9oJqWY0a3M8P9baBKr9Y4d5zw==',
    'pageNo': '1',
    'numOfRows': '10',
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
  static final querys = Uri(queryParameters: queryParams);

  static Future<List<LectureCardModel>> getLectureCards() async {
    List<LectureCardModel> lectureCardInstances = [];
    final response = await http.get(baseUrl.replace(query: querys.query));

    if (response.statusCode == 200) {
      final body = utf8.decode(response.bodyBytes);
      Map<String, dynamic> json = jsonDecode(body);
      final itemList = json['response']['body']['items'];
      if (itemList != null) {
        for (var item in itemList) {
          lectureCardInstances.add(LectureCardModel.fromJson(item));
        }
      }
      return lectureCardInstances;
    }

    throw Error();
  }
}
