class LectureCardModel {
  final String title;
  final String date;
  final String about;
  final String price;
  final String agency;

  LectureCardModel.fromJson(Map<String, dynamic> json)
      : title = json['lctreNm'],
        date = json['edcStartDay'] + " ~ " + json['edcEndDay'],
        about = json['lctreCo'],
        price = json['lctreCost'],
        agency = json['operInstitutionNm'];
}
