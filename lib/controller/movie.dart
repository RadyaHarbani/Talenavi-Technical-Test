import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app_technical_test/model/movie.dart';

class MovieController {
  final String apiUrl =
      "https://mocki.io/v1/2581be9c-d8f0-4cad-8e8a-080a6657e55c";
  Future<MovieResponse> fetchMovies() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return MovieResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
