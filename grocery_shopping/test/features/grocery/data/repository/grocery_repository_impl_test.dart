import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grocery_shopping/core/failure/failure.dart';
import 'package:grocery_shopping/features/grocery/data/model/grocery_model.dart';
import 'package:grocery_shopping/features/grocery/data/model/local_storage_model.dart';
import 'package:grocery_shopping/features/grocery/data/repository/grocery_repository_impl.dart';
import 'package:grocery_shopping/features/grocery/domain/entity/grocery_entity.dart';
import 'package:mockito/mockito.dart';

import '../../../../helper/mock_data.mocks.dart';

void main() {
  late MockGroceryRemoteDatasource mockGroceryRemoteDataSource;
  late GroceryRepositoryImpl groceryRepositoryImpl;
  late MockCartService mockCartService;

  setUpAll(() {
    mockGroceryRemoteDataSource = MockGroceryRemoteDatasource();
    mockCartService = MockCartService();
    groceryRepositoryImpl = GroceryRepositoryImpl(
        groceryRemoteDatasource: mockGroceryRemoteDataSource,
        service: mockCartService);

  });
  final List<GroceryModel> groceryEntity = [
    GroceryModel(
        id: '1',
        title: 'title 1',
        rating: 4.3,
        price: 230,
        discount: 0.1,
        description: 'test',
        imageUrl: 'test.png',
        options: [
          {'id': '13', 'name': 'test', 'price': 0.5}
        ]),
    GroceryModel(
        id: '2',
        title: 'title 2',
        rating: 4.3,
        price: 230,
        discount: 0.1,
        description: 'test 2',
        imageUrl: 'test.png',
        options: [
          {'id': '13', 'name': 'test 2', 'price': 0.5}
        ])
  ];

  final Map<String,dynamic> cartList = {
    'testId 1' : {
      'id': '1',
        'title': 'title 1',
        'rating': 4.3,
        'price': 230,
        'discount': 0.1,
        'description': 'test',
        'imageUrl': 'test.png',
        'options': [
          {'id': '13', 'name': 'test', 'price': 0.5}]
    }
  };
  final String productId = '1';
  group('test the grocery repository implimentation', () {
    test(
      'test get all grocery function that returns success state',
      () async {
        when(mockGroceryRemoteDataSource.getGroceryProducts())
            .thenAnswer((_) async => groceryEntity);

        final result = await groceryRepositoryImpl.getGroceryList();

        // Assert that result is a Right containing a List<GroceryEntity>
        expect(result, isA<Right<Failure, List<GroceryEntity>>>());

        // Unwrap the Right and check that it contains the correct list
        result.fold((failure) => fail('Expected success, got failure'),
            (groceryList) {
          expect(groceryList, isA<List<GroceryEntity>>());
           // Compare the actual list with the expected one
        });
      },
    );

    test(
      'test get all grocery function that returns success state',
      () async {
        when(mockGroceryRemoteDataSource.getOneGroceryProducts(any))
            .thenAnswer((_) async => groceryEntity[0]);

        final result = await groceryRepositoryImpl.getGroceryProduct(productId);

        // Assert that result is a Right containing a List<GroceryEntity>
        expect(result, isA<Right<Failure, GroceryEntity>>());

        // Unwrap the Right and check that it contains the correct list
        result.fold((failure) => fail('Expected success, got failure'),
            (groceryList) {
          expect(groceryList, isA<GroceryEntity>());
           // Compare the actual list with the expected one
        });
      },
    );

    test(
      'test get all cart that returns success state',
      () async {
        when(mockCartService.getAllCartProducts())
            .thenAnswer((_) async => cartList);

        final result = await groceryRepositoryImpl.getCartProduct();

        // Assert that result is a Right containing a List<GroceryEntity>
        // expect(result, isA<Map<String,dynamic>>());

        // Unwrap the Right and check that it contains the correct list
        result.fold((failure) => fail('Expected success, got failure'),
            (result) {
          expect(result, isA<Map<String,dynamic>>());
           // Compare the actual list with the expected one
        });
      },
    );

    test(
      'test  add cart that returns success state',
      () async {
        when(mockCartService.addOrUpdateCartProduct(any,any))
            .thenAnswer((_) async => true);

        final result = await groceryRepositoryImpl.addCartProduct('1',cartList);
        result.fold((failure) => fail('Expected success, got failure'),
            (result) {
          expect(result, equals(true));
           // Compare the actual list with the expected one
        });
      },
    );

    test(
      'test  delete cart that returns success state',
      () async {
        when(mockCartService.deleteCartProduct(any))
            .thenAnswer((_) async => true);

        final result = await groceryRepositoryImpl.deleteCartProduct('1');
        result.fold((failure) => fail('Expected success, got failure'),
            (result) {
          expect(result, equals(true));
           // Compare the actual list with the expected one
        });
      },
    );

    
  });
}
