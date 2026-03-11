import 'package:flutter/material.dart';
import 'package:latihan_kuis_a/models/movie_model.dart';
import 'package:latihan_kuis_a/screen/detail_page.dart';

class HomePage extends StatefulWidget {
  final String nama;
  const HomePage({super.key, required this.nama});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              "Selamat Datang, \n${widget.nama}!",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            floating: true,
            snap: true,
            pinned: false,
          ),

          // Movie List
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),

                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: ListTile(
                      contentPadding:
                          EdgeInsets.only(left: 10, right: 20),

                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailPage(movieModel: movieList[index]),
                          ),
                        );
                      },

                      title: Text(movieList[index].title),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Genre ${movieList[index].genre}",
                            style: TextStyle(fontSize: 10),
                          ),
                          SizedBox(height: 5),
                          Text("Rating ${movieList[index].rating}"),
                        ],
                      ),

                      leading: Image.network(
                        movieList[index].imgUrl,
                        width: 60,
                        height: 100,
                        fit: BoxFit.cover,
                      ),

                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            movieList[index].isBookmark =
                                !movieList[index].isBookmark;
                          });
                        },
                        icon: Icon(
                          movieList[index].isBookmark
                              ? Icons.bookmark
                              : Icons.bookmark_border,
                          color: movieList[index].isBookmark
                              ? Colors.blue
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                );
              },
              childCount: movieList.length,
            ),
          ),
        ],
      ),
    );
  }
}