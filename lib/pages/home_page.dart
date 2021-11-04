import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List movies = [];
  String pathImage = "https://image.tmdb.org/t/p/w500";

  @override
  initState() {
    super.initState();
    getDataMovie();
  }

  getDataMovie() async {
    String api_key = "a33df3829aed276156137e2122f094df";
    String _path =
        "https://api.themoviedb.org/3/discover/movie?api_key=$api_key";
    Uri _uri = Uri.parse(_path);
    http.Response response = await http.get(_uri);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      movies = data["results"];
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Movies",
          style: TextStyle(
            fontSize: 22.0,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://static8.depositphotos.com/1160465/822/i/600/depositphotos_8228852-stock-photo-full-color-old-wood-room.jpg"),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://scontent.flim17-1.fna.fbcdn.net/v/t1.6435-9/31901792_10155604559952404_6647269739548639232_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeFkeP-CpRu_qeFblnGYUTeWblELhUOs-QluUQuFQ6z5CQeFgI_z74DcX6j11Gy1rok&_nc_ohc=rYa_E--zj7EAX84c02A&_nc_ht=scontent.flim17-1.fna&oh=005bb7d2e9127a9d7cfdd3c2761f7a20&oe=61A78EF9"),
                  ),
                  Text(
                    "Gian Carlos",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "Editor",
                    style: TextStyle(fontSize: 13.0, color: Colors.white70),
                  )
                ],
              ),
            ),
            ListTile(
              title: Text("Peliculas"),
              trailing: Icon(Icons.movie),
              onTap: () {},
            ),
            ListTile(
              title: Text("Televisión"),
              trailing: Icon(Icons.tv),
              onTap: () {},
            ),
            Divider(
              thickness: 0.9,
            ),
            ListTile(
              title: Text("Cerrar Sesión"),
              trailing: Icon(Icons.exit_to_app),
              onTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favoritos"),
          BottomNavigationBarItem(
              icon: Icon(Icons.thumb_up), label: "Me gusta"),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.all_inclusive),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Top Movies",
                style: TextStyle(
                    fontSize: 40,
                    color: Theme.of(context).accentColor,
                    fontWeight: FontWeight.w500),
              ),
              ListView.builder(
                primary: true,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: movies.length,
                itemBuilder: (BuildContext context, int index) {
                  String urlImage = pathImage + movies[index]["poster_path"];
                  print(urlImage);

                  return Container(
                    decoration: BoxDecoration(
                        color: Color(0xff222222),
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff222222).withOpacity(0.9),
                            offset: Offset(0,4),
                            blurRadius: 10.0
                          )
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
                              image: NetworkImage(urlImage),
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
                                  movies[index]["original_title"],
                                  style: TextStyle(fontSize: 18.0),
                                ),
                                SizedBox(height: 6.0),
                                Text(
                                  movies[index]["overview"],
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.6),
                                      fontSize: 13.0),
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
                                      movies[index]["popularity"].toString(),
                                      style: TextStyle(
                                          color: Theme.of(context).accentColor),
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
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
