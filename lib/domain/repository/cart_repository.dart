import 'package:project_assessment/domain/entity/grocery_entity.dart';

abstract class CartRepository {
  Future<void> addToCart(GroceryEntity grocery);
  Future<List<GroceryEntity>> getCartItems();
}
