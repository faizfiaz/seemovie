import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_test_app/domain/entities/detail_movie.dart';
import 'package:movie_test_app/domain/usecases/get_favorite_movie.dart';

import '../mocks.mocks.dart';

void main() {
  late MockMovieRepository mockRepository;
  late GetFavoriteMovie usecase;

  setUp(() {
    mockRepository = MockMovieRepository();
    usecase = GetFavoriteMovie(mockRepository);
  });

  test('WHEN call usecase THEN should return list of favorite movies', () async {
    final movieList = <DetailMovie>[DetailMovie(id: 1, title: 'Batman'), DetailMovie(id: 2, title: 'Superman')];
    when(mockRepository.getFavoriteMovies()).thenAnswer((_) => movieList);

    final result = usecase.call();

    expect(result, movieList);
    verify(mockRepository.getFavoriteMovies()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
