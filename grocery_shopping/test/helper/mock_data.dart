
import 'package:grocery_shopping/features/grocery/data/datasource/grocery_remote_datasource.dart';
import 'package:grocery_shopping/features/grocery/domain/repository/grocery_repository.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';

@GenerateMocks(

  [
    GroceryRepository,
    GroceryRemoteDataSourceImpl,
    GroceryRemoteDatasource
  ],
  
customMocks :[MockSpec<http.Client>(as : #MockHttpClient)],
)
@GenerateMocks([http.Client])
void main() {}