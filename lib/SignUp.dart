import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:login_activity/Login.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailControllerr = TextEditingController();
  TextEditingController passwordControllerr = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController roleController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool isVisible = true;
  bool isView = true;
  bool loading = false;

  Signup(name, email,phone, password, conpassword, role) async{
    setState(() {
      loading = true;
    });
    try {
      final response = await http.post(Uri.parse("http://adeegmarket.zamindarestate.com/api/v1/reg"),
          headers: {
            'Content-Type': 'application/json',
          },
          body:
          jsonEncode({
            'name' : '$name',
            'email': '$email',
            'phone' : '$phone',
            'password' : '$password',
            'password_confirmation': '$conpassword',
            'role' : '$role'
          })
      );

      print(response.statusCode);
      print(response.body);

      if(response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var bodyResponse = body[ 'status'];
        if(bodyResponse==200) {
          log("Sign Up Success!");
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => Login()));
        }
        else{
          log("Your Email password is wrong please try again");
        }
      }  else {
        log("Server Error");
      }
      setState(() {
        loading = false;
      });
    } catch (e){
      debugPrint('e: $e');
      log("Internal Server Error Please try again later");
    }
    setState(() {
      loading = false;
    });
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
                          "Sign Up Now",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Please fill the details and create account",
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
                              horizontal: 280,
                            ),
                            child: TextFormField(
                              controller: nameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Name is Required";
                                }
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                  labelText: "Name",
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
                                horizontal: 280, vertical: 10),
                            child: TextFormField(
                              controller: emailControllerr,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Email is Required";
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
                                horizontal: 280, vertical: 10),
                            child: TextFormField(
                              controller: phoneController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Phone is Required";
                                }
                              },
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                  labelText: "Phone Number",
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
                                horizontal: 280, vertical: 10),
                            child: TextFormField(
                              controller: passwordControllerr,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Password is Required";
                                } else if (value.length <= 5) {
                                  return "Password should be greater than 5 latter";
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
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 280, vertical: 10),
                            child: TextFormField(
                              controller: confirmPassword,
                              validator: (valuee) {
                                if (valuee!.isEmpty) {
                                  return "Password is Required";
                                } else if (valuee.length <= 5) {
                                  return "Password should be greater than 5 latter";
                                } else if (passwordControllerr.text !=
                                    confirmPassword.text) {
                                  return "Password not Match";
                                }
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              obscureText: isView,
                              decoration: InputDecoration(
                                  labelText: "Confirm Password",
                                  labelStyle: TextStyle(color: Colors.black45),
                                  suffixIcon: isView == false
                                      ? GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isView = true;
                                            });
                                          },
                                          child: Icon(Icons.visibility_off))
                                      : GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isView = false;
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
                        Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 280, vertical: 10
                            ),
                            child: TextFormField(
                              controller: roleController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Name is Required";
                                }
                              },
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                  labelText: "role",
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
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            width: 220,
                            child: ElevatedButton(
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.red),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                 Signup(nameController.text, emailControllerr.text, phoneController.text,
                                     passwordControllerr.text,
                                     confirmPassword.text, roleController.text );
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => Login()));
                                }
                                ;
                              },
                              child: Text("Sign Up"),
                            )),
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
                          "Already have an account?",
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            },
                            child: Text(
                              "Log In",
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
                      backgroundImage: AssetImage('assets/images/facebook.png'),
                    ),
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/images/twitter.png'),
                    ),
                    CircleAvatar(
                      radius: 15,
                      backgroundImage:
                          AssetImage('assets/images/google-plus (1).png'),
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
