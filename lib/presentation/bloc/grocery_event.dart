import 'package:equatable/equatable.dart';
import 'package:project_assessment/domain/entity/grocery_entity.dart';

abstract class GroceryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadGroceries extends GroceryEvent {}

class LoadGroceryById extends GroceryEvent {
  final String id;

  LoadGroceryById(this.id);

  @override
  List<Object?> get props => [id];
}

class AddToCart extends GroceryEvent {
  final GroceryEntity grocery;

  AddToCart(this.grocery);

  @override
  List<Object?> get props => [grocery];
}

class RemoveFromCart extends GroceryEvent {
  final GroceryEntity grocery;

  RemoveFromCart(this.grocery);

  @override
  List<Object?> get props => [grocery];
}

class LoadCart extends GroceryEvent {}
