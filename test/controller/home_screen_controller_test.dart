import 'package:flutter_test/flutter_test.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_test_app/core/utils/pair.dart';
import 'package:movie_test_app/domain/entities/home_movie_item.dart';
import 'package:movie_test_app/domain/usecases/get_now_playing.dart';
import 'package:movie_test_app/features/home/controller/home_screen_controller.dart';

import '../exception/fake_api_exception.dart';
import '../mocks.mocks.dart';

void main() {
  late GetNowPlaying mockGetNowPlaying;
  late HomeScreenController controller;

  setUp(() {
    mockGetNowPlaying = GetNowPlaying(MockMovieRepository());
    controller = HomeScreenController(mockGetNowPlaying);
  });

  tearDown(() {
    controller.onClose();
  });

  test('GIVEN api call success WHEN controller called THEN should set movie list in paging state', () async {
    final page = 1;
    final totalPages = 3;
    final movieList = [const HomeMovieItem(id: 1, title: 'Movie 1'), const HomeMovieItem(id: 2, title: 'Movie 2')];

    when(mockGetNowPlaying(page: page)).thenAnswer((_) async => Pair(totalPages, movieList));

    controller.onInit();

    expect(controller.pagingController.value, isA<PagingState<int, HomeMovieItem>>());

    Future.delayed(const Duration(milliseconds: 1000), () {
      expect(controller.totalPage, totalPages);
    });
  });

  test('GIVEN api call failed WHEN controller called THEN should not return movie list', () async {
    when(mockGetNowPlaying(page: 1)).thenThrow(FakeApiException.fake);

    controller.onInit();

    expect(controller.pagingController.value, isA<PagingState<int, HomeMovieItem>>());
    expect(controller.pagingController.status, PagingStatus.loadingFirstPage);
  });
}
