import 'package:flutter/material.dart';
import 'package:movie/models/movie_detail.dart'; 
import 'package:movie/servicedan/http_service.dart';

class todolist extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<todolist> {
  int movieCount = 0;
  List? movies;
  late HttpService service;

  Future initialize() async {
    var hasil = await service.getToDo(); 
    
    setState(() {
      movies = hasil;
      movieCount = hasil?.length ?? 0;
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
        itemCount: (movies == null) ? 0 : movieCount,
        itemBuilder: (context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              title: Text(movies![position].id.toString()), 
              subtitle: Text(movies![position].title ?? ""),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetail(movies![position]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}