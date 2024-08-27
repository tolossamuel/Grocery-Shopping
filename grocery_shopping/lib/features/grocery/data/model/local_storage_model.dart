import 'package:hive/hive.dart';

@HiveType(typeId: 1) // typeId should be unique for each model
class CartProduct {
  @HiveField(0) // unique id for each field
  Map<String, dynamic> products = {};

  CartProduct({required this.products});
}