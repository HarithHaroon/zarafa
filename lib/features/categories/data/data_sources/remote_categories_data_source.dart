import '../models/category_model.dart';
import 'categories_lists.dart';

class RemoteCategoriesDataSource {
  Future<List<CategoryModel>> fetchPopularCategories() async {
    await Future.delayed(const Duration(seconds: 2));

    return popularCategories;
  }

  Future<List<CategoryModel>> fetchAllCategories() async {
    await Future.delayed(const Duration(seconds: 2));

    return allCategories;
  }
}
