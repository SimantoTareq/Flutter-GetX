// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isVisible,
    required this.isAvailable,
    required this.foodItemCategory,
    required this.price,
    required this.stockItems,
  });

  int id;
  String name;
  String image;
  int isVisible;
  int isAvailable;
  List<FoodItemCategory> foodItemCategory;
  List<Price> price;
  List<StockItem> stockItems;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        isVisible: json["is_visible"],
        isAvailable: json["is_available"],
        foodItemCategory: List<FoodItemCategory>.from(json["food_item_category"]
            .map((x) => FoodItemCategory.fromJson(x))),
        price: List<Price>.from(json["price"].map((x) => Price.fromJson(x))),
        stockItems: List<StockItem>.from(
            json["stock_items"].map((x) => StockItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "is_visible": isVisible,
        "is_available": isAvailable,
        "food_item_category":
            List<dynamic>.from(foodItemCategory.map((x) => x.toJson())),
        "price": List<dynamic>.from(price.map((x) => x.toJson())),
        "stock_items": List<dynamic>.from(stockItems.map((x) => x.toJson())),
      };
}

class FoodItemCategory {
  FoodItemCategory({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory FoodItemCategory.fromJson(Map<String, dynamic> json) =>
      FoodItemCategory(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Price {
  Price({
    required this.originalPrice,
    required this.discountedPrice,
    required this.discountType,
    this.fixedValue,
    this.percentOf,
  });

  int originalPrice;
  int discountedPrice;
  String discountType;
  dynamic fixedValue;
  dynamic percentOf;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        originalPrice: json["original_price"],
        discountedPrice: json["discounted_price"],
        discountType: json["discount_type"],
        fixedValue: json["fixed_value"],
        percentOf: json["percent_of"],
      );

  Map<String, dynamic> toJson() => {
        "original_price": originalPrice,
        "discounted_price": discountedPrice,
        "discount_type": discountType,
        "fixed_value": fixedValue,
        "percent_of": percentOf,
      };
}

class StockItem {
  StockItem({
    required this.quantity,
  });

  int quantity;

  factory StockItem.fromJson(Map<String, dynamic> json) => StockItem(
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
      };
}
