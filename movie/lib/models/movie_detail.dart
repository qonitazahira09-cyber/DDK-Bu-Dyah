import 'package:flutter/material.dart';
import 'package:movie/models/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPathBase = 'https://image.tmdb.org/t/p/w500';

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    String path = (movie.posterPath != null && movie.posterPath!.isNotEmpty)
        ? imgPathBase + movie.posterPath!
        : 'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';

    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: screenHeight * 0.7, // Tinggi gambar poster
            pinned: true, // AppBar terlihat saat di-scroll
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'movieHero${movie.id}', // Efek animasi Hero
                child: Image.network(
                  path,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Center(
                    child: Icon(Icons.broken_image, size: 100, color: Colors.grey),
                  ),
                ),
              ),
              // Gradient Overlay agar teks judul di AppBar terlihat
              titlePadding: const EdgeInsets.only(left: 16, bottom: 16, right: 72),
              title: Text(
                movie.title ?? "Detail Film",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  shadows: [Shadow(color: Colors.black54, blurRadius: 4)],
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              centerTitle: false,
            ),
            backgroundColor: Colors.blueAccent,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.black26,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.orangeAccent.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.orangeAccent),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.star, color: Colors.orangeAccent, size: 20),
                              const SizedBox(width: 6),
                              Text(
                                '${movie.voteAverage?.toStringAsFixed(1) ?? "0.0"} / 10',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orangeAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        Row(
                          children: [
                            IconButton(icon: const Icon(Icons.favorite_border, color: Colors.redAccent), onPressed: () {}),
                            IconButton(icon: const Icon(Icons.share_outlined, color: Colors.blueAccent), onPressed: () {}),
                          ],
                        ),
                      ],
                    ),
                    
                    const Divider(height: 32), // Garis pemisah

                    if (screenHeight * 0.7 < 300) 
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Text(
                          movie.title ?? "Judul Tidak Ada",
                          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black87),
                          textAlign: TextAlign.start,
                        ),
                      ),

                    const Text(
                      "Overview",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                    const SizedBox(height: 12),

                    Text(
                      movie.overview ?? "Tidak ada deskripsi tersedia untuk film ini.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[800],
                        height: 1.5, 
                        fontStyle: movie.overview == null ? FontStyle.italic : FontStyle.normal,
                      ),
                    ),
                    
                    const SizedBox(height: 40), 
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
      // Tombol Aksi Mengambang (Hiasan)
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Fitur Putar Trailer belum tersedia.')),
          );
        },
        label: const Text("Tonton Trailer"),
        icon: const Icon(Icons.play_arrow),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}