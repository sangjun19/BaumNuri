class LectureCardModel {
  final String title;     //강의명
  final String date;      //날짜
  final String about;     //강좌내용
  final String price;     //가격
  final String agency;    //운영기관
  final String name;      //강사명
  final String number;    //기관 전번
  final String time;      //강좌시간
  final String place;     //장소
  final String placeAd;   //도로명 주소
  final String how;       //접수방법구분

  LectureCardModel.fromJson(Map<String, dynamic> json)
      : title = json['lctreNm'],
        date = json['edcStartDay'] + " ~ " + json['edcEndDay'],
        about = json['lctreCo'],
        price = json['lctreCost'],
        agency = json['operInstitutionNm'],
        name = json['instrctrNm'],
        number = json['operPhoneNumber'],
        time = json['edcStartTime'] + " ~ " + json['edcColseTime'],
        place = json['edcPlace'],
        placeAd = json['edcRdnmadr'],
        how = json['rceptMthType'];
}
