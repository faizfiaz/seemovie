library;

import 'package:mockito/annotations.dart';
import 'package:movie_test_app/domain/repository/movie_repository.dart';
import 'package:movie_test_app/features/favorites/controller/favorites_screen_controller.dart';

@GenerateMocks([MovieRepository, FavoritesScreenController])
void main() {}
