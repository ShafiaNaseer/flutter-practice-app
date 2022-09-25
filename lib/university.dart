import 'dart:convert';
import 'dart:developer';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class universtyapi extends StatefulWidget {
  const universtyapi({Key? key}) : super(key: key);

  @override
  State<universtyapi> createState() => _universtyapiState();
}

class _universtyapiState extends State<universtyapi> {
  var responsebody;
  var formKey = GlobalKey<FormState>();
  TextEditingController SearchController = TextEditingController();
  List countries = [];
  bool loading = false;
  initState() {
    super.initState();
    // getData();
  }

  getData(country) async {
    setState(() {
      loading = true;
    });
    log("Api Calling..... ");
    var api = "http://universities.hipolabs.com/search?country=$country";
    var response = await http.get(
      Uri.parse(api),
      // headers: {
      //   'Content-Type': 'application/json',
      // }
    );
    print(response.statusCode);
    print("Body: ${response.body}");

    if (response.statusCode == 200) {
      setState(() {
        responsebody = jsonDecode(response.body);
        log('$responsebody');
        countries = responsebody.toList();
        log('country: $countries');
      });
      print('Data: $responsebody');
    } else {
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
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  // height: 80,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    'Enter country name whom university you want to search',
                    style: TextStyle(fontWeight: FontWeight.w500,
                    fontSize: 20,
                    ),
                  )),
              Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: SearchController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Country Name";
                      }
                    },
                    decoration: InputDecoration(
                        hintText: 'Search',
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                getData(SearchController.text);
                              } else {
                                loading = false;
                              }
                            },
                            icon: Icon(Icons.search)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.red, width: 2)),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
              ),
              loading == true
                  ? Lottie.asset("assets/json/98195-loader.json",
                      height: 100, width: 100)
                  : Container(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: ListView.builder(
                        itemCount: countries.length,
                        itemBuilder: (context, i) {
                          return Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            shadowColor: Colors.grey,
                            child: ListTile(
                              tileColor: Colors.blue.withOpacity(0.1),
                              leading: Text(countries[i]['alpha_two_code']),
                              title: Text(countries[i]['name'],
                                  textAlign: TextAlign.start,
                                  style: TextStyle(color: Colors.black)),
                              trailing: Container(
                                  height: 50,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.amber.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Center(
                                      child: Text(
                                    countries[i]['state-province'] ?? "",
                                    textAlign: TextAlign.center,
                                  ))),
                              //margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                              //  child: Column(
                              //    crossAxisAlignment: CrossAxisAlignment.end,
                              //    mainAxisAlignment: MainAxisAlignment.end,
                              //    children: [
                              //      Row(
                              //        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              //        children: [
                              //          Text(countries[i]['alpha_two_code']),
                              //          Container(
                              //              height: 60,
                              //              width: 150,
                              //              child: Text(countries[i]['name'],
                              //                  textAlign: TextAlign.start, style: TextStyle(color: Colors.black)), ),
                              //        ],
                              //      ),
                              //      Container(
                              //          height: 50,
                              //          width: 90,
                              //          decoration: BoxDecoration(color: Colors.amber.withOpacity(0.4), borderRadius: BorderRadius.circular(30)),
                              //          child: Center(child: Text(countries[i]['state-province']?? "", textAlign: TextAlign.center,))),
                              //    ],
                              //  ),
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
