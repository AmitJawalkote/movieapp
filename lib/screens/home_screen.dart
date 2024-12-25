import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/models/now_playing_model.dart';
import 'package:movie_app/providers/movies_providers.dart';
import 'package:movie_app/screens/movies_details_screen.dart';
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
              onTap: () {},
              child: const Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
            ),
          )
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
                        onTap: () {},
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
                  return const Center(child: CircularProgressIndicator());
                },
              ),
              // CarouselSlider(
              //   options: CarouselOptions(
              //     //  height: 400.0,
              //     enlargeCenterPage: true,
              //     autoPlay: true,
              //     autoPlayAnimationDuration: Duration(seconds: 2),
              //   ),
              //   items: [
              //     // Container(
              //     //     width: MediaQuery.of(context).size.width,
              //     //     margin: EdgeInsets.symmetric(horizontal: 5.0),
              //     //     decoration: BoxDecoration(color: Colors.amber),
              //     //     child: Text(
              //     //       'text',
              //     //       style: TextStyle(fontSize: 16.0),
              //     //     ))
              //   ],
              //   // items: [1, 2, 3, 4, 5].map((i) {
              //   // return Builder(
              //   //   builder: (BuildContext context) {
              //   //     return Container(
              //   //         width: MediaQuery.of(context).size.width,
              //   //         margin: EdgeInsets.symmetric(horizontal: 5.0),
              //   //         decoration: BoxDecoration(color: Colors.amber),
              //   //         child: Text(
              //   //           'text $i',
              //   //           style: TextStyle(fontSize: 16.0),
              //   //         ));
              //   //   },
              //   // );
              //   // }).toList(),
              // ),

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
