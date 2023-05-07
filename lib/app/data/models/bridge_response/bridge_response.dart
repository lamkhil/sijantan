import 'package:json_annotation/json_annotation.dart';

part 'bridge_response.g.dart';

@JsonSerializable()
class BridgeResponseApi {
  final String succes;
  final String message;
  final List<BridgeData> data;
  BridgeResponseApi(
      {this.succes = "", this.message = "", this.data = const []});

  factory BridgeResponseApi.fromJson(Map<String, dynamic> json) =>
      _$BridgeResponseApiFromJson(json);
  Map<String, dynamic> toJson() => _$BridgeResponseApiToJson(this);
}

@JsonSerializable()
class BridgeData {
  @JsonKey(name: "ID")
  String id;
  @JsonKey(name: "no_ruas")
  String ruas;
  @JsonKey(name: "nm_ruas")
  String nama;
  @JsonKey(name: "no_jbt")
  String noBridge;
  @JsonKey(name: "nm_jbt")
  String nmBridge;
  String kecamatan;
  String latitude;
  String longitude;
  @JsonKey(name: "tahun_pmb")
  String tahun;

  BridgeData(
      {this.id = "",
      this.ruas = "",
      this.nama = "",
      this.noBridge = "",
      this.nmBridge = "",
      this.kecamatan = "",
      this.latitude = "",
      this.longitude = "",
      this.tahun = ""});

  factory BridgeData.fromJson(Map<String, dynamic> json) =>
      _$BridgeDataFromJson(json);
  Map<String, dynamic> toJson() => _$BridgeDataToJson(this);
}

@JsonSerializable()
class BridgeDetailDataResponse {
  @JsonKey(name: "ID")
  String id;
  @JsonKey(name: "no_ruas")
  String ruas;
  @JsonKey(name: "nm_ruas")
  String nama;
  @JsonKey(name: "no_jbt")
  String noBridge;
  @JsonKey(name: "nm_jbt")
  String nmBridge;
  String panjang;
  String lebar;
  @JsonKey(name: "jml_bentang")
  String bentang;
  @JsonKey(name: "Tipe_Str")
  String tipeStr;
  @JsonKey(name: "Bhn_Str")
  String bhnStr;
  @JsonKey(name: "Kds_Str")
  String kdStr;
  @JsonKey(name: "Bhn1_Lt")
  String bahan1Lt;
  @JsonKey(name: "Bhn2_Lt")
  String bahan2Lt;
  @JsonKey(name: "Kds_Lt")
  String kdsLt;
  @JsonKey(name: "Bhn1_San")
  String bahan1San;
  @JsonKey(name: "Bhn2_San")
  String bahan2San;
  @JsonKey(name: "Kds_San")
  String kdsSan;
  @JsonKey(name: "Kp_Tipe")
  String kpTipe;
  @JsonKey(name: "Kp_Bhn")
  String kpBahan;
  @JsonKey(name: "Kp_Kon")
  String kpKon;
  @JsonKey(name: "Pd_Tipe")
  String pdTipe;
  @JsonKey(name: "Pd_Bhn")
  String pdBahan;
  @JsonKey(name: "Pd_Kon")
  String pdKon;
  @JsonKey(name: "NK")
  String nk;
  @JsonKey(name: "Kerusakan1")
  String kerusakan1;
  @JsonKey(name: "Kerusakan2")
  String kerusakan2;
  @JsonKey(name: "Penanganan")
  String penanganan;
  List foto;
  @JsonKey(name: "url_foto")
  String url;
  BridgeDetailDataResponse(
      {this.id = "",
      this.ruas = "",
      this.bahan1Lt = "",
      this.bahan1San = "",
      this.bahan2Lt = "",
      this.bahan2San = "",
      this.bentang = "",
      this.bhnStr = "",
      this.foto = const [],
      this.kdStr = "",
      this.kdsLt = "",
      this.kerusakan1 = "",
      this.kerusakan2 = "",
      this.kdsSan = "",
      this.kpBahan = "",
      this.kpKon = "",
      this.kpTipe = "",
      this.lebar = "",
      this.nama = "",
      this.nk = "",
      this.nmBridge = "",
      this.noBridge = "",
      this.panjang = "",
      this.pdBahan = "",
      this.pdKon = "",
      this.pdTipe = "",
      this.penanganan = "",
      this.url = "",
      this.tipeStr = ""});

  factory BridgeDetailDataResponse.fromJson(Map<String, dynamic> json) =>
      _$BridgeDetailDataResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BridgeDetailDataResponseToJson(this);
}
