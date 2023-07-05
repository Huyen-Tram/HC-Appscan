import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 1)
class Product {
  Product({
    required this.id,
    this.name,
    this.image,
    this.description,
    this.dateOfManufacture,
    this.expirationDate,
    this.lotCode,
    this.dateTimeScan,

  });

  @HiveField(0)
  String id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? image;
  @HiveField(3)
  String? description;
  @HiveField(4)
  String? dateOfManufacture;
  @HiveField(5)
  String? expirationDate;
  @HiveField(6)
  String? lotCode;
  @HiveField(7)
  String? dateTimeScan;

factory Product.fromMap(Map<String, dynamic> json) => Product(
  id: json["id"]as String,
  name: json["name"] as String?,
  image: json["image"] as String?,
  description: json["description"] as String?,
  dateOfManufacture: json["dateOfManufacture"] as String?,
  expirationDate: json["expirationDate"] as String?,
  lotCode: json["lotCode"] as String?,
 
);

Map<String, dynamic> toMap() => {
  "name": name,
  "image": image,
  "description": description,
  "dateOfManufacture": dateOfManufacture,
  "expirationDate": expirationDate,
  "lotCode": lotCode,
};
}
