class Jalan {
  String? noRuas;
  String? nmRuas;
  String? panjang;
  String? lebar;
  String? fungsi;
  String? kec;
  String? pangkal;
  String? ujung;
  String? latAwal;
  String? lonAwal;
  String? latAkhir;
  String? lonAkhir;

  Jalan(
      {this.noRuas,
      this.nmRuas,
      this.panjang,
      this.lebar,
      this.fungsi,
      this.kec,
      this.pangkal,
      this.ujung,
      this.latAwal,
      this.lonAwal,
      this.latAkhir,
      this.lonAkhir});

  Jalan.fromJson(Map<String, dynamic> json) {
    noRuas = json['no_ruas'];
    nmRuas = json['nm_ruas'];
    panjang = json['panjang'];
    lebar = json['lebar'];
    fungsi = json['fungsi'];
    kec = json['kec'];
    pangkal = json['pangkal'];
    ujung = json['ujung'];
    latAwal = json['lat_awal'];
    lonAwal = json['lon_awal'];
    latAkhir = json['lat_akhir'];
    lonAkhir = json['lon_akhir'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no_ruas'] = noRuas;
    data['nm_ruas'] = nmRuas;
    data['panjang'] = panjang;
    data['lebar'] = lebar;
    data['fungsi'] = fungsi;
    data['kec'] = kec;
    data['pangkal'] = pangkal;
    data['ujung'] = ujung;
    data['lat_awal'] = latAwal;
    data['lon_awal'] = lonAwal;
    data['lat_akhir'] = latAkhir;
    data['lon_akhir'] = lonAkhir;
    return data;
  }
}
