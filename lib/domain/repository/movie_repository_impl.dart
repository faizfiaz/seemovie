import 'package:movie_test_app/core/utils/pair.dart';
import 'package:movie_test_app/data/datasource/movie_local_datasource.dart';
import 'package:movie_test_app/data/datasource/movie_remote_datasource.dart';
import 'package:movie_test_app/domain/entities/detail_movie.dart';
import 'package:movie_test_app/domain/entities/home_movie_item.dart';
import 'package:movie_test_app/domain/entities/search_movie_item.dart';
import 'package:movie_test_app/domain/repository/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource remoteDataSource;
  final MovieLocalDatasource localDataSource;

  MovieRepositoryImpl({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Pair<int, List<HomeMovieItem>>> getNowPlayingMovies({int page = 1}) async {
    return await remoteDataSource.getNowPlayingMovies(page: page);
  }

  @override
  Future<DetailMovie> getDetailMovie({required int id}) async {
    return await remoteDataSource.getDetailMovie(id: id);
  }

  @override
  Future<Pair<int, List<SearchMovieItem>>> searchMovies({int page = 1, required String query}) async {
    return await remoteDataSource.searchMovie(page: page, query: query);
  }
}
