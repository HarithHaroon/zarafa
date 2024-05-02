import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/category.dart';
import 'package:mocktail/mocktail.dart';

import 'categories_repository_provider.dart';

part 'categories_notifier_provider.g.dart';

class MockCategoriesNotifier extends _$CategoriesNotifier
    with Mock
    implements CategoriesNotifier {}

@riverpod
class CategoriesNotifier extends _$CategoriesNotifier {
  @override
  Future<List<Category>> build() async {
    final repository = ref.read(categoriesRepositoryProvider);

    final categories = await repository.fetchAllCategories();

    return categories;
  }

  Future<void> searchCategories(String searchTerm) async {
    List<Category> results = [];

    if (state.hasValue) {
      if (searchTerm.isEmpty) {
        ref.invalidateSelf();
      } else {
        final categories = state.requireValue;

        for (final category in categories) {
          final title = category.title.toLowerCase();

          if (title.startsWith(searchTerm)) {
            results.add(category);
          }
        }
        state = AsyncData(results);
      }
    }
  }
}
