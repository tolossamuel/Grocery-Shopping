import 'package:dartz/dartz.dart';
import 'package:grocery_shopping/core/failure/failure.dart';
import 'package:grocery_shopping/features/grocery/data/datasource/grocery_local_datasource.dart';
import 'package:grocery_shopping/features/grocery/data/datasource/grocery_remote_datasource.dart';
import 'package:grocery_shopping/features/grocery/data/model/grocery_model.dart';
import 'package:grocery_shopping/features/grocery/data/model/local_storage_model.dart';
import 'package:grocery_shopping/features/grocery/domain/entity/grocery_entity.dart';
import 'package:grocery_shopping/features/grocery/domain/repository/grocery_repository.dart';

class GroceryRepositoryImpl extends GroceryRepository {
  final GroceryRemoteDatasource groceryRemoteDatasource;
  final CartService service;
  GroceryRepositoryImpl({
    required this.groceryRemoteDatasource,
    required this.service
    });
  @override
  Future<Either<Failure, List<GroceryEntity>>> getGroceryList() async {
    try {
      final result = await groceryRemoteDatasource.getGroceryProducts();
      final List<GroceryEntity> groceryEntityList = [];
      for (GroceryModel data in result) {
        groceryEntityList.add(data.toEntity());
      }
      return Right(groceryEntityList);
    } catch (e) {
      return Left(ConnectionFailur(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, GroceryEntity>> getGroceryProduct(
      String productId) async {
    try {
      final result =
          await groceryRemoteDatasource.getOneGroceryProducts(productId);
      final GroceryEntity groceryEntity = result.toEntity();

      return Right(groceryEntity);
    } catch (e) {
      return Left(ConnectionFailur(message: e.toString()));
    }
  }

  @override
  List<Object?> get props => [];

  @override
  Future<Either<Failure, bool>> addCartProduct(String cartId, dynamic products) async{
    try {
      final  result = await service.addOrUpdateCartProduct(cartId,products);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: 'try again'));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteCartProduct(String cartId) async{
    try {
      final bool result = await service.deleteCartProduct(cartId);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: 'try again'));
    }
  }

  @override
  Future<Either<Failure, Map<String,dynamic>>> getCartProduct() async{
    try {

      final Map<String,dynamic> result =  await service.getAllCartProducts();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: 'empty cart'));
    }
    
  }
}
