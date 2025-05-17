import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_test_app/domain/entities/detail_movie.dart';
import 'package:movie_test_app/domain/usecases/get_favorite_movie.dart';
import 'package:movie_test_app/features/favorites/controller/favorites_screen_controller.dart';

import '../mocks.mocks.dart';

void main() {
  late GetFavoriteMovie getFavoriteMovie;
  late FavoritesScreenController controller;

  setUp(() {
    getFavoriteMovie = GetFavoriteMovie(MockMovieRepository());
    controller = FavoritesScreenController(getFavoriteMovie);
  });

  test('should fetch favorite movies on init', () {
    final moviesList = [DetailMovie(id: 1, title: 'Movie 1')];
    when(getFavoriteMovie.call()).thenReturn(moviesList);

    controller.onInit();

    expect(controller.movies, moviesList);
    verify(getFavoriteMovie.call()).called(1);
  });

  tearDown(() {
    controller.onClose();
  });
}
