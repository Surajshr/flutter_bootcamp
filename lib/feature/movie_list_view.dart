import 'package:cached_network_image/cached_network_image.dart';
import 'package:day3/core/config/app_config.dart';
import 'package:day3/core/model/movie_model.dart';
import 'package:flutter/material.dart';

class MovieListView extends StatelessWidget {
  final List<Movie>? movies;

  const MovieListView({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies?.length ?? 0,
      itemBuilder: (context, index) {
        final movie = movies?[index];
        return ListTile(
          leading: CachedNetworkImage(
            imageUrl: '${ApiConfig.imageBaseUrl}${movie?.posterPath}',
            width: 60,
            height: 90,
            fit: BoxFit.cover,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
            ),
          ),
          title: Text(movie?.title ?? ''),
          subtitle: Text(movie?.overview ?? ''),
          trailing: Text('Rating: ${movie?.voteAverage}'),
        );
      },
    );
  }
}
