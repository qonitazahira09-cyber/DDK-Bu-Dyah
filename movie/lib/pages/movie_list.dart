import 'package:flutter/material.dart';
import 'package:movie/servicedan/http_service.dart';
import 'package:movie/models/movie_detail.dart';
class MovieList extends StatefulWidget{
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  
  int moviesCount = 0;
  late List movies;
  late HttpService service;

  Future initialize() async {
    List? fetchedMovies = await service.getToDo();
    
    setState(() {
      movies = fetchedMovies ?? [];
      moviesCount = movies.length;
    });
  }
  
  @override
  void initState() {
    super.initState();
    service = HttpService();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Movies"),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: moviesCount,
        itemBuilder: (context, int position) {
          String imgPath = 'https://image.tmdb.org/t/p/w500/' + (movies[position].posterPath ?? "");
          return Card(
            color : Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: Container(
              width: 50,
              child: Image.network(
                imgPath,
                fit: BoxFit.cover,
                // Tambahkan loading builder agar aplikasi tidak jelek saat loading gambar
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.broken_image); // Muncul ikon ini jika gambar gagal dimuat
                },
              ),
            ),
              title: Text(movies[position].title),
              subtitle: Text(
                'Rating = ' + movies[position].voteAverage.toString(),
              ),
              onTap: () {
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (_) => MovieDetail (movies[position])
                );
                Navigator.push(context, route);
              },
              )
          );
        }
        ),
      );
  }
}