import 'dart:convert';

import 'package:day3/core/model/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieService {
  static Future<List<Movie>?> fetchMovies() async {
    print('you trigger API');
    try {
      final response = await http.get(
          Uri.parse(
            'https://api.themoviedb.org/3/movie/popular?language=en-US&page=1',
          ),
          headers: {
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmOWM3MzE5MjQwNjg1YmU2ZjkyYzFkMzU0N2E4MTVmNiIsIm5iZiI6MTcyMDE5NTQ0Mi44NTUxNTcsInN1YiI6IjYzMzY0MDkzYjA3NmU1MDA3YjI1N2ZjZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.je26fXIbM4TGKH4SJzAKL77A4R9DGRGQjgYwq3MRPiQ"
          });
      print('response from API:$response');
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> results = data['results'];
        return results.map((json) => Movie.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch movies');
      }
    } catch (e) {
      print('exception while fetching API:$e');
      return null;
    }
  }
}
