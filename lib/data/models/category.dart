import 'package:mystery_dinning_adventure/domain/entities/category.dart';

class CategoryModel extends Category {
  const CategoryModel({
    required super.alias,
    required super.title,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      alias: json['alias'] ?? '',
      title: json['title'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'alias': alias,
      'title': title,
    };
  }
}
