import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/hive_store_data_model.dart';
import 'package:movie_app/repos/hive_repo.dart';
import 'package:movie_app/screens/movies_details_screen.dart';
import 'package:movie_app/screens/series_details_screen.dart';
import 'package:movie_app/utils/helpers/constant.dart';

class FavouriteMovies extends StatefulWidget {
  const FavouriteMovies({super.key});

  @override
  State<FavouriteMovies> createState() => _FavouriteMoviesState();
}

class _FavouriteMoviesState extends State<FavouriteMovies> {
  List<MovieSeriesHiveModel> favMovies = [];
  final HiveRepo hiveRepo = HiveRepo();
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () async {
        favMovies = await hiveRepo.getAllMovieSeriesFromHive();
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Favourite Movies',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: favMovies.isNotEmpty
            ? ListView.builder(
                itemCount: favMovies.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => favMovies[index].isMovie
                              ? MovieDetailsScreen(
                                  id: favMovies[index].id,
                                )
                              : SeresDetailsScreen(
                                  id: favMovies[index].id,
                                ),
                        ));
                      },
                      child: Row(
                        children: [
                          Icon(
                            favMovies[index].isMovie
                                ? Icons.movie
                                : Icons.person,
                            color: Colors.white,
                          ),
                          CachedNetworkImage(
                            height: 100,
                            width: 100,
                            imageUrl:
                                imageUrl + favMovies[index].image.toString(),
                            errorWidget: (context, url, error) => Image.asset(
                              'assets/netflix.jpg',
                              fit: BoxFit.fitWidth,
                              width: 100,
                              height: 100,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            favMovies[index].movieSeriesName.toString(),
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white),
                          )
                        ],
                      )),
                ),
              )
            : const Text(
                'No Records Found!',
                style: TextStyle(color: Colors.white),
              ),
      ),
    );
  }
}
