import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import '../../features/articles/data/datasources/local/app_database.dart';
import '../../features/articles/data/datasources/local/dao/article_dao.dart';
import '../../features/articles/data/datasources/remote/api_service.dart';
import '../../features/articles/data/repositories/article_repository_impl.dart';
import '../../features/articles/domain/repositories/article_repository.dart';
import '../../features/articles/domain/usecases/get_articles_usecase.dart';
import '../../features/articles/domain/usecases/get_local_articles_usecase.dart';
import '../../features/articles/domain/usecases/save_article_usecase.dart';

final sl = GetIt.instance;

Future<void> initDI() async {
  sl.registerLazySingleton<http.Client>(() => http.Client());

  sl.registerLazySingleton<AppDatabase>(() => AppDatabase());
  sl.registerLazySingleton<ArticleDao>(() => ArticleDao(sl()));

  sl.registerLazySingleton<ApiService>(() => ApiService(sl()));

  sl.registerLazySingleton<ArticleRepository>(() => ArticleRepositoryImpl(api: sl(), dao: sl()));

  sl.registerFactory(() => GetArticlesUseCase(sl()));
  sl.registerFactory(() => GetLocalArticlesUseCase(sl()));
  sl.registerFactory(() => SaveArticleUseCase(sl()));
}
