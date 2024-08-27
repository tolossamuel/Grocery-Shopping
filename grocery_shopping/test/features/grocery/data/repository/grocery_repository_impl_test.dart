import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grocery_shopping/core/failure/failure.dart';
import 'package:grocery_shopping/features/grocery/data/model/grocery_model.dart';
import 'package:grocery_shopping/features/grocery/data/repository/grocery_repository_impl.dart';
import 'package:grocery_shopping/features/grocery/domain/entity/grocery_entity.dart';
import 'package:mockito/mockito.dart';

import '../../../../helper/mock_data.mocks.dart';

void main() {
  late MockGroceryRemoteDatasource mockGroceryRemoteDataSource;
  late GroceryRepositoryImpl groceryRepositoryImpl;

  setUpAll(() {
    mockGroceryRemoteDataSource = MockGroceryRemoteDatasource();
    groceryRepositoryImpl = GroceryRepositoryImpl(
        groceryRemoteDatasource: mockGroceryRemoteDataSource);
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
  });
}
