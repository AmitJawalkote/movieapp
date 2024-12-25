import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/utils/helpers/constant.dart';

class ComongSoonWidget extends StatelessWidget {
  final String mainImage;
  final String overview;
  final String logoUrl;
  final DateTime month;
  const ComongSoonWidget({
    super.key,
    required this.mainImage,
    required this.overview,
    required this.logoUrl,
    required this.month,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(DateFormat('MMM').format(month).toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
            Text(
              DateFormat('dd').format(month).toString(),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  letterSpacing: 5,
                  color: Colors.white),
            ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          children: [
            SizedBox(
              width: size.width * 0.7,
              height: 100,
              child: CachedNetworkImage(
                imageUrl: imageUrl + mainImage,
                errorWidget: (context, url, error) => Image.asset(
                  'assets/netflix.jpg',
                  height: 100,
                  width: size.width * 0.7,
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: size.width * 0.5,
                  height: size.height * 0.2,
                  child: CachedNetworkImage(
                    imageUrl: imageUrl + logoUrl,
                    alignment: Alignment.centerLeft,
                    errorWidget: (context, url, error) => Image.asset(
                      'assets/netflix.jpg',
                      width: size.width * 0.5,
                      height: size.height * 0.2,
                    ),
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
