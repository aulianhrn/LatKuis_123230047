import 'package:flutter/material.dart';
import 'package:latihan_kuis_a/models/movie_model.dart';
import 'package:latihan_kuis_a/screen/detail_page.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  @override
  Widget build(BuildContext context) {
    // ini buat model list  
    List<MovieModel> bookmarkList = movieList.where((movie) => movie.isBookmark).toList();
    return Scaffold(
      body: CustomScrollView(
        slivers: [ //ini biar pas scroll appbarnya ikut ilang
          SliverAppBar(
            title: Text("Bookmark",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            floating: true,
            snap: true,
            pinned: false,
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                          DetailPage(movieModel: bookmarkList[index]),
                      ),
                    );
                  },

                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),

                    child: Card(
                      color: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                    
                      child: ListTile(
                        contentPadding: EdgeInsets.only(left: 10, right: 40),
                      
                        
                        title: Text(bookmarkList[index].title),

                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Genre ${bookmarkList[index].genre}",
                              style: TextStyle(fontSize: 10),
                            ),
                            SizedBox(height: 5),
                            Text("Rating ${bookmarkList[index].rating}"),
                          ],
                        ),

                        leading: Image.network(
                          bookmarkList[index].imgUrl,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),

                        trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              bookmarkList[index].isBookmark = false;
                            });
                          }, 
                          icon: Icon(
                            bookmarkList[index].isBookmark ? Icons.bookmark : Icons.bookmark_border,
                            color: bookmarkList[index].isBookmark ? Colors.blue : Colors.grey
                          ),
                        )
                      ),
                    ),
                  ),
                );
              },
              childCount: bookmarkList.length
            ),
          ),
        ],
      )
    );
  }
}