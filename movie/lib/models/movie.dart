// lib/models/movie.dart

class Movie {
  int? id;
  String? title;
  double? voteAverage;
  String? overview;
  String? posterPath;

  Movie(this.id, this.title, this.voteAverage, this.overview, this.posterPath);

  Movie.fromJson(Map<String, dynamic> parsedJson) {
    this.id = parsedJson['id'];
    this.title = parsedJson['title'];
    this.voteAverage = (parsedJson['vote_average'] != null) 
        ? parsedJson['vote_average'] * 1.0 
        : 0.0;
    this.overview = parsedJson['overview'];
    this.posterPath = parsedJson['poster_path'];
  }
}
class Todo {
  int? userId;
  int? id;
  String? title;

  Todo(this.userId,this.id,this.title);

  Todo.fromJson(Map<String, dynamic> parsedJson) {
    this.id=parsedJson['id'];
    this.title=parsedJson['title'];
    this.userId=parsedJson['userId'];
  }
}
