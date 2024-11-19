import 'dart:convert';

import 'model/post_model.dart';
import 'package:http/http.dart' as http;

class ApiServiceGet {
  final String baseUrl = 'https://www.thesportsdb.com';

  Future<List<PostModel>> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/api/v1/json/3/search_all_teams.php?l=English%20Premier%20League'
    ));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List teams = data['teams'];
      return teams.map((json) => PostModel.fromJson(json)).toList();
    }

    else {
      throw Exception('Failed to load teams');
    }
  }
}