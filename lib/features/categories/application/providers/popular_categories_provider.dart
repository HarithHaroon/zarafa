import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'categories_repository_provider.dart';

import '../../domain/entities/category.dart';

part 'popular_categories_provider.g.dart';

@riverpod
Future<List<Category>> popularCategories(
  PopularCategoriesRef ref,
) async {
  final repository = ref.read(categoriesRepositoryProvider);

  final categories = await repository.fetchPopularCategories();

  return categories;
}
