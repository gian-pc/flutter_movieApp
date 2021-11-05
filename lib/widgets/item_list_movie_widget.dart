import 'package:flutter/material.dart';
import 'package:flutter_codigo3_movieapp/models/movie_model.dart';
import 'package:flutter_codigo3_movieapp/pages/detail_movie_page.dart';
import 'package:flutter_codigo3_movieapp/utils/constantes.dart';

class ItemListMovieWidget extends StatelessWidget {
  Movie movie;

  ItemListMovieWidget({
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailMoviePage(movie: movie,),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xff222222),
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                  color: Color(0xff222222).withOpacity(0.9),
                  offset: Offset(0, 4),
                  blurRadius: 10.0)
            ]),
        margin: EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(pathImage + movie.posterPath),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(right: 8.0, left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 6.0),
                    Text(
                      movie.overview,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.6), fontSize: 13.0),
                    ),
                    SizedBox(height: 4.0),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 15.0,
                          color: Theme.of(context).accentColor,
                        ),
                        Text(
                          movie.popularity.toString(),
                          style:
                              TextStyle(color: Theme.of(context).accentColor),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
