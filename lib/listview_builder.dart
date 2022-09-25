import 'package:flutter/material.dart';

class ListViewB extends StatefulWidget {
  const ListViewB({Key? key}) : super(key: key);

  @override
  State<ListViewB> createState() => _ListViewBState();
}

class _ListViewBState extends State<ListViewB> {
  List team = ["p1", "p2", "p3", "p4", "p5", "p6"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      height: 15,
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

          Container(
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 300,
                color: Color.fromARGB(255, 177, 174, 148),
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: team.length,
                    itemBuilder: ((context, index) {
                      return myTile(team[index]);
                    })),
              ),
              Divider(
                color: Colors.black45,
                thickness: 2,
              ),
              RichText(
                  text: TextSpan(
                      text: 'Hello',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                      children: [
                        TextSpan(text: 'Mr', style: TextStyle(color: Colors.red)),
                      ])),
            ]),
            // floatingActionButton: FloatingActionButton(
            //   child: Icon(Icon.add),
            //   backgroundColor: Colors.red,
            //   foregroundColor: Colors.green,
            //
            // ),
          ),
        ],
      ),


    );
  }

  Widget myTile(val) {
    return ListTile(
      leading: Icon(Icons.arrow_back_ios),
      title: Text(
        '$val',
        style: TextStyle(color: Colors.black),
      ),
      subtitle: Text("team name"),
      trailing: Icon(Icons.ac_unit_rounded),
    );
  }
}
