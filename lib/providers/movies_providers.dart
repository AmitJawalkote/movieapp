import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/models/now_playing_model.dart';
import 'package:movie_app/repos/movie_repo.dart';

final nowPlayingMovieFutureProvider =
    FutureProvider.autoDispose<List<Result>>((ref) async {
  return await ref.watch(movieRepoProvider).getNowPlayingMovies();
});
final upComingMovieFutureProvider =
    FutureProvider.autoDispose<List<Result>>((ref) async {
  return await ref.watch(movieRepoProvider).getUpComingMovies();
});
final popularMovieFutureProvider =
    FutureProvider.autoDispose<List<Result>>((ref) async {
  return await ref.watch(movieRepoProvider).getPopularMovies();
});
final popularTVSerirsFutureProvider =
    FutureProvider.autoDispose<List<Result>>((ref) async {
  return await ref.watch(movieRepoProvider).getPopularTVSerirs();
});
