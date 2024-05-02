import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import 'package:zarafa/features/categories/application/providers/categories_notifier_provider.dart';
import 'package:zarafa/features/categories/application/providers/categories_repository_provider.dart';
import 'package:zarafa/features/categories/domain/entities/category.dart';
import 'package:zarafa/features/categories/domain/repositories/categories_repository.dart';

class MockCategoriesRepository extends Mock implements CategoriesRepository {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}

const String title = 'Food';
const String iconPath = 'assets/images/food.png';
const int merchantsCount = 100;
const int popularity = 5;
final List subCategories = [];

final category = Category(
  title: title,
  iconPath: iconPath,
  merchantsCount: merchantsCount,
  subCategories: subCategories,
  popularity: popularity,
);

final categories = [category];

void main() {
  late MockCategoriesRepository mockCategoriesRepository;
  setUp(() {
    mockCategoriesRepository = MockCategoriesRepository();
  });

  test(
    'build fetches categories and updates state successfully',
    () async {
      when(() => mockCategoriesRepository.fetchAllCategories()).thenAnswer(
        (_) => Future.value(categories),
      );

      final container = ProviderContainer(
        overrides: [
          categoriesRepositoryProvider.overrideWithValue(
            mockCategoriesRepository,
          )
        ],
      );

      final listener = Listener<AsyncValue<List<Category>>>();

      container.listen(
        categoriesNotifierProvider,
        listener.call,
        fireImmediately: true,
      );

      addTearDown(() => container.dispose());

      verify(
        () => listener(null, const AsyncLoading()),
      );

      await Future.delayed(const Duration(seconds: 3));

      verify(
        () => listener(
          const AsyncLoading(),
          AsyncData<List<Category>>(categories),
        ),
      );
    },
  );

  test('searchCategory', () async {
    final container = ProviderContainer(
      overrides: [
        categoriesNotifierProvider.overrideWith(
          () => MockCategoriesNotifier(),
        )
      ],
    );

    final notifier = container.read(categoriesNotifierProvider.notifier);

    notifier.searchCategories('food');

    await expectLater(notifier.state, AsyncData(categories));
  });
}
