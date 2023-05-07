// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'road_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoadResponseApi _$RoadResponseApiFromJson(Map<String, dynamic> json) =>
    RoadResponseApi(
      succes: json['succes'] as String? ?? "",
      message: json['message'] as String? ?? "",
      data: (json['data'] as List<dynamic>?)
              ?.map((e) =>
                  RoadDataPublicRasponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RoadResponseApiToJson(RoadResponseApi instance) =>
    <String, dynamic>{
      'succes': instance.succes,
      'message': instance.message,
      'data': instance.data,
    };

RoadDataPublicRasponse _$RoadDataPublicRasponseFromJson(
        Map<String, dynamic> json) =>
    RoadDataPublicRasponse(
      ruas: json['no_ruas'] as String? ?? "",
      nama: json['nm_ruas'] as String? ?? "",
      panjang: json['panjang'] as String? ?? "",
      lebar: json['lebar'] as String? ?? "",
      fungsi: json['fungsi'] as String? ?? "",
      kecamatan: json['kec'] as String? ?? "",
      pangkal: json['pangkal'] as String? ?? "",
      ujung: json['ujung'] as String? ?? "",
      latFirst: json['lat_awal'] as String? ?? "",
      longFirst: json['lon_awal'] as String? ?? "",
      latSecond: json['lat_akhir'] as String? ?? "",
      longSecond: json['lon_akhir'] as String? ?? "",
    );

Map<String, dynamic> _$RoadDataPublicRasponseToJson(
        RoadDataPublicRasponse instance) =>
    <String, dynamic>{
      'no_ruas': instance.ruas,
      'nm_ruas': instance.nama,
      'panjang': instance.panjang,
      'lebar': instance.lebar,
      'fungsi': instance.fungsi,
      'kec': instance.kecamatan,
      'pangkal': instance.pangkal,
      'ujung': instance.ujung,
      'lat_awal': instance.latFirst,
      'lon_awal': instance.longFirst,
      'lat_akhir': instance.latSecond,
      'lon_akhir': instance.longSecond,
    };

RoadResponseDetailApi _$RoadResponseDetailApiFromJson(
        Map<String, dynamic> json) =>
    RoadResponseDetailApi(
      succes: json['succes'] as String? ?? "",
      message: json['message'] as String? ?? "",
      data: (json['data'] as List<dynamic>?)
              ?.map((e) =>
                  RoadDetailDataResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RoadResponseDetailApiToJson(
        RoadResponseDetailApi instance) =>
    <String, dynamic>{
      'succes': instance.succes,
      'message': instance.message,
      'data': instance.data,
    };

RoadDetailDataResponse _$RoadDetailDataResponseFromJson(
        Map<String, dynamic> json) =>
    RoadDetailDataResponse(
      ruas: json['no_ruas'] as String? ?? "",
      nama: json['nm_ruas'] as String? ?? "",
      baik: json['baik'] as String? ?? "",
      sedang: json['sedang'] as String? ?? "",
      rusakBerat: json['rusak_berat'] as String? ?? "",
      rusakRingan: json['rusak_ringan'] as String? ?? "",
      hotmix: json['hotmix'] as String? ?? "",
      aspal: json['aspal'] as String? ?? "",
      beton: json['beton'] as String? ?? "",
      tanah: json['tanah'] as String? ?? "",
      kerikil: json['kerikil'] as String? ?? "",
      photo1: json['photo1'] as String? ?? "",
      photo2: json['photo2'] as String? ?? '',
      photo3: json['photo3'] as String? ?? '',
      photo4: json['photo4'] as String? ?? '',
      photo5: json['photo5'] as String? ?? '',
      photo6: json['photo6'] as String? ?? '',
    );

Map<String, dynamic> _$RoadDetailDataResponseToJson(
        RoadDetailDataResponse instance) =>
    <String, dynamic>{
      'no_ruas': instance.ruas,
      'nm_ruas': instance.nama,
      'baik': instance.baik,
      'sedang': instance.sedang,
      'rusak_berat': instance.rusakBerat,
      'rusak_ringan': instance.rusakRingan,
      'hotmix': instance.hotmix,
      'aspal': instance.aspal,
      'beton': instance.beton,
      'tanah': instance.tanah,
      'kerikil': instance.kerikil,
      'photo1': instance.photo1,
      'photo2': instance.photo2,
      'photo3': instance.photo3,
      'photo4': instance.photo4,
      'photo5': instance.photo5,
      'photo6': instance.photo6,
    };
