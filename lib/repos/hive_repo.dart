import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:movie_app/models/hive_store_data_model.dart';

class HiveRepo {
  final boxName = 'movieDetails';
  void registerAdapter() {
    Hive.registerAdapter(MovieSeriesHiveModelAdapter());
  }

  Future addMovieAndSeriesToHive(MovieSeriesHiveModel movieDetails) async {
    final movieDetailsBox = await Hive.openBox<MovieSeriesHiveModel>(boxName);
    await movieDetailsBox.put(movieDetails.id, movieDetails);
    log('movieDetails added ${movieDetails.movieSeriesName}');
  }

  Future<List<MovieSeriesHiveModel>> getAllMovieSeriesFromHive() async {
    final movieDetailsBox = await Hive.openBox<MovieSeriesHiveModel>(boxName);
    if (movieDetailsBox.isOpen) {
      return movieDetailsBox.values.toList();
    } else {
      return [];
    }
  }
}
