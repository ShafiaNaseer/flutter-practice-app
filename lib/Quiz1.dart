import 'package:flutter/material.dart';

class Assessment1 extends StatefulWidget {
  const Assessment1({Key? key}) : super(key: key);

  @override
  State<Assessment1> createState() => _Assessment1State();
}

class _Assessment1State extends State<Assessment1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: 600,
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on_rounded),
                        Text('Hobiganj City'),
                        Container(
                          margin: EdgeInsets.only(left: 450.0),
                          child: Icon(Icons.drag_handle_outlined),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 230),
                      width: 320,
                      child: RichText(
                          text: TextSpan(
                              text: 'Find the ',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 40),
                              children: [
                            TextSpan(
                                text: 'Best Food ',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: 'Around You',
                                style: TextStyle(
                                  color: Colors.black,
                                )),
                          ])),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 500,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10),
                                labelText: "Search your food",
                                labelStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.4)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.black12, width: 2),
                                ),
                                suffixIcon: Icon(Icons.search),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red),
                          child:
                              Icon(Icons.filter_list_alt, color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text("Find",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20))),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Text("5km"),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Container(
                            height: 30,
                            width: 100,
                            margin: EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/burger_sandwich_PNG4135.png",
                                  height: 20,
                                  width: 40,
                                ),
                                Text("Burger")
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 100,
                            margin: EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/burger_sandwich_PNG4135.png",
                                  height: 20,
                                  width: 40,
                                ),
                                Text("Burger")
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 100,
                            margin: EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/burger_sandwich_PNG4135.png",
                                  height: 20,
                                  width: 40,
                                ),
                                Text("Burger")
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 100,
                            margin: EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/burger_sandwich_PNG4135.png",
                                  height: 20,
                                  width: 40,
                                ),
                                Text("Burger")
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 100,
                            margin: EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/burger_sandwich_PNG4135.png",
                                  height: 20,
                                  width: 40,
                                ),
                                Text("Burger")
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 100,
                            margin: EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/burger_sandwich_PNG4135.png",
                                  height: 20,
                                  width: 40,
                                ),
                                Text("Burger")
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 100,
                            margin: EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/burger_sandwich_PNG4135.png",
                                  height: 20,
                                  width: 40,
                                ),
                                Text("Burger")
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 100,
                            margin: EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/burger_sandwich_PNG4135.png",
                                  height: 20,
                                  width: 40,
                                ),
                                Text("Burger")
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 170,
                          width: 250,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black12),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/burger_sandwich_PNG4135.png",
                                height: 70,
                                width: 90,
                              ),
                              Text("Beef Burger"),
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 50),
                                    child: Text("20min"),
                                  ),
                                  Icon(Icons.star_border),
                                  Text("4.5")
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 170,
                          width: 250,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black12),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/burger_sandwich_PNG4135.png",
                                height: 70,
                                width: 90,
                              ),
                              Text("Beef Burger"),
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 50),
                                    child: Text("20min"),
                                  ),
                                  Icon(Icons.star_border),
                                  Text("4.5")
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 170,
                          width: 250,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black12),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/burger_sandwich_PNG4135.png",
                                height: 70,
                                width: 90,
                              ),
                              Text("Beef Burger"),
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 50),
                                    child: Text("20min"),
                                  ),
                                  Icon(Icons.star_border),
                                  Text("4.5")
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 170,
                          width: 250,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black12),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/burger_sandwich_PNG4135.png",
                                height: 70,
                                width: 90,
                              ),
                              Text("Beef Burger"),
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 50),
                                    child: Text("20min"),
                                  ),
                                  Icon(Icons.star_border),
                                  Text("4.5")
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
