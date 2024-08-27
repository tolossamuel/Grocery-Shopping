



import 'package:equatable/equatable.dart';
abstract class ProductEvent  extends Equatable{
  const ProductEvent ();

  @override
  List<Object ?> get props => [];
}

class LoadAllProductEvent extends ProductEvent {
  const LoadAllProductEvent ();

  @override
  List<Object ?> get props => [];
}

class GetSingleProductEvent extends ProductEvent {
  final String id;
  const GetSingleProductEvent({
    required this.id
  });
  @override
  List<Object ?> get props => [id];
}










