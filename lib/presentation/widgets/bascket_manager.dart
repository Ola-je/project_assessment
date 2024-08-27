import 'package:project_assessment/domain/entity/grocery_entity.dart';

class BasketManager {
  static final BasketManager _instance = BasketManager._internal();
  factory BasketManager() => _instance;
  BasketManager._internal();

  final List<GroceryEntity> _basket = [];

  List<GroceryEntity> get items => List.unmodifiable(_basket);

  void addItem(GroceryEntity item) {
    _basket.add(item);
  }

  void removeItem(GroceryEntity item) {
    _basket.remove(item);
  }
}
