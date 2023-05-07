// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bridge_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BridgeResponseApi _$BridgeResponseApiFromJson(Map<String, dynamic> json) =>
    BridgeResponseApi(
      succes: json['succes'] as String? ?? "",
      message: json['message'] as String? ?? "",
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => BridgeData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$BridgeResponseApiToJson(BridgeResponseApi instance) =>
    <String, dynamic>{
      'succes': instance.succes,
      'message': instance.message,
      'data': instance.data,
    };

BridgeData _$BridgeDataFromJson(Map<String, dynamic> json) => BridgeData(
      id: json['ID'] as String? ?? "",
      ruas: json['no_ruas'] as String? ?? "",
      nama: json['nm_ruas'] as String? ?? "",
      noBridge: json['no_jbt'] as String? ?? "",
      nmBridge: json['nm_jbt'] as String? ?? "",
      kecamatan: json['kecamatan'] as String? ?? "",
      latitude: json['latitude'] as String? ?? "",
      longitude: json['longitude'] as String? ?? "",
      tahun: json['tahun_pmb'] as String? ?? "",
    );

Map<String, dynamic> _$BridgeDataToJson(BridgeData instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'no_ruas': instance.ruas,
      'nm_ruas': instance.nama,
      'no_jbt': instance.noBridge,
      'nm_jbt': instance.nmBridge,
      'kecamatan': instance.kecamatan,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'tahun_pmb': instance.tahun,
    };

BridgeDetailDataResponse _$BridgeDetailDataResponseFromJson(
        Map<String, dynamic> json) =>
    BridgeDetailDataResponse(
      id: json['ID'] as String? ?? "",
      ruas: json['no_ruas'] as String? ?? "",
      bahan1Lt: json['Bhn1_Lt'] as String? ?? "",
      bahan1San: json['Bhn1_San'] as String? ?? "",
      bahan2Lt: json['Bhn2_Lt'] as String? ?? "",
      bahan2San: json['Bhn2_San'] as String? ?? "",
      bentang: json['jml_bentang'] as String? ?? "",
      bhnStr: json['Bhn_Str'] as String? ?? "",
      foto: json['foto'] as List<dynamic>? ?? const [],
      kdStr: json['Kds_Str'] as String? ?? "",
      kdsLt: json['Kds_Lt'] as String? ?? "",
      kerusakan1: json['Kerusakan1'] as String? ?? "",
      kerusakan2: json['Kerusakan2'] as String? ?? "",
      kdsSan: json['Kds_San'] as String? ?? "",
      kpBahan: json['Kp_Bhn'] as String? ?? "",
      kpKon: json['Kp_Kon'] as String? ?? "",
      kpTipe: json['Kp_Tipe'] as String? ?? "",
      lebar: json['lebar'] as String? ?? "",
      nama: json['nm_ruas'] as String? ?? "",
      nk: json['NK'] as String? ?? "",
      nmBridge: json['nm_jbt'] as String? ?? "",
      noBridge: json['no_jbt'] as String? ?? "",
      panjang: json['panjang'] as String? ?? "",
      pdBahan: json['Pd_Bhn'] as String? ?? "",
      pdKon: json['Pd_Kon'] as String? ?? "",
      pdTipe: json['Pd_Tipe'] as String? ?? "",
      penanganan: json['Penanganan'] as String? ?? "",
      url: json['url_foto'] as String? ?? "",
      tipeStr: json['Tipe_Str'] as String? ?? "",
    );

Map<String, dynamic> _$BridgeDetailDataResponseToJson(
        BridgeDetailDataResponse instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'no_ruas': instance.ruas,
      'nm_ruas': instance.nama,
      'no_jbt': instance.noBridge,
      'nm_jbt': instance.nmBridge,
      'panjang': instance.panjang,
      'lebar': instance.lebar,
      'jml_bentang': instance.bentang,
      'Tipe_Str': instance.tipeStr,
      'Bhn_Str': instance.bhnStr,
      'Kds_Str': instance.kdStr,
      'Bhn1_Lt': instance.bahan1Lt,
      'Bhn2_Lt': instance.bahan2Lt,
      'Kds_Lt': instance.kdsLt,
      'Bhn1_San': instance.bahan1San,
      'Bhn2_San': instance.bahan2San,
      'Kds_San': instance.kdsSan,
      'Kp_Tipe': instance.kpTipe,
      'Kp_Bhn': instance.kpBahan,
      'Kp_Kon': instance.kpKon,
      'Pd_Tipe': instance.pdTipe,
      'Pd_Bhn': instance.pdBahan,
      'Pd_Kon': instance.pdKon,
      'NK': instance.nk,
      'Kerusakan1': instance.kerusakan1,
      'Kerusakan2': instance.kerusakan2,
      'Penanganan': instance.penanganan,
      'foto': instance.foto,
      'url_foto': instance.url,
    };
