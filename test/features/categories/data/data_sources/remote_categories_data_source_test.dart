import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:zarafa/features/categories/data/data_sources/remote_categories_data_source.dart';
import 'package:zarafa/features/categories/data/models/category_model.dart';

class MockRemoteCategoriesDataSource extends Mock
    implements RemoteCategoriesDataSource {}

void main() {
  group(
    'RemoteCategoriesDataSource',
    () {
      late MockRemoteCategoriesDataSource mockDataSource;
      late List<CategoryModel> popularCategories;
      late List<CategoryModel> allCategories;

      setUp(() {
        mockDataSource = MockRemoteCategoriesDataSource();
        popularCategories = const [
          CategoryModel(
            title: 'Food',
            iconPath: 'assets/icons/food.png',
            merchantsCount: 100,
            popularity: 80,
            subCategories: [],
          ),
        ];
        allCategories = [];
      });

      test('fetchPopularCategories returns expected data', () async {
        when(() => mockDataSource.fetchPopularCategories()).thenAnswer(
          (_) => Future.value(popularCategories),
        );

        final categories = await mockDataSource.fetchPopularCategories();

        expect(categories, popularCategories);
      });

      test('fetchAllCategories returns expected data', () async {
        when(() => mockDataSource.fetchAllCategories()).thenAnswer(
          (_) => Future.value(allCategories),
        );

        final categories = await mockDataSource.fetchAllCategories();

        expect(categories, allCategories);
      });

      test(
        'fetchPopularCategories throws exceptions',
        () async {
          when(() => mockDataSource.fetchPopularCategories()).thenThrow(
            Exception('Error'),
          );

          expect(
            () => mockDataSource.fetchPopularCategories(),
            throwsException,
          );
        },
      );

      test(
        'fetchAllCategories throws exceptions',
        () async {
          when(() => mockDataSource.fetchAllCategories()).thenThrow(
            Exception('Error'),
          );

          expect(
            () => mockDataSource.fetchAllCategories(),
            throwsException,
          );
        },
      );
    },
  );
}
