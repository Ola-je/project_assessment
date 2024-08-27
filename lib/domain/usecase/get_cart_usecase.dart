import 'package:project_assessment/domain/entity/grocery_entity.dart';
import 'package:project_assessment/domain/repository/cart_repository.dart';

class GetCartUsecase {
  final CartRepository cartRepository;

  GetCartUsecase(this.cartRepository);

  Future<List<GroceryEntity>> execute() async {
    return await cartRepository.getCartItems();
  }
}
