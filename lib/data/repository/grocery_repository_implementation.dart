import 'package:project_assessment/data/data_sources/remote/grocery_remote_data_source.dart';
import 'package:project_assessment/domain/entity/grocery_entity.dart';
import 'package:project_assessment/domain/repository/grocery_repository.dart';

class GroceryRepositoryImpl implements GroceryRepository {
  final GroceryRemoteDataSource remoteDataSource;

  GroceryRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<List<GroceryEntity>> getGroceries() async {
    try {
      return await remoteDataSource.getGroceries();
    } catch (e) {
      throw Exception('Failed to get groceries: $e');
    }
  }

  @override
  Future<GroceryEntity> getGroceryById(String id) async {
    try {
      return await remoteDataSource.getGroceryById(id);
    } catch (e) {
      throw Exception('Failed to get grocery by ID: $e');
    }
  }
}
