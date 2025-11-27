import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/get_articles_usecase.dart';
import '../../domain/usecases/get_local_articles_usecase.dart';
import '../../domain/usecases/save_article_usecase.dart';
import 'article_event.dart';
import 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final GetArticlesUseCase getRemote;
  final GetLocalArticlesUseCase getLocal;
  final SaveArticleUseCase saveLocal;

  ArticleBloc({required this.getRemote, required this.getLocal, required this.saveLocal})
      : super(ArticleInitial()) {
    on<LoadRemoteArticles>(_onLoadRemote);
    on<LoadLocalArticles>(_onLoadLocal);
    on<SaveLocalArticle>(_onSaveLocal);
  }

  Future<void> _onLoadRemote(LoadRemoteArticles event, Emitter<ArticleState> emit) async {
    emit(ArticleLoading());
    try {
      final articles = await getRemote(const NoParams());
      emit(ArticleLoaded(articles));
    } catch (e) {
      emit(ArticleError(e.toString()));
    }
  }

  Future<void> _onLoadLocal(LoadLocalArticles event, Emitter<ArticleState> emit) async {
    emit(ArticleLoading());
    try {
      final articles = await getLocal(const NoParams());
      emit(ArticleLoaded(articles));
    } catch (e) {
      emit(ArticleError(e.toString()));
    }
  }

  Future<void> _onSaveLocal(SaveLocalArticle event, Emitter<ArticleState> emit) async {
    try {
      await saveLocal(event.article);
      final articles = await getLocal(const NoParams());
      emit(ArticleLoaded(articles));
    } catch (e) {
      emit(ArticleError(e.toString()));
    }
  }
}
