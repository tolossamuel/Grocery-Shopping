

import 'package:bloc/bloc.dart';


import 'package:grocery_shopping/features/grocery/domain/usecase/grocery_usecase.dart';
import 'package:grocery_shopping/features/grocery/presentation/bloc/product_stae.dart';

import 'product_event.dart';


class ProductBloc  extends Bloc<ProductEvent,ProductState>{
  final GroceryUsecase groceryUsecase;

  ProductBloc ({
    required this.groceryUsecase
  }):super(ProductIntialState()){
    // on<On
    

   

    on<LoadAllProductEvent>(
      (event,emit) async{
        emit(LoadingState());
        final result = await groceryUsecase.getGroceryList();

        result.fold(
          (failure){
            
            emit(const ProductErrorState(messages: 'try again'));
          },
          (data) {
            emit(LoadedAllProductState(products: data));
          }
        );

      }
    );



    


}
}