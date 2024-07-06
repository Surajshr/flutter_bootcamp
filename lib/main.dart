import 'package:day3/core/model/movie_model.dart';
import 'package:day3/core/service/api_service.dart';
import 'package:day3/feature/movie_list_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MovieExplorerApp(),
  );
}

class MovieExplorerApp extends StatelessWidget {
  const MovieExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Explorer',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MovieExplorerHomePage(),
    );
  }
}

class MovieExplorerHomePage extends StatefulWidget {
  const MovieExplorerHomePage({
    super.key,
  });

  @override
  _MovieExplorerHomePageState createState() => _MovieExplorerHomePageState();
}

class _MovieExplorerHomePageState extends State<MovieExplorerHomePage> {
  List<Movie>? movies = [];

  @override
  void initState() {
    fetchMovies();
    super.initState();
  }

  Future<void> fetchMovies() async {
    print('fetch movie');
    try {
      final List<Movie>? fetchedMovies = await MovieService.fetchMovies();
      print('fetched movie:$fetchedMovies');
      setState(() {
        movies = fetchedMovies;
      });
    } catch (e) {
      print('Error fetching movies: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Movie Explorer'),
        ),
        body:
        // Column(
        //   children: [
        //     ElevatedButton(
        //       onPressed: () {
        //         fetchMovies();
        //       },
        //       child: Text("click"),
        //     ),
        //   ],
        // )
        MovieListView(
          movies: movies ,
        ),
        );
  }
}
