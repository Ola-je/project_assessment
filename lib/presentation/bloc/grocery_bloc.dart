import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_assessment/domain/entity/grocery_entity.dart';
import 'package:project_assessment/domain/repository/grocery_repository.dart';
import 'package:project_assessment/presentation/bloc/grocery_event.dart';
import 'package:project_assessment/presentation/bloc/grocery_state.dart';


class GroceryBloc extends Bloc<GroceryEvent, GroceryState> {
  final GroceryRepository repository;
  final List<GroceryEntity> _cartItems = [];

  GroceryBloc(this.repository) : super(GroceryInitial()) {
    on<LoadGroceries>(_onLoadGroceries);
    on<LoadGroceryById>(_onLoadGroceryById);
    on<AddToCart>(_onAddToCart);
    on<RemoveFromCart>(_onRemoveFromCart);
    on<LoadCart>(_onLoadCart);
  }

  FutureOr<void> _onLoadGroceries(LoadGroceries event, Emitter<GroceryState> emit) async {
    emit(GroceryLoading());
    try {
      final groceries = await repository.getGroceries();
      emit(GroceryLoaded(groceries));
    } catch (e) {
      emit(GroceryLoadError('Failed to load groceries'));
    }
  }

  FutureOr<void> _onLoadGroceryById(LoadGroceryById event, Emitter<GroceryState> emit) async {
    emit(GroceryLoading());
    try {
      final grocery = await repository.getGroceryById(event.id);
      emit(GroceryDetailLoaded(grocery));
    } catch (e) {
      emit(GroceryLoadError('Failed to load grocery'));
    }
  }

  FutureOr<void> _onAddToCart(AddToCart event, Emitter<GroceryState> emit) {
    _cartItems.add(event.grocery);
    emit(CartUpdated(List.from(_cartItems)));
  }

  FutureOr<void> _onRemoveFromCart(RemoveFromCart event, Emitter<GroceryState> emit) {
    _cartItems.remove(event.grocery);
    emit(CartUpdated(List.from(_cartItems)));
  }

  FutureOr<void> _onLoadCart(LoadCart event, Emitter<GroceryState> emit) {
    emit(CartUpdated(List.from(_cartItems)));
  }
}
