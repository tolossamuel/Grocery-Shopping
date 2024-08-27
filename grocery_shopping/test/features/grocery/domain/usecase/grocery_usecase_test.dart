

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grocery_shopping/core/failure/failure.dart';
import 'package:grocery_shopping/features/grocery/domain/entity/grocery_entity.dart';
import 'package:grocery_shopping/features/grocery/domain/usecase/grocery_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../../../helper/mock_data.mocks.dart';

void main() {

  late MockGroceryRepository mockGroceryRepository;
  late GroceryUsecase groceryUsecase;

  setUp (() {
      mockGroceryRepository = MockGroceryRepository();
      groceryUsecase = GroceryUsecase(groceryRepository: mockGroceryRepository);
  });


  final List<GroceryEntity> groceryEntity = [
    GroceryEntity(
      id: '1', 
      title: 'title 1', 
      rating: 4.3, 
      price: 230, 
      discount: 0.1, 
      description: 'test', 
      options: [
        {
          'id' : '13',
          'name' : 'test',
          'price' : 0.5
        }
      ]),
    GroceryEntity(
      id: '2', 
      title: 'title 2', 
      rating: 4.3, 
      price: 230, 
      discount: 0.1, 
      description: 'test 2', 
      options: [
        {
          'id' : '13',
          'name' : 'test 2',
          'price' : 0.5
        }
      ])
  ];

  
  final String productId = '1';

  group(
    'test the the usecase of the grocery feature', 
    (){

      test('test the getGroceryList method success return', () async {
        when(
          mockGroceryRepository.getGroceryList()
        ).thenAnswer((_) async => Right(groceryEntity)
        );

        final result = await groceryUsecase.getGroceryList();
        expect(result, equals(Right(groceryEntity)));
      });

      test('test the getGroceryList method failure return', () async {
        when(
          mockGroceryRepository.getGroceryList()
        ).thenAnswer((_) async => Left(ServerFailure(message: 'try again'))
        );

        final result = await groceryUsecase.getGroceryList();
        expect(result, equals(Left(ServerFailure(message: 'try again'))));
      });

      test('test the getProduct  method success return', () async {
        when(
          mockGroceryRepository.getGroceryProduct(any)
        ).thenAnswer((_) async => Right(groceryEntity[0])
        );

        
        final result = await groceryUsecase.getGroceryProduct(productId);
        expect(result, equals(Right(groceryEntity[0])));
      });

      test('test the getProduct  method failure return', () async {
        when(
          mockGroceryRepository.getGroceryProduct(any)
        ).thenAnswer((_) async => Left(ServerFailure(message: 'try again'))
        );

        
        final result = await groceryUsecase.getGroceryProduct(productId);
        expect(result, equals(Left(ServerFailure(message: 'try again'))));
      });


    });
}