import '../domain/category_entity.dart';

class CategoryModel {
  final String categoryName;
  String? parentCategoryId;
  CategoryModel({required this.categoryName});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(categoryName: json['categoryName']);
  }
  factory CategoryModel.fromEntity(CategoryEntity entity) {
    return CategoryModel(categoryName: entity.categoryName);
  }
  Map<String, dynamic> toJson() {
    return {
      'categoryName': categoryName,
    };
  }
}
