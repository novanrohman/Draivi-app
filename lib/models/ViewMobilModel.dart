// To parse this JSON data, do
//
//     final viewMobilModel = viewMobilModelFromJson(jsonString);

import 'dart:convert';

ViewMobilModel viewMobilModelFromJson(String str) =>
    ViewMobilModel.fromJson(json.decode(str));

String viewMobilModelToJson(ViewMobilModel data) => json.encode(data.toJson());

class ViewMobilModel {
  ViewMobilModel({
    this.allDataMobil,
  });

  List<AllDataMobil> allDataMobil;

  factory ViewMobilModel.fromJson(Map<String, dynamic> json) => ViewMobilModel(
        allDataMobil: List<AllDataMobil>.from(
            json["allDataMobil"].map((x) => AllDataMobil.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "allDataMobil": List<dynamic>.from(allDataMobil.map((x) => x.toJson())),
      };
}

class AllDataMobil {
  AllDataMobil({
    required this.id,
    required this.namaMobil,
    required this.jenisMobil,
    required this.harga,
    required this.deskripsi,
    required this.jumlahKursi,
    required this.bahanBakar,
    required this.jenisTransmisi,
    required this.mobilPhotoPath,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
  });

  int id;
  String namaMobil;
  String jenisMobil;
  int harga;
  String deskripsi;
  int jumlahKursi;
  String bahanBakar;
  String jenisTransmisi;
  String mobilPhotoPath;
  DateTime createdAt;
  DateTime updatedAt;
  int userId;

  factory AllDataMobil.fromJson(Map<String, dynamic> json) => AllDataMobil(
        id: json["id"],
        namaMobil: json["nama_mobil"],
        jenisMobil: json["jenis_mobil"],
        harga: json["harga"],
        deskripsi: json["deskripsi"],
        jumlahKursi: json["jumlah_kursi"],
        bahanBakar: json["bahan_bakar"],
        jenisTransmisi: json["jenis_transmisi"],
        mobilPhotoPath: json["mobil_photo_path"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_mobil": namaMobil,
        "jenis_mobil": jenisMobil,
        "harga": harga,
        "deskripsi": deskripsi,
        "jumlah_kursi": jumlahKursi,
        "bahan_bakar": bahanBakar,
        "jenis_transmisi": jenisTransmisi,
        "mobil_photo_path": mobilPhotoPath,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user_id": userId,
      };
}
