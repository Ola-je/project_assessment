import 'package:project_assessment/domain/entity/grocery_entity.dart';
import 'package:project_assessment/domain/repository/grocery_repository.dart';

class GetGroceriesUseCase {
  final GroceryRepository repository;

  GetGroceriesUseCase(this.repository);

  Future<List<GroceryEntity>> execute() async {
    return await repository.getGroceries();
  }
}
