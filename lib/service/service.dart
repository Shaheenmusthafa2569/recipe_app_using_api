import 'dart:convert';

import 'package:recipe_app_using_api/model/model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<RecipeModel>> getRecipe() async {
    final response = await http.get(Uri.parse("https://dummyjson.com/recipes"));

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      List data = decodedData['recipes'];
      return data.map((e) => RecipeModel.fromJson(e)).toList();
    } else {
      throw Exception('failed to load, Try again');
    }
  }
}
