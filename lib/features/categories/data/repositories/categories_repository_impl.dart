import 'package:zarafa/features/categories/domain/entities/category.dart';

import '../../domain/repositories/categories_repository.dart';
import '../data_sources/remote_categories_data_source.dart';

class CategoriesRepositoryImpl implements CategoriesRepository {
  CategoriesRepositoryImpl({
    required this.dataSource,
  });

  final RemoteCategoriesDataSource dataSource;

  @override
  Future<List<Category>> fetchPopularCategories() async {
    final models = await dataSource.fetchPopularCategories();

    List<Category> categories = [];

    for (final model in models) {
      categories.add(
        Category(
          title: model.title,
          iconPath: model.iconPath,
          merchantsCount: model.merchantsCount,
          subCategories: const [],
          popularity: model.popularity,
        ),
      );
    }

    return categories;
  }

  @override
  Future<List<Category>> fetchAllCategories() async {
    final models = await dataSource.fetchAllCategories();

    List<Category> categories = [];

    for (final model in models) {
      categories.add(
        Category(
          title: model.title,
          iconPath: model.iconPath,
          merchantsCount: model.merchantsCount,
          subCategories: const [],
          popularity: model.popularity,
        ),
      );
    }

    return categories;
  }
}
