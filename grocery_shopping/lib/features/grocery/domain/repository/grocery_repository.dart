

import 'package:equatable/equatable.dart';
import 'package:grocery_shopping/core/failure/failure.dart';
import 'package:grocery_shopping/features/grocery/data/model/local_storage_model.dart';
import 'package:grocery_shopping/features/grocery/domain/entity/grocery_entity.dart';
import 'package:dartz/dartz.dart';

abstract class GroceryRepository  extends Equatable {

  Future<Either<Failure, List<GroceryEntity>>> getGroceryList();
  Future<Either<Failure, GroceryEntity>> getGroceryProduct(String productId);

  Future<Either<Failure, Map<String,dynamic>>> getCartProduct();
  Future<Either<Failure, bool>> deleteCartProduct(String cartId);
  Future<Either<Failure,bool>> addCartProduct(String cartId, dynamic products);
  
}