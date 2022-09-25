import 'package:flutter/material.dart';

class Drawerr extends StatefulWidget {
  const Drawerr({Key? key}) : super(key: key);

  @override
  State<Drawerr> createState() => _DrawerrState();
}

class _DrawerrState extends State<Drawerr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
        drawer: Drawer(
      backgroundColor: Color(0xff910f1a),
      child: ListView(padding: EdgeInsets.zero, children: [
         UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1528465424850-54d22f092f9d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y292ZXIlMjBwaG90b3xlbnwwfHwwfHw%3D&w=1000&q=80')),
            color: Color(0xff27232f),
          ),
          accountName: Text(
            "Shafia Naseer",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          accountEmail: Text(
            "shafianaseer@gmail.com",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 180,
            child: CircleAvatar(
               radius:34,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.asset('assets/images/girl.jpg',fit: BoxFit.cover,
                  height: 90, width: 90,
                ),
              ),
            ),
          )
        ),
        ListTile(
          leading: Icon(
            Icons.favorite, color: Colors.white,
          ),
          title: const Text('Favorites', style: TextStyle(color: Colors.white), ),

        ),
        ListTile(
          leading: Icon(
            Icons.person, color: Colors.white
          ),
          title: const Text('Friends', style: TextStyle(color: Colors.white),),
        ),
        ListTile(
          leading: Icon(
              Icons.share, color: Colors.white
          ),
          title: const Text('Share', style: TextStyle(color: Colors.white),),
        ),
        ListTile(
          leading: Icon(
              Icons.notifications, color: Colors.white
          ),
          title: const Text('Request', style: TextStyle(color: Colors.white),),
        ),
        ListTile(
          leading: Icon(
              Icons.settings, color: Colors.white
          ),
          title: const Text('Settings', style: TextStyle(color: Colors.white),),
        ),
        ListTile(
          leading: Icon(
              Icons.library_books_sharp, color: Colors.white
          ),
          title: const Text('Policies', style: TextStyle(color: Colors.white),),
        ),
        ListTile(
          leading: Icon(
              Icons.exit_to_app, color: Colors.white
          ),
          title: const Text('Exit', style: TextStyle(color: Colors.white),),
        ),
        Divider(color: Colors.white),
        Padding(

          padding: const EdgeInsets.only(left: 18.0),
          child: Text("Labels", style: TextStyle(color: Colors.white),),
        ),
        ListTile(
          leading: Icon(
              Icons.label, color: Colors.white
          ),
          title: const Text('Family', style: TextStyle(color: Colors.white),),
        ),
    ListTile(
    leading: Icon(
    Icons.label, color: Colors.white
    ),
    title: const Text('Work', style: TextStyle(color: Colors.white),),),
    Divider(color: Colors.white),
        ListTile(
          leading: Icon(
              Icons.settings, color: Colors.white
          ),
          title: const Text('Settings & account', style: TextStyle(color: Colors.white),),
        ),
      ]),
    )
    );
  }
}
