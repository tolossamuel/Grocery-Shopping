


import 'package:dartz/dartz.dart';
import 'package:grocery_shopping/core/failure/failure.dart';
import 'package:grocery_shopping/features/grocery/data/datasource/grocery_remote_datasource.dart';
import 'package:grocery_shopping/features/grocery/data/model/grocery_model.dart';
import 'package:grocery_shopping/features/grocery/domain/entity/grocery_entity.dart';
import 'package:grocery_shopping/features/grocery/domain/repository/grocery_repository.dart';

class GroceryRepositoryImpl  extends GroceryRepository{
  final GroceryRemoteDatasource groceryRemoteDatasource;
  GroceryRepositoryImpl ({
    required this.groceryRemoteDatasource
  });
  @override
  Future<Either<Failure, List<GroceryEntity>>> getGroceryList() async {
    try {
      final result = await groceryRemoteDatasource.getGroceryProducts();
      final List<GroceryEntity> groceryEntityList = [];
      for (GroceryModel data in result){
        groceryEntityList.add(data.toEntity());
      }
      return Right(groceryEntityList);
      
    } catch (e) {
      return Left(ConnectionFailur(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, GroceryEntity>> getGroceryProduct(String productId) async{
    try {
      final result = await groceryRemoteDatasource.getOneGroceryProducts(productId);
      final GroceryEntity groceryEntity = result.toEntity();
      
      return Right(groceryEntity);
      
    } catch (e) {
      return Left(ConnectionFailur(message: e.toString()));
    }
  }

  @override

  List<Object?> get props => [];
}