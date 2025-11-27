import '../entities/article_entity.dart';

abstract class ArticleRepository {
  Future<List<ArticleEntity>> getRemoteArticles();
  Future<List<ArticleEntity>> getLocalArticles();
  Future<void> saveLocalArticle(ArticleEntity article);
  Future<void> saveLocalArticles(List<ArticleEntity> articles);
  Future<void> clearLocal();
}
