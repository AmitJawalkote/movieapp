import 'package:hive/hive.dart';
part 'hive_store_data_model.g.dart';

@HiveType(typeId: 01)
class MovieSeriesHiveModel {
  @HiveField(0)
  final bool isMovie;
  @HiveField(1)
  final String? movieSeriesName;
  @HiveField(2)
  final String? image;
  @HiveField(3)
  final String id;

  MovieSeriesHiveModel(
      {this.isMovie = true,
      required this.movieSeriesName,
      required this.image,
      required this.id});
}
