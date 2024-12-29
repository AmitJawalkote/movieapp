import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/models/now_playing_model.dart';
import 'package:movie_app/screens/movies_details_screen.dart';
import 'package:movie_app/utils/helpers/constant.dart';

class MovieCategoryAndItsImages extends StatelessWidget {
  final AsyncValue<List<Result>> movies;
  const MovieCategoryAndItsImages({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      height: height * 0.20,
      child: movies.when(
        data: (moviesList) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: moviesList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MovieDetailsScreen(
                      id: moviesList[index].id.toString(),
                    ),
                  )),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl: '$imageUrl${moviesList[index].posterPath}',
                        width: 125,
                        height: 125,
                        errorWidget: (context, url, error) =>
                            Image.asset('assets/netflix.jpg'),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
        error: (error, stackTrace) => Text(
          error.toString(),
          style: const TextStyle(color: Colors.white),
        ),
        loading: () {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.white,
          ));
        },
      ),
    );
  }
}
