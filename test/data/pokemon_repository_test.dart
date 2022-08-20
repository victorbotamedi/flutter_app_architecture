import 'package:clean_architecture/data/data_source/data_source.dart';
import 'package:clean_architecture/data/pokemon_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockDataSource extends Mock implements PokemonDataSource {}

void main() {
  group('PokemonRepository', () {
    PokemonDataSource buildDataSourceMock() {
      final dataSource = _MockDataSource();
      when(() => dataSource.fetch()).thenAnswer((_) async => []);
      return dataSource;
    }

    test('Calls local data source and then remote', () async {
      final localDataSource = buildDataSourceMock();
      final remoteDataSource = buildDataSourceMock();
      final repository =
          PokemonRepositoryImpl(localDataSource, remoteDataSource);

      await repository.fetch().listen((_) {}).asFuture();
      verifyInOrder([
        () => localDataSource.fetch(),
        () => remoteDataSource.fetch(),
      ]);
    });
  });
}
