import 'dart:convert';

class ProductModel {
  String? itemName;

  ProductModel({
    this.itemName,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (itemName != null) {
      result.addAll({'item_name': itemName});
    }

    return result;
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      itemName: map['itemName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source));
}
