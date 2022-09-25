import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class Jokers extends StatefulWidget {
  const Jokers({Key? key}) : super(key: key);

  @override
  State<Jokers> createState() => _JokersState();
}

class _JokersState extends State<Jokers> {
  var responsebody;
  var answer;
  bool loading = true;
  bool visible = false;

  initState(){
    super.initState();
    getData();
  }
  getData() async {
    setState(() {
      loading = true;
    });
    log("Api Calling..... ");
    var api = "https://official-joke-api.appspot.com/random_joke";
    var response = await http.get(Uri.parse(api),
      // headers: {
      //   'Content-Type': 'application/json',
      // }
    );
    print(response.statusCode);
    print("Body: ${response.body}");

    if(response.statusCode == 200) {
      setState((){
        responsebody = jsonDecode(response.body);
        log('Response: $responsebody');
      });
      print('Data: $responsebody');

    }else {
      print("Server Error! ");
    }
    log("Api Okey... ");
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            loading == true ? Lottie.asset("assets/json/98195-loader.json", height: 100,width: 100) :
            Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Type:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      Text('${responsebody['type']}'),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Joke of the day:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      Text('${responsebody['setup']}'),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      height: 40,
                      width: 160,
                      child: ElevatedButton(onPressed: (){

                        setState(() {
                          visible = ! visible;
                        });
                      },
                        child: Text("View / Hide"),
                      )
                  ),
                  Visibility(
                    visible: visible,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Answer:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                        Text('${responsebody['punchline']}'),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                height: 40,
                width: 100,
                child: ElevatedButton(onPressed: (){
                  getData();
                  setState(() {
                    visible = false;
                  });
                },
                  child: Text("New Joke"),
                )
            ),
          ],
        ),
      ),
    );
  }
}
