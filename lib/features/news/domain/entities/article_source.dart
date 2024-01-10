import 'package:equatable/equatable.dart';

class ArticleSource extends Equatable {
  final String? id;
  final String? name;

  const ArticleSource({this.id, this.name});

  factory ArticleSource.fromJson(Map<String, dynamic> map) {
    return ArticleSource(
      id: map['id'] ?? "",
      name: map['name'] ?? "",
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      name
    ];
  }
}