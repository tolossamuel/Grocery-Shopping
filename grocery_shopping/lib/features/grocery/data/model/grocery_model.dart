

import 'package:grocery_shopping/features/grocery/domain/entity/grocery_entity.dart';

class GroceryModel extends GroceryEntity{
  GroceryModel({
    required super.id,
    required super.title,
    required super.rating,
    required super.price,
    required super.discount,
    required super.description,
    required super.options,
    required super.imageUrl
    });

    factory GroceryModel.fromJson(dynamic json) => GroceryModel(
      id : json['id'],
      title : json['title'],
      rating : json['rating'],
      price : json['price'].toDouble(),
      discount : json['discount'].toDouble(),
      description:  json['description'],
      imageUrl:  json['imageUrl'],
      options: json['options']
    );

    GroceryEntity toEntity() => GroceryEntity(
      id:id,
      title:title,
      rating: rating,
      price:price,
      discount: discount,
      description: description,
      options: options,
      imageUrl: imageUrl
    );

    

}