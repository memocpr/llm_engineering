import '../../domain/entities/article_entity.dart';

abstract class ArticleEvent {}
class LoadRemoteArticles extends ArticleEvent {}
class LoadLocalArticles extends ArticleEvent {}
class SaveLocalArticle extends ArticleEvent {
  final ArticleEntity article;
  SaveLocalArticle(this.article);
}
