import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_assessment/data/data_sources/remote/grocery_remote_data_source.dart';
import 'package:project_assessment/domain/entity/grocery_entity.dart';

class GroceryRemoteDataSourceImpl implements GroceryRemoteDataSource {
  final http.Client client;
  final String baseUrl;

  GroceryRemoteDataSourceImpl({
    required this.client,
    required this.baseUrl,
  });

  @override
  Future<List<GroceryEntity>> getGroceries() async {
    final response = await client.get(Uri.parse('$baseUrl/groceries'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => GroceryEntity.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load groceries');
    }
  }

  @override
  Future<GroceryEntity> getGroceryById(String id) async {
    final response = await client.get(Uri.parse('$baseUrl/groceries/$id'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return GroceryEntity.fromJson(data);
    } else {
      throw Exception('Failed to load grocery');
    }
  }
}
