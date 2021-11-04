import 'package:flutter/material.dart';

class MyDrawerWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}
