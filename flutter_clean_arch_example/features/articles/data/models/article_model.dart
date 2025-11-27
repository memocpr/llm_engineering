import '../../domain/entities/article_entity.dart';

class ArticleModel {
  final int id;
  final String title;
  final String body;

  ArticleModel({required this.id, required this.title, required this.body});

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
        id: (json['id'] as num).toInt(),
        title: json['title'] as String? ?? '',
        body: json['body'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {'id': id, 'title': title, 'body': body};

  ArticleEntity toEntity() => ArticleEntity(id: id, title: title, body: body);

  factory ArticleModel.fromEntity(ArticleEntity e) =>
      ArticleModel(id: e.id, title: e.title, body: e.body);
}
