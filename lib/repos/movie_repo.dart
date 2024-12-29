import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/models/movie_details_model.dart';
import 'package:movie_app/models/now_playing_model.dart';
import 'package:movie_app/models/seried_details_model.dart';
import 'package:movie_app/networking/dio_client.dart';
import 'package:movie_app/utils/helpers/constant.dart';

class MovieRepo {
  final Ref ref;
  MovieRepo(this.ref);
  Future getMovieBasedOnCategories(movieType) async {
    try {
      final response = await ref.read(dioProvider).get(movieType);
      if (response.statusCode == 200) {
        var decodedJson = response.data['results'];
        final List<Result> nowPlayingMovies =
            decodedJson.map<Result>((data) => Result.fromJson(data)).toList();
        return nowPlayingMovies;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future getPopularTVSerirs() async {
    try {
      final response = await ref.read(dioProvider).get(tvPopularSeries);
      if (response.statusCode == 200) {
        var decodedJson = response.data['results'];
        final List<Result> getPopularTvSeries =
            decodedJson.map<Result>((data) => Result.fromJson(data)).toList();
        return getPopularTvSeries;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future getTvSeriesDetails(String data) async {
    try {
      final response = await ref.read(dioProvider).get('tv/$data');
      if (response.statusCode == 200) {
        var decodedJson = response.data;
        final SeriesDetailsModel getSeriesDetails =
            SeriesDetailsModel.fromJson(decodedJson);
        return getSeriesDetails;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future searchMovies(String data) async {
    try {
      final response =
          await ref.read(dioProvider).get('search/movie?query=$data');
      if (response.statusCode == 200) {
        var decodedJson = response.data['results'];
        final List<Result> searchedMovies =
            decodedJson.map<Result>((data) => Result.fromJson(data)).toList();
        return searchedMovies;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future movieDetails(String data) async {
    try {
      final response = await ref.read(dioProvider).get('movie/$data');
      if (response.statusCode == 200) {
        var decodedJson = response.data;
        final MovieDetailsModel movieDetails =
            MovieDetailsModel.fromJson(decodedJson);
        return movieDetails;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      rethrow;
    }
  }
}

final movieRepoProvider = Provider((ref) => MovieRepo(ref));
