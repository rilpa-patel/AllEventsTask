import 'dart:convert';
import 'dart:developer';
import 'package:allevents/models/category_models.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CategoryHelper{
  List<CategoryModel> category = [];

  Future<List<CategoryModel>> getCategory() async{ 
    

    final response = await http.get(Uri.parse('https://allevents.s3.amazonaws.com/tests/categories.json'));

    if (response.statusCode != 200) {
      print(response.reasonPhrase);
    }
    var temp = json.decode(response.body);

    temp.forEach((element){
      category.add(CategoryModel(
          element['category'].toString(),
          element['data'].toString(),
        )
      );
    });
    log(category.toString());
    return category;

  }
}