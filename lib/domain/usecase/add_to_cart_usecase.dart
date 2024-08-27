import 'package:project_assessment/domain/entity/grocery_entity.dart';
import 'package:project_assessment/domain/repository/cart_repository.dart';

class AddToCartUsecase {
  final CartRepository cartRepository;

  AddToCartUsecase(this.cartRepository);

  Future<void> execute(GroceryEntity grocery) async {
    await cartRepository.addToCart(grocery);
  }
}
