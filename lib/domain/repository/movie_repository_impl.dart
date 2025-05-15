import 'package:movie_test_app/core/utils/pair.dart';
import 'package:movie_test_app/data/datasource/movie_local_datasource.dart';
import 'package:movie_test_app/data/datasource/movie_remote_datasource.dart';
import 'package:movie_test_app/domain/entities/movie_item.dart';
import 'package:movie_test_app/domain/repository/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDataSource remoteDataSource;
  final MovieLocalDatasource localDataSource;

  MovieRepositoryImpl({required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Pair<int, List<MovieItem>>> getNowPlayingMovies({int page = 1}) async {
    return await remoteDataSource.getNowPlayingMovies(page: page);
  }
}
