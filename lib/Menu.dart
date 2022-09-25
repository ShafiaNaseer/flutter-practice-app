import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color(0xff764abc),
            title: Text('Menu'),
          ),
            drawer: Drawer(
              backgroundColor: Color(0xff910f1a),
              child: ListView(padding: EdgeInsets.zero, children: [
                UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage('https://images.unsplash.com/photo-1528465424850-54d22f092f9d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y292ZXIlMjBwaG90b3xlbnwwfHwwfHw%3D&w=1000&q=80'),
                      fit: BoxFit.cover,
                      ),
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
            ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
          body: Column(
            children: [
              Container(
               // color: Colors.black,
                height: 80,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black45.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: Offset(4, 8),
                                )
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                radius: 15,
                                backgroundImage:
                                AssetImage('assets/images/food.png'),
                              ),
                              Text("Burger")
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 20,
                      ),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          height: double.infinity,
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(15)),
                          child: Text("$index"),
                        );
                      }),
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _currentIndex,
              backgroundColor: colorScheme.surface,
              selectedItemColor: Colors.red.withOpacity(0.9),
              unselectedItemColor: colorScheme.onSurface.withOpacity(.60),
              selectedLabelStyle: textTheme.caption,
              unselectedLabelStyle: textTheme.caption,
              onTap: (value) {
                // Respond to item press.
                setState(() => _currentIndex = value);
              },
              items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
            label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'favorite' ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search' ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings' ),
          ]),
        ));
  }


}
