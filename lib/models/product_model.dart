import 'dart:convert';

class ProductModel {
  String articleCode;
  String shopCode;
  DateTime availableFrom;
  DateTime availableUntil;
  double eatOutPrice;
  double eatInPrice;
  String articleName;
  List<String> dayParts;
  String internalDescription;
  String customerDescription;
  String imageUri;
  String thumbnailUri;
  int quantity;

  ProductModel({
    required this.articleCode,
    required this.shopCode,
    required this.availableFrom,
    required this.availableUntil,
    required this.eatOutPrice,
    required this.eatInPrice,
    required this.articleName,
    required this.dayParts,
    required this.internalDescription,
    required this.customerDescription,
    required this.imageUri,
    required this.thumbnailUri,
    this.quantity = 0
  });

  factory ProductModel.fromRawJson(String str) => ProductModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    articleCode: json["articleCode"],
    shopCode: json["shopCode"],
    availableFrom: DateTime.parse(json["availableFrom"]),
    availableUntil: DateTime.parse(json["availableUntil"]),
    eatOutPrice: json["eatOutPrice"]?.toDouble(),
    eatInPrice: json["eatInPrice"]?.toDouble(),
    articleName: json["articleName"],
    dayParts: List<String>.from(json["dayParts"].map((x) => x)),
    internalDescription: json["internalDescription"],
    customerDescription: json["customerDescription"],
    imageUri: json["imageUri"],
    thumbnailUri: json["thumbnailUri"],
  );

  Map<String, dynamic> toJson() => {
    "articleCode": articleCode,
    "shopCode": shopCode,
    "availableFrom": availableFrom.toIso8601String(),
    "availableUntil": availableUntil.toIso8601String(),
    "eatOutPrice": eatOutPrice,
    "eatInPrice": eatInPrice,
    "articleName": articleName,
    "dayParts": List<dynamic>.from(dayParts.map((x) => x)),
    "internalDescription": internalDescription,
    "customerDescription": customerDescription,
    "imageUri": imageUri,
    "thumbnailUri": thumbnailUri,
  };
}
