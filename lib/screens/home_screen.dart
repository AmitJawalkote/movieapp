import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/models/now_playing_model.dart';
import 'package:movie_app/providers/movies_providers.dart';
import 'package:movie_app/screens/favourite_movies.dart';
import 'package:movie_app/screens/search_screen.dart';
import 'package:movie_app/screens/series_details_screen.dart';
import 'package:movie_app/screens/widgets/movie_category_movies.dart';
import 'package:movie_app/utils/helpers/constant.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final AsyncValue<List<Result>> nowPlayingMovies =
        ref.watch(nowPlayingMovieFutureProvider);
    final AsyncValue<List<Result>> upComingMovies =
        ref.watch(upComingMovieFutureProvider);
    final AsyncValue<List<Result>> popularMovies =
        ref.watch(upComingMovieFutureProvider);
    final AsyncValue<List<Result>> popularTvSeries =
        ref.watch(popularTVSerirsFutureProvider);

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ));
              },
              child: const Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const FavouriteMovies(),
                ));
              },
              icon: const Icon(
                Icons.favorite_sharp,
                color: Colors.white,
              ))
        ],
        backgroundColor: Colors.transparent,
        title: const Text('Movie App', style: appBarTextStyle),
      ),
      backgroundColor: backGroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              popularTvSeries.when(
                data: (moviesList) {
                  return CarouselSlider.builder(
                    itemCount: moviesList.length,
                    itemBuilder: (context, index, realIndex) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SeresDetailsScreen(
                              id: moviesList[index].id.toString(),
                            ),
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CachedNetworkImage(
                            fit: BoxFit.contain,
                            width: width,
                            height: height,
                            imageUrl:
                                '$imageUrl${moviesList[index].posterPath}',
                            errorWidget: (context, url, error) => Image.asset(
                              'assets/netflix.jpg',
                              fit: BoxFit.fitWidth,
                              width: width,
                              height: height,
                            ),
                          ),
                        ),
                      );
                    },
                    options: CarouselOptions(
                      scrollDirection: Axis.horizontal,
                      //  height: 400,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {},
                    ),
                  );
                },
                error: (error, stackTrace) => Text(error.toString()),
                loading: () {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.white,
                  ));
                },
              ),
              Text(
                'Now Playing',
                style: appBarTextStyle.copyWith(fontSize: 20),
              ),
              MovieCategoryAndItsImages(
                movies: nowPlayingMovies,
              ),
              Text(
                'Upcoming Movies',
                style: appBarTextStyle.copyWith(fontSize: 20),
              ),
              MovieCategoryAndItsImages(
                movies: upComingMovies,
              ),
              Text(
                'Popular Movies',
                style: appBarTextStyle.copyWith(fontSize: 20),
              ),
              MovieCategoryAndItsImages(
                movies: popularMovies,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
