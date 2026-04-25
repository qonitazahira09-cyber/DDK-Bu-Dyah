import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:movie/models/movie_detail.dart';
import 'package:movie/models/movie.dart';


class HttpService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com/todos';

  Future<List?> getToDo() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == HttpStatus.ok) {
      final jsonResponse= jsonDecode(response.body);      
      List movies = jsonResponse.map((i) => Movie.fromJson(i)).toList();
      return movies; 
    } else {
      print("Fail");
      List.empty();
      return List.empty();
    }
  }
}