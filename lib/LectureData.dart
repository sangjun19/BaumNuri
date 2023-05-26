class Lecture {
  String lctreNm;
  String instrctrNm;
  String edcStartDay;
  String edcEndDay;
  String edcStartTime;
  String edcColseTime;
  String lctreCo;
  String edcPlace;
  String edcRdnmadr;
  String lctreCost;
  String rceptMthType;
  String operPhoneNumber;
  String homepageUrl;

  Lecture({
    required this.lctreNm,
    required this.instrctrNm,
    required this.edcStartDay,
    required this.edcEndDay,
    required this.edcStartTime,
    required this.edcColseTime,
    required this.lctreCo,
    required this.edcPlace,
    required this.edcRdnmadr,
    required this.lctreCost,
    required this.rceptMthType,
    required this.operPhoneNumber,
    required this.homepageUrl,
  });

  factory Lecture.fromJson(Map<String, dynamic> json) {
    return Lecture(
      lctreNm: json['lctreNm'] as String,
      instrctrNm: json['instrctrNm'] as String,
      edcStartDay: json['edcStartDay'] as String,
      edcEndDay: json['edcEndDay'] as String,
      edcStartTime: json['edcStartTime'] as String,
      edcColseTime: json['edcColseTime'] as String,
      lctreCo: json['lctreCo'] as String,
      edcPlace: json['edcPlace'] as String,
      edcRdnmadr: json['edcRdnmadr'] as String,
      lctreCost: json['lctreCost'] as String,
      rceptMthType: json['rceptMthType'] as String,
      operPhoneNumber: json['operPhoneNumber'] as String,
      homepageUrl: json['homepageUrl'] as String,
    );
  }
}