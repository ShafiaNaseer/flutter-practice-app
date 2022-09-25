import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APITest extends StatefulWidget {
  const APITest({super.key});

  @override
  State<APITest> createState() => _APITestState();
}

class _APITestState extends State<APITest> {
  var data;
  bool loading=true;

  initState(){
    super.initState();
    getData();
  }
  getData()async{
    setState(() {
      loading=true;
    });
    var api="https://ipinfo.io/161.185.160.93/geo";

    var response= await http.get(Uri.parse(api),
    headers: {
      'Content-Type': 'Application/json',
    }
    );
    print(response.statusCode);
     print("body:${response.body}");
    if (response==200){
       setState(() {
         data=jsonDecode(response.body); 
       });
      // encode use for post decode use for get
      print("data:$data");

      var city=data['city'];
      var ip=data['ip'].toString();
      var region=data['region'];
      var country=data['country'];
      var location=data['loc'];
      var origion=data['org'];
      // for display type string /calculate type double
      debugPrint('city:$city');


    }else{
      print("Server Error! Please try again latter");


    }
    log("Api okay..");
      setState(() {
      loading=false;
    });
   

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            loading==true?
            Text("loading.."):
            Container(
              // child: Text(data.toString()),
              child:Text("City Name:${data['city']}")
            ),
            // ElevatedButton(onPressed: () {
            //   getData();
              
            // },
            
            //  child: Text("Get Data"))
          ],
        ),
      ),
    );
  }
}