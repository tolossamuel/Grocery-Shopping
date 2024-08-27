


import 'package:equatable/equatable.dart';
import 'package:grocery_shopping/features/grocery/domain/entity/grocery_entity.dart';


abstract class ProductState extends Equatable{
  const ProductState();

  @override
  List<Object ?> get props => [];
}

class ProductIntialState extends ProductState {}

class LoadedSingleProductState extends ProductState {
  final GroceryEntity product;

  const LoadedSingleProductState ({
    required this.product
  });

  @override
  List<Object ?> get props => [product];
}

class LoadedAllProductState extends ProductState {
  final List<GroceryEntity> products;

  const LoadedAllProductState ({
    required this.products
  });

  @override

  List<Object ?> get props => [products]; 
}





class ProductErrorState extends ProductState {
  final String messages;

  const ProductErrorState ({
    required this.messages
  });

  @override
  List<Object ?> get props => [messages];
}




class LoadingState extends ProductState {}

