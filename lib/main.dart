import 'package:flutter/material.dart';
import 'package:login_activity/Quiz1.dart';
import 'package:login_activity/university.dart';
import 'Menu.dart';
import 'apiget.dart';
import 'constants.dart';
import 'Login.dart';
import 'drawer.dart';
import 'jokes.dart';
import 'listview_builder.dart';
import 'modelusing.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
     // backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.03,
              ),
              Image.asset('assets/images/R-Letter-PNG-Pic.png', height: 70, width: 70,),
              Image.asset('assets/images/images.jpg', height: 200, width: 200,),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 100,
                  width: 200,
                  // color: Colors.blue,
                  child: Column(
                    children: const [
                      Text("Welcome",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text("Create an Account and assess thousand of cool stuffs",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 10, ),
                      ),
                    ],
                  )
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 220,
                      child: ElevatedButton(onPressed: (){
                      //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
                      }, style: ElevatedButton.styleFrom(primary: Colors.red) ,
                          child: Text(" Get Started") )
                  )
                ],
              ),
              Container(
                  height: 40,
                  width: 230,
                  //  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?",

                      ),
                      TextButton(onPressed:(){
                 //       Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                      },
                          child: Text("Log In", ))
                    ],
                  )
              ),
            ],
          ),
        )
      ),
    );
  }
}
