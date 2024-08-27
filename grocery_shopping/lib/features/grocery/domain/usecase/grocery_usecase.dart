

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grocery_shopping/core/failure/failure.dart';
import 'package:grocery_shopping/features/grocery/domain/entity/grocery_entity.dart';
import 'package:grocery_shopping/features/grocery/domain/repository/grocery_repository.dart';

class GroceryUsecase  extends Equatable{
  final GroceryRepository groceryRepository;

  const GroceryUsecase({
    required this.groceryRepository
  });

  Future<Either<Failure,List<GroceryEntity>>> getGroceryList() async {
 
      final result = await groceryRepository.getGroceryList();

      return result;
    
    
  }

  Future<Either<Failure,GroceryEntity>> getGroceryProduct(String productId) async {
 
      final result = await groceryRepository.getGroceryProduct(productId);

      return result;
    
    
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}