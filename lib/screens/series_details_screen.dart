import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/models/hive_store_data_model.dart';
import 'package:movie_app/models/seried_details_model.dart';
import 'package:movie_app/providers/movies_providers.dart';
import 'package:movie_app/repos/hive_repo.dart';
import 'package:movie_app/utils/helpers/constant.dart';

class SeresDetailsScreen extends ConsumerWidget {
  final String id;
  const SeresDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HiveRepo hiveRepo = HiveRepo();
    final AsyncValue<SeriesDetailsModel> asyncData =
        ref.watch(tvSeriesDetailsProvide(id));
    return asyncData.when(
      data: (data) => Scaffold(
        backgroundColor: backGroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            data.name.toString(),
            style: const TextStyle(color: Colors.white),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: IconButton(
                  onPressed: () {
                    final model = MovieSeriesHiveModel(
                        id: data.id.toString(),
                        image: data.posterPath,
                        movieSeriesName: data.name);
                    hiveRepo.addMovieAndSeriesToHive(model);
                  },
                  icon: const Icon(Icons.favorite_border_outlined)),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: imageUrl + data.posterPath.toString(),
                width: double.infinity,
                height: 100,
                errorWidget: (context, url, error) => Image.asset(
                  'assets/netflix.jpg',
                  width: double.infinity,
                  height: 100,
                ),
              ),
              Text(
                data.overview.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Gener:${data.genres?.map(
                      (e) => e.name,
                    ).join(',')}",
                style: const TextStyle(color: Colors.white, fontSize: 20),
              )
            ],
          ),
        ),
      ),
      error: (error, stackTrace) => const Text(
        'unable to fetch movie Details',
        style: TextStyle(color: Colors.white),
      ),
      loading: () => const Center(
          child: SizedBox(
              width: 20, height: 20, child: CircularProgressIndicator())),
    );
  }
}
