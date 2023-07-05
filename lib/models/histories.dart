class ProductHistory {
  String? name;
  String? avatar;
  String? packingDate;
  String? expirationDate;
  String? lotCode;
  String? description;

  ProductHistory({this.name, this.avatar, this.packingDate, this.expirationDate, this.lotCode, this.description});
 
  // receiving data from server
  factory ProductHistory.fromMap(map) {
    return ProductHistory(
      name: map['name'],
      avatar: map['avatar'],
      packingDate: map['packingDate'],
      expirationDate: map['expirationDate'],
      lotCode: map['lotCode'],
      description: map['description'],
    
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'avatar': avatar,
      'packingDate': packingDate,
      'expirationDate': expirationDate,
      'lotCode': lotCode,
      'description': description,
    };
  }
}