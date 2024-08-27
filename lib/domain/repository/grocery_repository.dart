import 'package:project_assessment/domain/entity/grocery_entity.dart';

abstract class GroceryRepository{
   Future<List<GroceryEntity>> getGroceries();
  Future<GroceryEntity> getGroceryById(String id);
}