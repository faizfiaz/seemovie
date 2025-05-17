import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_test_app/data/models/base/api_exception.dart';
import 'package:movie_test_app/domain/entities/detail_movie.dart';
import 'package:movie_test_app/domain/usecases/get_detail_movie.dart';

import '../exception/fake_api_exception.dart';
import '../mocks.mocks.dart';

void main() {
  late MockMovieRepository mockRepository;
  late GetDetailMovie usecase;

  setUp(() {
    mockRepository = MockMovieRepository();
    usecase = GetDetailMovie(mockRepository);
  });

  const movieId = 1;
  final movie = DetailMovie(id: movieId, title: 'Batman');

  group('GetDetailMovie', () {
    test('GIVEN api call is failed WHEN call usecase THEN should throw ApiException ', () async {
      when(mockRepository.getDetailMovie(id: movieId)).thenThrow(FakeApiException.fake);

      expect(() => usecase.call(movieId), throwsA(isA<ApiException>()));

      verify(mockRepository.getDetailMovie(id: movieId)).called(1);
      verifyNever(mockRepository.isMovieFavorite(id: movieId));
      verifyNoMoreInteractions(mockRepository);
    });

    test('GIVEN api call is success WHEN call usecase THEN should return movie when getDetailMovie succeeds', () async {
      when(mockRepository.getDetailMovie(id: movieId)).thenAnswer((_) async => movie);
      when(mockRepository.isMovieFavorite(id: movieId)).thenAnswer((_) => false);

      final result = await usecase.call(movieId);

      expect(result.first, movie);
      expect(result.second, false);
      verify(mockRepository.getDetailMovie(id: movieId)).called(1);
      verify(mockRepository.isMovieFavorite(id: movieId)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
