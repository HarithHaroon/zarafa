import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/data_sources/remote_categories_data_source.dart';

part 'remote_categories_data_source_provider.g.dart';

@riverpod
RemoteCategoriesDataSource remoteCategoriesDataSource(
  RemoteCategoriesDataSourceRef ref,
) {
  return RemoteCategoriesDataSource();
}
