import 'sub_category_model.dart';

class CategoryModel {
  final String title;
  final String iconPath;
  final int merchantsCount;
  final int popularity;
  final List<SubCategoryModel> subCategories;

  const CategoryModel({
    required this.title,
    required this.iconPath,
    required this.merchantsCount,
    required this.popularity,
    required this.subCategories,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      title: json['title'] ?? '',
      // TODO: fix if fetching from a remote server
      iconPath: json['icon_path'] ?? '',
      merchantsCount: json['merchants_count'] ?? 0,
      popularity: json['popularity'] ?? 0,
      subCategories: [],
      // subCategories: json['sub_categories'] ??
      //     ''
      //         .map((subCategory) => SubCategoryModel.fromJon(subCategory))
      //         .toList(),
    );
  }
}
