import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/models/movie_details_model.dart';
import 'package:movie_app/models/now_playing_model.dart';
import 'package:movie_app/models/seried_details_model.dart';
import 'package:movie_app/repos/movie_repo.dart';
import 'package:movie_app/utils/helpers/constant.dart';

final nowPlayingMovieFutureProvider =
    FutureProvider.autoDispose<List<Result>>((ref) async {
  return await ref
      .watch(movieRepoProvider)
      .getMovieBasedOnCategories(nowPlaying);
});
final upComingMovieFutureProvider =
    FutureProvider.autoDispose<List<Result>>((ref) async {
  return await ref.watch(movieRepoProvider).getMovieBasedOnCategories(upComing);
});
final popularMovieFutureProvider =
    FutureProvider.autoDispose<List<Result>>((ref) async {
  return await ref.watch(movieRepoProvider).getMovieBasedOnCategories(popular);
});
final popularTVSerirsFutureProvider =
    FutureProvider.autoDispose<List<Result>>((ref) async {
  return await ref.watch(movieRepoProvider).getPopularTVSerirs();
});
final tvSeriesDetailsProvide =
    FutureProvider.family<SeriesDetailsModel, String>((ref, query) async {
  return await ref.watch(movieRepoProvider).getTvSeriesDetails(query);
});
final movieSearchProvider =
    FutureProvider.family<List<Result>, String>((ref, query) async {
  return await ref.watch(movieRepoProvider).searchMovies(query);
});
final movieDetailsProvider =
    FutureProvider.family<MovieDetailsModel, String>((ref, query) async {
  return await ref.watch(movieRepoProvider).movieDetails(query);
});
