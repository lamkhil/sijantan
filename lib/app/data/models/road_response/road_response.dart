import 'package:json_annotation/json_annotation.dart';

part 'road_response.g.dart';

@JsonSerializable()
class RoadResponseApi {
  final String succes;
  final String message;
  final List<RoadDataPublicRasponse> data;
  RoadResponseApi({this.succes = "", this.message = "", this.data = const []});

  factory RoadResponseApi.fromJson(Map<String, dynamic> json) =>
      _$RoadResponseApiFromJson(json);
  Map<String, dynamic> toJson() => _$RoadResponseApiToJson(this);
}

@JsonSerializable()
class RoadDataPublicRasponse {
  @JsonKey(name: "no_ruas")
  String ruas;
  @JsonKey(name: "nm_ruas")
  String nama;
  String panjang;
  String lebar;
  String fungsi;
  @JsonKey(name: "kec")
  String kecamatan;
  String pangkal;
  String ujung;
  @JsonKey(name: "lat_awal")
  String latFirst;
  @JsonKey(name: "lon_awal")
  String longFirst;
  @JsonKey(name: "lat_akhir")
  String latSecond;
  @JsonKey(name: "lon_akhir")
  String longSecond;

  RoadDataPublicRasponse({
    this.ruas = "",
    this.nama = "",
    this.panjang = "",
    this.lebar = "",
    this.fungsi = "",
    this.kecamatan = "",
    this.pangkal = "",
    this.ujung = "",
    this.latFirst = "",
    this.longFirst = "",
    this.latSecond = "",
    this.longSecond = "",
  });

  factory RoadDataPublicRasponse.fromJson(Map<String, dynamic> json) =>
      _$RoadDataPublicRasponseFromJson(json);
  Map<String, dynamic> toJson() => _$RoadDataPublicRasponseToJson(this);
}

@JsonSerializable()
class RoadResponseDetailApi {
  final String succes;
  final String message;
  final List<RoadDetailDataResponse> data;
  RoadResponseDetailApi(
      {this.succes = "", this.message = "", this.data = const []});

  factory RoadResponseDetailApi.fromJson(Map<String, dynamic> json) =>
      _$RoadResponseDetailApiFromJson(json);
  Map<String, dynamic> toJson() => _$RoadResponseDetailApiToJson(this);
}

@JsonSerializable()
class RoadDetailDataResponse {
  @JsonKey(name: "no_ruas")
  String ruas;
  @JsonKey(name: "nm_ruas")
  String nama;
  String baik;
  String sedang;
  @JsonKey(name: "rusak_berat")
  String rusakBerat;
  @JsonKey(name: "rusak_ringan")
  String rusakRingan;
  String hotmix;
  String aspal;
  String beton;
  String tanah;
  String kerikil;
  String photo1;
  String photo2;
  String photo3;
  String photo4;
  String photo5;
  String photo6;

  RoadDetailDataResponse({
    this.ruas = "",
    this.nama = "",
    this.baik = "",
    this.sedang = "",
    this.rusakBerat = "",
    this.rusakRingan = "",
    this.hotmix = "",
    this.aspal = "",
    this.beton = "",
    this.tanah = "",
    this.kerikil = "",
    this.photo1 = "",
    this.photo2 = '',
    this.photo3 = '',
    this.photo4 = '',
    this.photo5 = '',
    this.photo6 = '',
  });

  factory RoadDetailDataResponse.fromJson(Map<String, dynamic> json) =>
      _$RoadDetailDataResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RoadDetailDataResponseToJson(this);
}
