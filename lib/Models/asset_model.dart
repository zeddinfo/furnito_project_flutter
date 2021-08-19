class AssetModel {
  String namaasset;
  String kota;
  int hargasewa;
  String urlGambar;

  AssetModel({this.namaasset, this.kota, this.hargasewa, this.urlGambar});

  AssetModel.fromJson(Map<String, dynamic> json) {
    namaasset = json['namaasset'];
    kota = json['kota'];
    hargasewa = json['harga_sewa'];
    urlGambar = json['url'];
  }
}
