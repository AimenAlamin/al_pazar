import 'package:al_pazar/features/category/domain/category_entity.dart';

class SubcategoryEntity {
  final String subcategoryName;
  final CategoryEntity categoryEntity;

  SubcategoryEntity(
      {required this.subcategoryName, required this.categoryEntity});
}
