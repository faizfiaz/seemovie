import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_test_app/domain/entities/detail_movie.dart';
import 'package:movie_test_app/domain/usecases/favorite_movie.dart';

import '../mocks.mocks.dart';

void main() {
  late MockMovieRepository mockRepository;
  late FavoritMovie usecase;

  setUp(() {
    mockRepository = MockMovieRepository();
    usecase = FavoritMovie(mockRepository);
  });

  test('WHEN call usecase THEN should call toogleMovieFavorite', () async {
    final movie = DetailMovie(id: 1, title: 'Batman');

    when(mockRepository.toogleMovieFavorite(movie: movie)).thenAnswer((_) async => Future.value());

    usecase.call(detailMovie: movie);

    verify(mockRepository.toogleMovieFavorite(movie: movie)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
