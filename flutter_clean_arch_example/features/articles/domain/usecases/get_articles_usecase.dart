import '../../../../core/usecases/usecase.dart';
import '../entities/article_entity.dart';
import '../repositories/article_repository.dart';

class GetArticlesUseCase implements UseCase<List<ArticleEntity>, NoParams> {
  final ArticleRepository repo;
  GetArticlesUseCase(this.repo);

  @override
  Future<List<ArticleEntity>> call(NoParams params) => repo.getRemoteArticles();
}
