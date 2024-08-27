import 'package:project_assessment/domain/entity/grocery_entity.dart';
import 'package:project_assessment/domain/repository/grocery_repository.dart';

class GetGroceryByIdUseCase {
  final GroceryRepository repository;

  GetGroceryByIdUseCase(this.repository);

  Future<GroceryEntity> execute(String id) async {
    return await repository.getGroceryById(id);
  }
}
