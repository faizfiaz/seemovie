import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_test_app/core/utils/pair.dart';
import 'package:movie_test_app/data/models/base/api_exception.dart';
import 'package:movie_test_app/domain/entities/search_movie_item.dart';
import 'package:movie_test_app/domain/usecases/search_movie.dart';

import '../exception/fake_api_exception.dart';
import '../mocks.mocks.dart';

void main() {
  late MockMovieRepository mockRepository;
  late SearchMovie usecase;

  setUp(() {
    mockRepository = MockMovieRepository();
    usecase = SearchMovie(mockRepository);
  });

  final query = 'a';
  const movieId = 1;
  final searchMovieItems = <SearchMovieItem>[SearchMovieItem(id: movieId, title: 'Batman', posterPath: '/path/to/poster.jpg')];

  group('SearchMovie', () {
    test('GIVEN there is query and api call is failed WHEN call usecase THEN should throw ApiException ', () async {
      when(mockRepository.searchMovies(query: query)).thenThrow(FakeApiException.fake);

      expect(() => usecase.call(query: query), throwsA(isA<ApiException>()));

      verify(mockRepository.searchMovies(query: query)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('GIVEN api call is success WHEN call usecase THEN should return movie when getNowPlaying succeeds', () async {
      when(mockRepository.searchMovies(query: query)).thenAnswer((_) async => Pair(1, searchMovieItems));

      final result = await usecase.call(query: query);

      expect(result.second, searchMovieItems);
      verify(mockRepository.searchMovies(query: query)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
