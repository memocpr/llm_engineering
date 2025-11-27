import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/article_entity.dart';
import '../bloc/article_bloc.dart';
import '../bloc/article_event.dart';
import '../bloc/article_state.dart';

class ArticlesPage extends StatelessWidget {
  const ArticlesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Articles'),
        actions: [
          IconButton(
            onPressed: () => context.read<ArticleBloc>().add(LoadRemoteArticles()),
            icon: const Icon(Icons.cloud_download),
          ),
          IconButton(
            onPressed: () => context.read<ArticleBloc>().add(LoadLocalArticles()),
            icon: const Icon(Icons.storage),
          )
        ],
      ),
      body: BlocBuilder<ArticleBloc, ArticleState>(
        builder: (context, state) {
          if (state is ArticleLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ArticleLoaded) {
            if (state.articles.isEmpty) {
              return const Center(child: Text('No articles'));
            }
            return ListView.builder(
              itemCount: state.articles.length,
              itemBuilder: (_, i) => _ArticleTile(article: state.articles[i]),
            );
          } else if (state is ArticleError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Tap cloud to load remote data'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final article = ArticleEntity(
            id: DateTime.now().millisecondsSinceEpoch,
            title: 'Local draft',
            body: 'Lorem ipsum',
          );
          context.read<ArticleBloc>().add(SaveLocalArticle(article));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _ArticleTile extends StatelessWidget {
  final ArticleEntity article;
  const _ArticleTile({required this.article});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(article.title),
      subtitle: Text(article.body, maxLines: 2, overflow: TextOverflow.ellipsis),
      trailing: Text('#${article.id}'),
    );
  }
}
