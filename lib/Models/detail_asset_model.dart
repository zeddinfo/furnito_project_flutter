class DetailAssetModel {
  String namaasset;
  String kota;
  int hargasewa;
  String alamat;
  Photo photo;

  DetailAssetModel({this.namaasset, this.kota, this.alamat, this.photo});

  DetailAssetModel.fromJson(Map<String, dynamic> json) {
    namaasset = json['namaasset'];
    kota = json['kota'];
    hargasewa = json['harga_sewa'];
    photo = Photo.fromJson(json['dokumentasi']);
  }
}

class Photo {
  String url;

  Photo({this.url});

  Photo.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }
}
