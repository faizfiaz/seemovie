import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_test_app/core/utils/pair.dart';
import 'package:movie_test_app/data/models/base/api_exception.dart';
import 'package:movie_test_app/domain/entities/home_movie_item.dart';
import 'package:movie_test_app/domain/usecases/get_now_playing.dart';

import '../exception/fake_api_exception.dart';
import '../mocks.mocks.dart';

void main() {
  late MockMovieRepository mockRepository;
  late GetNowPlaying usecase;

  setUp(() {
    mockRepository = MockMovieRepository();
    usecase = GetNowPlaying(mockRepository);
  });

  const movieId = 1;
  final movieListHome = <HomeMovieItem>[HomeMovieItem(id: movieId, title: 'Batman', posterPath: '/path/to/poster.jpg')];

  group('GetNowPlaying', () {
    test('GIVEN api call is failed WHEN call usecase THEN should throw ApiException ', () async {
      when(mockRepository.getNowPlayingMovies()).thenThrow(FakeApiException.fake);

      expect(() => usecase.call(), throwsA(isA<ApiException>()));

      verify(mockRepository.getNowPlayingMovies()).called(1);
      verifyNoMoreInteractions(mockRepository);
    });

    test('GIVEN api call is success WHEN call usecase THEN should return movie when getNowPlaying succeeds', () async {
      final page = 1;
      when(mockRepository.getNowPlayingMovies(page: page)).thenAnswer((_) async => Pair(1, movieListHome));

      final result = await usecase.call(page: 1);

      expect(result.second, movieListHome);
      verify(mockRepository.getNowPlayingMovies(page: page)).called(1);
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
