


import 'dart:convert';

import 'package:grocery_shopping/core/API/api_endPoint.dart';
import 'package:grocery_shopping/core/failure/failure.dart';
import 'package:grocery_shopping/features/grocery/data/model/grocery_model.dart';
import 'package:http/http.dart' as http;
// import 'package:http_parser/http_parser.dart';

abstract class GroceryRemoteDatasource{

  Future<List<GroceryModel>> getGroceryProducts();
  Future<GroceryModel> getOneGroceryProducts(String productId);
}

class GroceryRemoteDataSourceImpl implements GroceryRemoteDatasource{
  final http.Client client;

  GroceryRemoteDataSourceImpl({
    required this.client
  });
  @override
  Future<List<GroceryModel>> getGroceryProducts() async{
    try {
      final List<GroceryModel> groceryModelList = [];
      final respond =  await client.get(
        Uri.parse(ApiEndpoint.getAllProductApi())
      );
      
      if (respond.statusCode == 200){
        final jsonDecode = json.decode(respond.body);
   
        for (dynamic data in jsonDecode['data']){
          final groceryModel = GroceryModel.fromJson(data);
          groceryModelList.add(groceryModel);
        }
        
        return groceryModelList;
      }
      else {
        throw ServerFailure(message: 'try again');
      }
    } catch(e) {
      throw ConnectionFailur(message: e.toString());
    }
  }

  @override
  Future<GroceryModel> getOneGroceryProducts(String productId) async{
    try {
      
      final respond =  await client.get(
        Uri.parse(ApiEndpoint.getOneProductApi(productId))
      );
      if (respond == 200){
        final jsonDecode = json.decode(respond.body);
        final GroceryModel groceryModel = GroceryModel.fromJson(jsonDecode['data']);
        return groceryModel;
      }
      else {
        throw ServerFailure(message: 'try again');
      }
    } catch(e) {
      throw ConnectionFailur(message: e.toString());
    }
  }
  
}