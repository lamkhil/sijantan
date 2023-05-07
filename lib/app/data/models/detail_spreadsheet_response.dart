// ignore_for_file: unnecessary_new, prefer_collection_literals

import 'package:collection/collection.dart';

class DetailSpreadSheetResponse {
  List<KondisiJalan>? jalan;
  List<KondisiJembatan>? jembatan;
  List<List<num>>? kondisi;
  List<User>? user;

  List<Banner>? banner;

  DetailSpreadSheetResponse({this.jalan, this.jembatan, this.kondisi});

  DetailSpreadSheetResponse.fromJson(Map<String, dynamic> json) {
    if (json['kondisi_jalan'] != null) {
      kondisi = <List<num>>[];
      var cond = json['kondisi_jalan'] as List;
      for (List element in cond) {
        var data = <num>[];
        for (var element2 in element) {
          if (element2 is! String) {
            data.add(element2);
          }
        }
        kondisi!.add(data);
      }
    }
    if (json['jalan'] != null) {
      jalan = <KondisiJalan>[];
      int i = 0;
      json['jalan'].forEach((v) {
        if (i >= kondisi!.length) {
          i = 0;
        }
        final kondisiJalan = kondisi![i];
        List<Map<String, double>> data = [];
        for (var element in kondisiJalan) {
          var p = data.lastOrNull;
          if (element < 50) {
            if (p == null) {
              data.add({'baik': 1.0});
            } else {
              if (p.keys.first == 'baik') {
                data[data.length - 1]['baik'] =
                    data[data.length - 1]['baik']! + 1;
              } else {
                data.add({'baik': 1});
              }
            }
          } else if (element < 100) {
            if (p == null) {
              data.add({'sedang': 1.0});
            } else {
              if (p.keys.first == 'sedang') {
                data[data.length - 1]['sedang'] =
                    data[data.length - 1]['sedang']! + 1;
              } else {
                data.add({'sedang': 1});
              }
            }
          } else if (element < 150) {
            if (p == null) {
              data.add({'rusak_sedang': 1.0});
            } else {
              if (p.keys.first == 'rusak_sedang') {
                data[data.length - 1]['rusak_sedang'] =
                    data[data.length - 1]['rusak_sedang']! + 1;
              } else {
                data.add({'rusak_sedang': 1});
              }
            }
          } else {
            if (p == null) {
              data.add({'rusak_berat': 1.0});
            } else {
              if (p.keys.first == 'rusak_berat') {
                data[data.length - 1]['rusak_berat'] =
                    data[data.length - 1]['rusak_berat']! + 1;
              } else {
                data.add({'rusak_berat': 1});
              }
            }
          }
        }
        var result = KondisiJalan.fromJson(v);
        result.kondisiJalan = data;
        jalan!.add(result);
        print("test:${jalan!.last.noRuas}: ${jalan!.last.kondisiJalan}");
        i++;
      });
    }
    if (json['jembatan'] != null) {
      jembatan = <KondisiJembatan>[];
      json['jembatan'].forEach((v) {
        jembatan!.add(KondisiJembatan.fromJson(v));
      });
    }

    if (json['user'] != null) {
      user = <User>[];
      json['user'].forEach((v) {
        user!.add(User.fromJson(v));
      });
    }
    if (json['banner'] != null) {
      banner = <Banner>[];
      json['banner'].forEach((v) {
        banner!.add(Banner.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (jalan != null) {
      data['jalan'] = jalan!.map((v) => v.toJson()).toList();
    }
    if (jembatan != null) {
      data['jembatan'] = jembatan!.map((v) => v.toJson()).toList();
    }
    if (banner != null) {
      data['banner'] = banner!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Banner {
  String? id;
  String? linkDrive;
  String? link;
  String? title;
  String? subtitle;
  String? redirectLink;

  Banner(
      {this.id,
      this.linkDrive,
      this.link,
      this.title,
      this.subtitle,
      this.redirectLink});

  Banner.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    linkDrive = json['link_drive'];
    link = json['link'];
    title = json['title'];
    subtitle = json['subtitle'];
    redirectLink = json['redirect_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['link_drive'] = linkDrive;
    data['link'] = link;
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['redirect_link'] = redirectLink;
    return data;
  }
}

class KondisiJalan {
  String? noRuas;
  String? nmRuas;
  String? baik;
  String? sedang;
  String? rusakRingan;
  String? rusakBerat;
  String? hotmix;
  String? aspal;
  String? beton;
  String? tanah;
  String? kerikil;
  String? photo1;
  String? photo2;
  String? photo3;
  String? photo4;
  String? photo5;
  String? photo6;
  String? tahun;
  List<Map<String, double>>? kondisiJalan;
  int? kondisi;

  KondisiJalan(
      {this.noRuas,
      this.nmRuas,
      this.baik,
      this.sedang,
      this.rusakRingan,
      this.rusakBerat,
      this.hotmix,
      this.aspal,
      this.beton,
      this.kerikil,
      this.photo1,
      this.photo2,
      this.photo3,
      this.photo4,
      this.photo5,
      this.photo6,
      this.tahun,
      this.kondisiJalan,
      this.kondisi,
      this.tanah});

  KondisiJalan.fromJson(Map<String, dynamic> json) {
    noRuas = json['no_ruas'];
    nmRuas = json['nm_ruas'];
    baik = json['baik'];
    sedang = json['sedang'];
    rusakRingan = json['rusak_ringan'];
    rusakBerat = json['rusak_berat'];
    hotmix = json['hotmix'];
    aspal = json['aspal'];
    beton = json['beton'];
    kerikil = json['kerikil'];
    photo1 = json['photo1'];
    photo2 = json['photo2'];
    photo3 = json['photo3'];
    photo4 = json['photo4'];
    photo5 = json['photo5'];
    photo6 = json['photo6'];
    tanah = json['tanah'];
    tahun = json['tahun'];
    List<double> kondisiList = [
      double.tryParse(baik ?? '') ?? 0,
      double.tryParse(sedang ?? '') ?? 0,
      double.tryParse(rusakRingan ?? '') ?? 0,
      double.tryParse(rusakBerat ?? '') ?? 0
    ];
    var max = kondisiList
        .reduce((value, element) => element > value ? element : value);
    kondisi = kondisiList.indexOf(max);
    kondisiJalan = json['kondisi_jalan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no_ruas'] = noRuas;
    data['nm_ruas'] = nmRuas;
    data['baik'] = baik;
    data['sedang'] = sedang;
    data['rusak_ringan'] = rusakRingan;
    data['rusak_berat'] = rusakBerat;
    data['hotmix'] = hotmix;
    data['aspal'] = aspal;
    data['beton'] = beton;
    data['kerikil'] = kerikil;
    data['photo1'] = photo1;
    data['photo2'] = photo2;
    data['photo3'] = photo3;
    data['photo4'] = photo4;
    data['photo5'] = photo5;
    data['photo6'] = photo6;
    data['tahun'] = tahun;
    data['kondisi_jalan'] = kondisiJalan;
    data['tanah'] = tanah;
    return data;
  }
}

class KondisiJembatan {
  String? iD;
  String? noRuas;
  String? nmRuas;
  String? noJbt;
  String? nmJbt;
  String? panjang;
  String? lebar;
  String? jmlBentang;
  String? tipeStr;
  String? bhnStr;
  String? kdsStr;
  String? bhn1Lt;
  String? bhn2Lt;
  String? kdsLt;
  String? bhn1San;
  String? bhn2San;
  String? kdsSan;
  String? kpTipe;
  String? kpBhn;
  String? kpKon;
  String? pdTipe;
  String? pdBhn;
  String? pdKon;
  String? nK;
  String? kerusakan1;
  String? kerusakan2;
  String? penanganan;
  String? tahun;
  String? photo1;
  String? photo2;
  String? photo3;
  String? photo4;
  String? photo5;
  String? photo6;
  String? photo7;
  String? photo8;
  String? photo9;
  String? photo10;
  String? url_foto;
  List<String>? foto;

  KondisiJembatan(
      {this.iD,
      this.noRuas,
      this.nmRuas,
      this.noJbt,
      this.nmJbt,
      this.panjang,
      this.lebar,
      this.jmlBentang,
      this.tipeStr,
      this.bhnStr,
      this.kdsStr,
      this.bhn1Lt,
      this.bhn2Lt,
      this.kdsLt,
      this.bhn1San,
      this.bhn2San,
      this.kdsSan,
      this.kpTipe,
      this.kpBhn,
      this.kpKon,
      this.pdTipe,
      this.pdBhn,
      this.pdKon,
      this.nK,
      this.kerusakan1,
      this.kerusakan2,
      this.penanganan,
      this.tahun,
      this.photo1,
      this.photo2,
      this.photo3,
      this.photo4,
      this.photo5,
      this.photo6,
      this.photo7,
      this.photo8,
      this.photo9,
      this.photo10,
      this.foto,
      this.url_foto});

  KondisiJembatan.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    noRuas = json['no_ruas'];
    nmRuas = json['nm_ruas'];
    noJbt = json['no_jbt'];
    nmJbt = json['nm_jbt'];
    panjang = json['panjang'];
    lebar = json['lebar'];
    jmlBentang = json['jml_bentang'];
    tipeStr = json['Tipe_Str'];
    bhnStr = json['Bhn_Str'];
    kdsStr = json['Kds_Str'];
    bhn1Lt = json['Bhn1_Lt'];
    bhn2Lt = json['Bhn2_Lt'];
    kdsLt = json['Kds_Lt'];
    bhn1San = json['Bhn1_San'];
    bhn2San = json['Bhn2_San'];
    kdsSan = json['Kds_San'];
    kpTipe = json['Kp_Tipe'];
    kpBhn = json['Kp_Bhn'];
    kpKon = json['Kp_Kon'];
    pdTipe = json['Pd_Tipe'];
    pdBhn = json['Pd_Bhn'];
    pdKon = json['Pd_Kon'];
    nK = json['NK'];
    kerusakan1 = json['Kerusakan1'];
    kerusakan2 = json['Kerusakan2'];
    penanganan = json['Penanganan'];
    tahun = json['tahun'];
    photo1 = json['photo1'];
    photo2 = json['photo2'];
    photo3 = json['photo3'];
    photo4 = json['photo4'];
    photo5 = json['photo5'];
    photo6 = json['photo6'];
    photo7 = json['photo7'];
    photo8 = json['photo8'];
    photo9 = json['photo9'];
    photo10 = json['photo10'];
    url_foto = json['url_foto'];
    if (json['foto'] is List) {
      if (json['foto'][0] is List) {
        foto = <String>[];
        (json['foto'] as List)[0].forEach((element) {
          foto!.add(element);
        });
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['no_ruas'] = noRuas;
    data['nm_ruas'] = nmRuas;
    data['no_jbt'] = noJbt;
    data['nm_jbt'] = nmJbt;
    data['panjang'] = panjang;
    data['lebar'] = lebar;
    data['jml_bentang'] = jmlBentang;
    data['Tipe_Str'] = tipeStr;
    data['Bhn_Str'] = bhnStr;
    data['Kds_Str'] = kdsStr;
    data['Bhn1_Lt'] = bhn1Lt;
    data['Bhn2_Lt'] = bhn2Lt;
    data['Kds_Lt'] = kdsLt;
    data['Bhn1_San'] = bhn1San;
    data['Bhn2_San'] = bhn2San;
    data['Kds_San'] = kdsSan;
    data['Kp_Tipe'] = kpTipe;
    data['Kp_Bhn'] = kpBhn;
    data['Kp_Kon'] = kpKon;
    data['Pd_Tipe'] = pdTipe;
    data['Pd_Bhn'] = pdBhn;
    data['Pd_Kon'] = pdKon;
    data['NK'] = nK;
    data['Kerusakan1'] = kerusakan1;
    data['Kerusakan2'] = kerusakan2;
    data['Penanganan'] = penanganan;
    data['tahun'] = tahun;
    data['photo1'] = photo1;
    data['photo2'] = photo2;
    data['photo3'] = photo3;
    data['photo4'] = photo4;
    data['photo5'] = photo5;
    data['photo6'] = photo6;
    data['photo7'] = photo7;
    data['photo8'] = photo8;
    data['photo9'] = photo9;
    data['photo10'] = photo10;
    return data;
  }
}

class User {
  String? nama;
  String? email;
  String? avatar;
  String? password;
  String? created_at;
  String? updated_at;

  User(
      {this.updated_at,
      this.password,
      this.nama,
      this.email,
      this.created_at,
      this.avatar});

  factory User.fromJson(Map json) => User(
      nama: json['nama'],
      email: json['email'],
      avatar: json['avatar'],
      password: json['password'],
      created_at: json['created_at'],
      updated_at: json['updated_at']);

  toJson() => {
        'nama': nama,
        'email': email,
        'avatar': avatar,
        'password': password,
        'created_at': created_at,
        'updated_at': updated_at
      };
}
