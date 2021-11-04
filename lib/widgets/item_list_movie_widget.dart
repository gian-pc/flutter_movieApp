import 'package:flutter/material.dart';

class ItemListMovieWidget extends StatelessWidget {
  String title;
  String overview;
  String image;
  double popularity;

  ItemListMovieWidget({
    required this.title,
    required this.overview,
    required this.image,
    required this.popularity
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                image: NetworkImage(this.image),
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
                    this.title,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 6.0),
                  Text(
                    this.overview,
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
                        this.popularity.toString(),
                        style: TextStyle(color: Theme.of(context).accentColor),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
