import 'package:equatable/equatable.dart';
import 'package:project_assessment/domain/entity/grocery_entity.dart';

abstract class GroceryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class GroceryInitial extends GroceryState {}

class GroceryLoading extends GroceryState {}

class GroceryLoaded extends GroceryState {
  final List<GroceryEntity> groceries;

  GroceryLoaded(this.groceries);

  @override
  List<Object?> get props => [groceries];
}

class GroceryDetailLoaded extends GroceryState {
  final GroceryEntity grocery;

  GroceryDetailLoaded(this.grocery);

  @override
  List<Object?> get props => [grocery];
}

class CartUpdated extends GroceryState {
  final List<GroceryEntity> cartItems;

  CartUpdated(this.cartItems);

  @override
  List<Object?> get props => [cartItems];
}


class GroceryLoadError extends GroceryState {
  final String message;

  GroceryLoadError(this.message);

  @override
  List<Object?> get props => [message];
}
