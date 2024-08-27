import 'package:get_it/get_it.dart';
import 'package:grocery_shopping/features/grocery/data/datasource/grocery_remote_datasource.dart';
import 'package:grocery_shopping/features/grocery/data/repository/grocery_repository_impl.dart';
import 'package:grocery_shopping/features/grocery/domain/repository/grocery_repository.dart';
import 'package:grocery_shopping/features/grocery/domain/usecase/grocery_usecase.dart';
import 'package:grocery_shopping/features/grocery/presentation/bloc/product_bloc.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;


Future<void> setUpLocator() async {
 
 
  locator.registerLazySingleton<http.Client>(() => http.Client());
  
  locator.registerLazySingleton<GroceryRemoteDatasource>(() => GroceryRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<GroceryRepository>(() => GroceryRepositoryImpl(groceryRemoteDatasource: locator(),));
  
  locator.registerLazySingleton(() => GroceryUsecase(groceryRepository: locator()));
 
  locator.registerFactory(
    () => ProductBloc(groceryUsecase: locator()),
  );

  
  
}

