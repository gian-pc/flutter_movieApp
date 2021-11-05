import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_codigo3_movieapp/models/movie_detail_model.dart';
import 'package:flutter_codigo3_movieapp/models/movie_model.dart';
import 'package:flutter_codigo3_movieapp/utils/constantes.dart';
import 'package:http/http.dart' as http;

class DetailMoviePage extends StatefulWidget {


  Movie movie;
  DetailMoviePage({required this.movie});

  @override
  _DetailMoviePageState createState() => _DetailMoviePageState();
}

class _DetailMoviePageState extends State<DetailMoviePage> {

  MovieDetail? movieDetail;


  @override
  initState(){
    super.initState();
    getDataMovie();
  }


  getDataMovie() async{
    String path = "$urlBase/movie/${widget.movie.id}?api_key=$api_key";
    Uri _uri = Uri.parse(path);
    http.Response response = await http.get(_uri);
    if(response.statusCode == 200){
      Map<String,dynamic>myMap=json.decode(response.body);
      movieDetail = MovieDetail.fromJson(myMap);
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
          return<Widget>[
            SliverAppBar(
              expandedHeight: 260,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Mi Pelicula favorita"),
                background: Image.network(("https://static8.depositphotos.com/1160465/822/i/600/depositphotos_8228852-stock-photo-full-color-old-wood-room.jpg")),
              ),
            ),
          ];
        },
        body: SafeArea(
          child: Container(),
        ),
      ),
    );
  }
}
