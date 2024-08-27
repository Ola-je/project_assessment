import 'package:project_assessment/domain/entity/grocery_entity.dart';

abstract class GroceryRemoteDataSource {
  Future<List<GroceryEntity>> getGroceries();
  Future<GroceryEntity> getGroceryById(String id);
}
