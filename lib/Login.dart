import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:login_activity/Menu.dart';
import 'package:http/http.dart' as http;
import 'SignUp.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool loading = false;
  var formKey = GlobalKey<FormState>();
  bool isVisible = true;
  
  login(email, password) async{
    setState(() {
      loading = true;
    });
    try {
      final response = await http.post(Uri.parse("https://khadimsoftware.com/api/login"),
          headers: {
            'Content-Type': 'application/json',
          },
          body:
          jsonEncode({
            'email': '$email',
            'password' : '$password',
          })
      );

      print(response.statusCode);

      if(response.statusCode == 200) {
        var body = jsonDecode(response.body);
        print(response.body);
        var bodyResponse = body[ 'login_status'];
        if(bodyResponse==200) {
          log("Login Success!");
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => Menu()));
        }
        else{
          Fluttertoast.showToast(msg: "Your Email password is wrong please try again");
          log("Your Email password is wrong please try again");
        }
      }  else {

        log("Server Error");
        Fluttertoast.showToast(msg: "Server Error");
      }
      setState(() {
        loading = false;
      });
    }

    catch (e){
      debugPrint('e: $e');
      Fluttertoast.showToast(msg: "Internal Server Error Please try again later");
      log("Internal Server Error Please try again later");
      setState(() {
        loading = false;
      });
    }

  }

  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.03,
                ),
                Image.asset(
                  'assets/images/R-Letter-PNG-Pic.png',
                  height: 70,
                  width: 70,
                ),
                Container(
                    height: 70,
                    width: 200,
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    // color: Colors.blue,
                    child: Column(
                      children: const [
                        Text(
                          "Log In Now",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Please login to continue using our app",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 30,
                ),
                Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: TextFormField(
                              controller: emailController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Email is Required";
                                } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                  return "Please enter a valid email address";
                                }
                              },
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                  labelText: "Email",
                                  labelStyle: TextStyle(color: Colors.black45),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.green, width: 2),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 2)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 2))),
                            )),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: TextFormField(
                              controller: passwordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Password is Required";
                                } else if (value.length <= 3) {
                                  return "Password should be greater than 3 latter";
                                }
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              obscureText: isVisible,
                              decoration: InputDecoration(
                                  labelText: "Password",
                                  labelStyle: TextStyle(color: Colors.black45),
                                  suffixIcon: isVisible == false
                                      ? GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isVisible = true;
                                            });
                                          },
                                          child: Icon(Icons.visibility_off))
                                      : GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isVisible = false;
                                            });
                                          },
                                          child: Icon(Icons.visibility)),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.green, width: 2),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 2)),
                                  errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ),
                                      borderSide: BorderSide(
                                          color: Colors.red, width: 2))),
                            )),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 290),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Forgot Password?",
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        loading ? Lottie.asset("assets/json/98195-loader.json", height: 100,width: 100) :
                        Container(
                            width: 220,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.red
                              ),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    login(
                                      emailController.text,
                                      passwordController.text
                                    );
                                    // Navigator.pushReplacement(context, MaterialPageRoute(
                                    //     builder: (context) => Menu()));
                                  };

                                }, child: Text("Log In"),
                                )
                      ),
                      ],
                    )),
                Container(
                    height: 40,
                    width: 230,
                    //  color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            },
                            child: Text(
                              "Sign Up",
                            ))
                      ],
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Or Connect with",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage:AssetImage('assets/images/facebook.png'),
                    ),
                    SizedBox(
                      width: 05,
                    ),
                    CircleAvatar(
                      radius: 15, backgroundColor: Colors.white,
                      backgroundImage:AssetImage('assets/images/twitter.png'),
                    ),
                    SizedBox(
                      width: 05,
                    ),
                    CircleAvatar(
                      radius: 15,
                      backgroundImage:AssetImage('assets/images/google-plus (1).png'),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
