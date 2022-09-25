import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ApiTesting extends StatefulWidget {
  const ApiTesting({Key? key}) : super(key: key);

  @override
  State<ApiTesting> createState() => _ApiTestingState();
}

class _ApiTestingState extends State<ApiTesting> {
  var responsebody;
  List countries = [];
  bool loading = true;
  initState(){
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      loading = true;
    });
    log("Api Calling..... ");
    var api = "https://datausa.io/api/data?drilldowns=Nation&measures=Population";
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
       log('$responsebody');
       countries = responsebody['data'].toList();
       log('country: $countries');
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
            loading == true ? Text("Loading...") :
            Container(
              height: MediaQuery.of(context).size.height*0.8,
              child: ListView.builder(
                  itemCount: countries.length,
                itemBuilder: (context, i){
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(countries[i]['Nation']),
                        Text(countries[i]['Year']),
                        Text(countries[i]['Population'].toString()),
                      ],
                    );
                },
                  ),
            ),

          ],
        ),
      ),
    );
  }
}
