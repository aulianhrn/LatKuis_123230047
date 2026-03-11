import 'package:flutter/material.dart';
import 'package:latihan_kuis_a/models/movie_model.dart';

class DetailPage extends StatefulWidget {
  final MovieModel _movieModel;
  const DetailPage({super.key, required MovieModel movieModel}): _movieModel = movieModel;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Detail Film",
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Image.network(widget._movieModel.imgUrl),
              Text("${widget._movieModel.title} (${widget._movieModel.year})",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold
                ),
              ),
              
              SizedBox(height: 3),
              Text("Directed by: ${widget._movieModel.director}",
                style: TextStyle(
                  color: Colors.grey
                ),
              ),

              SizedBox(height: 10),
              Text(widget._movieModel.synopsis,
                textAlign: TextAlign.justify,
              ),

              SizedBox(height: 10),
              Text("Genre: ${widget._movieModel.genre}",
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              Text("Casts: ${widget._movieModel.casts.join(", ")}",
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),

              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color:  Colors.yellow,),
                  Text("Rated ${widget._movieModel.rating.toString()}/10")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}