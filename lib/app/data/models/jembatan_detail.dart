class Jembatan {
  String? iD;
  String? noRuas;
  String? nmRuas;
  String? noJbt;
  String? nmJbt;
  String? kecamatan;
  String? latitude;
  String? longitude;
  String? tahunPemb;

  Jembatan(
      {this.iD,
      this.noRuas,
      this.nmRuas,
      this.noJbt,
      this.nmJbt,
      this.kecamatan,
      this.latitude,
      this.longitude,
      this.tahunPemb});

  Jembatan.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    noRuas = json['no_ruas'];
    nmRuas = json['nm_ruas'];
    noJbt = json['no_jbt'];
    nmJbt = json['nm_jbt'];
    kecamatan = json['kecamatan'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    tahunPemb = json['tahun_pemb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['no_ruas'] = noRuas;
    data['nm_ruas'] = nmRuas;
    data['no_jbt'] = noJbt;
    data['nm_jbt'] = nmJbt;
    data['kecamatan'] = kecamatan;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['tahun_pemb'] = tahunPemb;
    return data;
  }
}
