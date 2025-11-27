import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/theme/app_theme.dart';
import 'core/di/injection_container.dart';
import 'features/articles/presentation/bloc/article_bloc.dart';
import 'features/articles/presentation/bloc/article_event.dart';
import 'features/articles/presentation/screens/articles_page.dart';
import 'features/articles/domain/usecases/get_articles_usecase.dart';
import 'features/articles/domain/usecases/get_local_articles_usecase.dart';
import 'features/articles/domain/usecases/save_article_usecase.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<ArticleBloc>(
            create: (_) => ArticleBloc(
              getRemote: sl<GetArticlesUseCase>(),
              getLocal: sl<GetLocalArticlesUseCase>(),
              saveLocal: sl<SaveArticleUseCase>(),
            )..add(LoadLocalArticles()),
          ),
        ],
        child: const ArticlesPage(),
      ),
    );
  }
}
