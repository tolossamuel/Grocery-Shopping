

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:grocery_shopping/features/grocery/data/model/grocery_model.dart';
import 'package:mockito/mockito.dart';

import '../../../../helper/jsonr_espond/read_json.dart';
import '../../../../helper/mock_data.mocks.dart';

void main() {


  late MockGroceryRemoteDataSourceImpl groceryRemoteDataSourceImpl;


  setUpAll((){

    groceryRemoteDataSourceImpl = MockGroceryRemoteDataSourceImpl();
  });


  group(
    'test the grocery remote datasource',
    () {
      test(
        'test get all grocery product http request success return', 
        () async {
          final jsonResponse = readJson('helper/jsonr_espond/all_grocery_product.json');
          final groceryModels = (json.decode(jsonResponse)['data'] as List)
              .map((data) => GroceryModel.fromJson(data))
              .toList();
              
          when(groceryRemoteDataSourceImpl.getGroceryProducts()).thenAnswer(
            (_) async => groceryModels,
          );

          final result = await groceryRemoteDataSourceImpl.getGroceryProducts();
          expect(result, isA<List<GroceryModel>>());
          expect(result, groceryModels);  // Ensure it returns the expected list
        },
      );

      test(
        'test get one grocery product http request success return', 
        () async {
          final jsonResponse = readJson('helper/jsonr_espond/single_grocery_product.json');
          final groceryModel = GroceryModel.fromJson(json.decode(jsonResponse)['data']);

          when(groceryRemoteDataSourceImpl.getOneGroceryProducts('1')).thenAnswer(
            (_) async => groceryModel,
          );

          final result = await groceryRemoteDataSourceImpl.getOneGroceryProducts('1');
          expect(result, isA<GroceryModel>());
          expect(result, groceryModel);  // Ensure it returns the expected object
        },
      );


      
    }
    );
}