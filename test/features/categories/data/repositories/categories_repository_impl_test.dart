import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zarafa/features/categories/data/data_sources/remote_categories_data_source.dart';
import 'package:zarafa/features/categories/data/models/category_model.dart';
import 'package:zarafa/features/categories/data/repositories/categories_repository_impl.dart';

class MockRemoteCategoriesDataSource extends Mock
    implements RemoteCategoriesDataSource {}

const List<CategoryModel> mockModels = [
  CategoryModel(
    title: 'Food',
    iconPath: 'assets/icons/food.png',
    merchantsCount: 100,
    popularity: 80,
    subCategories: [],
  ),
  CategoryModel(
    title: 'Electronics',
    iconPath: 'assets/icons/electronics.png',
    merchantsCount: 50,
    popularity: 75,
    subCategories: [],
  ),
];

void main() {
  group('CategoriesRepository', () {
    test(
      'fetchPopularCategories returns a list of Categories',
      () async {
        final mockDataSource = MockRemoteCategoriesDataSource();
        final repository = CategoriesRepositoryImpl(dataSource: mockDataSource);

        when(() => mockDataSource.fetchPopularCategories()).thenAnswer(
          (_) => Future.value(mockModels),
        );

        final categories = await repository.fetchPopularCategories();

        verify(() => mockDataSource.fetchPopularCategories());

        expect(categories.length, 2);
        expect(categories[0].title, 'Food');
        expect(categories[1].title, 'Electronics');

        verifyNoMoreInteractions(mockDataSource);
      },
    );

    test('fetchPopularCategories throws exceptions', () async {
      final mockDataSource = MockRemoteCategoriesDataSource();
      final repository = CategoriesRepositoryImpl(dataSource: mockDataSource);

      when(() => mockDataSource.fetchPopularCategories()).thenThrow(
        Exception('Network error'),
      );

      expect(() => repository.fetchPopularCategories(), throwsException);
    });

    test('fetchAllCategories returns a list of Category entities', () async {
      final mockDataSource = MockRemoteCategoriesDataSource();
      final repository = CategoriesRepositoryImpl(dataSource: mockDataSource);

      when(() => mockDataSource.fetchAllCategories()).thenAnswer(
        (_) => Future.value(mockModels),
      );

      final categories = await repository.fetchAllCategories();

      verify(() => mockDataSource.fetchAllCategories());

      expect(categories.length, mockModels.length);
      expect(categories[0].title, mockModels[0].title);
      expect(categories[1].iconPath, mockModels[1].iconPath);

      verifyNoMoreInteractions(mockDataSource);
    });

    test('fetchAllCategories throws exceptions', () async {
      final mockDataSource = MockRemoteCategoriesDataSource();
      final repository = CategoriesRepositoryImpl(dataSource: mockDataSource);

      when(() => mockDataSource.fetchAllCategories()).thenThrow(
        Exception('Network error'),
      );

      expect(() => repository.fetchAllCategories(), throwsException);
    });
  });
}
