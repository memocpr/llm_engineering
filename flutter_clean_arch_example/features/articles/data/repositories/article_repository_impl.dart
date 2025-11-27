import '../../domain/entities/article_entity.dart';
import '../../domain/repositories/article_repository.dart';
import '../datasources/local/dao/article_dao.dart';
import '../datasources/remote/api_service.dart';
import '../models/article_model.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final ApiService api;
  final ArticleDao dao;

  ArticleRepositoryImpl({required this.api, required this.dao});

  @override
  Future<List<ArticleEntity>> getRemoteArticles() async {
    final models = await api.fetchArticles();
    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<List<ArticleEntity>> getLocalArticles() async {
    final rows = await dao.getAll();
    return rows.map((r) => ArticleModel.fromJson(r).toEntity()).toList();
  }

  @override
  Future<void> saveLocalArticle(ArticleEntity article) async {
    await dao.insert(ArticleModel.fromEntity(article).toJson());
  }

  @override
  Future<void> saveLocalArticles(List<ArticleEntity> articles) async {
    await dao.insertMany(articles.map((e) => ArticleModel.fromEntity(e).toJson()).toList());
  }

  @override
  Future<void> clearLocal() => dao.clear();
}
