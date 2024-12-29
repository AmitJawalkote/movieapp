import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/models/now_playing_model.dart';
import 'package:movie_app/providers/movies_providers.dart';
import 'package:movie_app/screens/movies_details_screen.dart';
import 'package:movie_app/utils/helpers/constant.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final AsyncValue<List<Result>> asyncData =
        ref.watch(movieSearchProvider(controller.text));
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Search Movies',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Search here',
                  hintStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  contentPadding: const EdgeInsets.only(left: 30, right: 30),
                  filled: true,
                  fillColor: Colors.white,
                  border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none)),
              cursorColor: Colors.black,
              controller: controller,
              onChanged: (value) => ref.invalidate(movieSearchProvider),
            ),
          ),
          asyncData.when(
            data: (data) => SizedBox(
              height: height * 0.75,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            MovieDetailsScreen(id: data[index].id.toString())));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      data[index].title.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
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
          )
        ],
      ),
    );
  }
}
