import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/categories_repository_impl.dart';
import '../../domain/repositories/categories_repository.dart';
import 'remote_categories_data_source_provider.dart';

part 'categories_repository_provider.g.dart';

@riverpod
CategoriesRepository categoriesRepository(
  CategoriesRepositoryRef ref,
) {
  final dataSource = ref.read(remoteCategoriesDataSourceProvider);

  return CategoriesRepositoryImpl(dataSource: dataSource);
}
