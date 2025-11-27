import '../../../../core/usecases/usecase.dart';
import '../entities/article_entity.dart';
import '../repositories/article_repository.dart';

class SaveArticleUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepository repo;
  SaveArticleUseCase(this.repo);

  @override
  Future<void> call(ArticleEntity params) => repo.saveLocalArticle(params);
}
