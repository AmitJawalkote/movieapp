import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/models/now_playing_model.dart';
import 'package:movie_app/providers/movies_providers.dart';
import 'package:movie_app/screens/widgets/coming_soon_widget.dart';
import 'package:movie_app/utils/helpers/constant.dart';

class UpcomingScreen extends ConsumerWidget {
  const UpcomingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Result>> upComingMovies =
        ref.watch(upComingMovieFutureProvider);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: backGroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'New and Hot',
            style: appBarTextStyle,
          ),
          actions: [
            const Icon(
              Icons.cast,
              color: Colors.white,
            ),
            const SizedBox(
              width: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                color: Colors.blue,
                height: 25,
                width: 25,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
          bottom: TabBar(
              dividerColor: Colors.black,
              isScrollable: false,
              indicator: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              labelColor: Colors.black,
              labelStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              unselectedLabelColor: Colors.white,
              tabs: const [
                Tab(
                  text: '     Coming Soon     ',
                ),
                Tab(
                  text: '     Trending     ',
                )
              ]),
        ),
        body: TabBarView(children: [
          upComingMovies.when(
            data: (moviesList) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: moviesList.length,
                  itemBuilder: (context, index) {
                    return ComongSoonWidget(
                      mainImage: moviesList[index].posterPath.toString(),
                      logoUrl: moviesList[index].backdropPath.toString(),
                      month: moviesList[index].releaseDate!,
                      overview: moviesList[index].overview.toString(),
                    );
                  },
                ),
              );
            },
            error: (error, stackTrace) => Text(error.toString()),
            loading: () {
              return const Center(child: CircularProgressIndicator());
            },
          ),
          const SizedBox()
        ]),
      ),
    );
  }
}
