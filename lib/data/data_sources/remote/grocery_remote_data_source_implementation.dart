import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_assessment/data/data_sources/remote/grocery_remote_data_source.dart';
import 'package:project_assessment/data/model/grocery_model.dart';
import 'package:project_assessment/domain/entity/grocery_entity.dart';
class GroceryRemoteDataSourceImplementation implements GroceryRemoteDataSource {
  final http.Client client;
  final String baseUrl;

  GroceryRemoteDataSourceImplementation({
    required this.client,
    required this.baseUrl,
  });

  @override
  Future<List<GroceryEntity>> getGroceries() async {
    final response = await client.get(Uri.parse('$baseUrl'));

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body) ['data'];

      final List<GroceryEntity> groceries = [];
      for (var i = 0; i < responseBody.length; i++){
        groceries.add(GroceryModel.fromJson(responseBody[i]));
      }
      return groceries;

    } else {
      throw Exception('Failed to load groceries');
    }
  }

  @override
  Future<GroceryEntity> getGroceryById(String id) async {
    final response = await client.get(Uri.parse('$baseUrl/$id'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody =jsonDecode(response.body);

      return GroceryEntity.fromJson(responseBody);
    } else {
      throw Exception('Failed to load grocery');
    }
  }
}
