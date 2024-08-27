


import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:grocery_shopping/features/grocery/data/model/grocery_model.dart';
import 'package:grocery_shopping/features/grocery/domain/entity/grocery_entity.dart';

import '../../../../helper/jsonr_espond/read_json.dart';

void main() {

  final GroceryModel groceryModel = GroceryModel(
    id: "66be460f71fccd1506882d24",
    title: "Chicken Burger",
    imageUrl: "https://res.cloudinary.com/g5-mobile-track/image/upload/v1723747446/assessment/xhvgqvpt7pghwaeqnids.jpg",
    rating: 4.9,
    price: 11.0,
    discount: 6.0,
    description: "A delicious chicken burger served on a toasted bun with fresh lettuce, tomato slices, and mayonnaise. Juicy grilled chicken patty seasoned to perfection for a mouthwatering taste experience.",
    options: [
      {
        "id": "66be474571fccd1506882d26",
        "name": "Add Cheese",
        "price": 0.5
      },
      {
        "id": "66be479671fccd1506882d28",
        "name": "Add Bacon",
        "price": 1
      },
      {
        "id": "66be47c671fccd1506882d29",
        "name": "Add Meat",
        "price": 0
      }
    ]
  );

  group(
    'test the model of the grocery feature', 
    () {

      test('test the similarity of the grocery entity and grocery model',
      () async {
        expect(groceryModel,isA<GroceryEntity>());
      });

      test('test from json in model',
      () async{
        final dynamic jsonData = json.decode(readJson('helper/jsonr_espond/single_grocery_product.json'));
        final result = GroceryModel.fromJson(jsonData['data']);
       
      
        // expect(deepEquality(result, groceryModel), isTrue);
        expect(result, isA<GroceryModel>());
      });
    });

}