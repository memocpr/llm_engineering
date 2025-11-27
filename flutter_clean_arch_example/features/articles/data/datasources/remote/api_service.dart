import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../../../core/constants/endpoints.dart';
import '../../models/article_model.dart';

class ApiService {
  final http.Client client;
  ApiService(this.client);

  Future<List<ArticleModel>> fetchArticles() async {
    final uri = Uri.parse(Endpoints.baseUrl + Endpoints.articles);
    final res = await client.get(uri);
    if (res.statusCode == 200) {
      final List data = json.decode(res.body) as List;
      return data.map((e) => ArticleModel.fromJson(e as Map<String, dynamic>)).toList();
    } else {
      throw Exception('Failed to fetch articles: ${res.statusCode}');
    }
  }
}
