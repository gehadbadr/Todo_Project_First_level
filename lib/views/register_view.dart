import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/view_models/app_view_model.dart';
import 'package:project/views/login_view.dart';
import 'package:project/views/task_page.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Register extends StatelessWidget {
  Register({super.key});
  var userName = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  FirebaseAuth instance = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return Scaffold(
          backgroundColor: viewModel.clrv1,
          body: SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                margin: EdgeInsets.only(top: 100),
                color: viewModel.clrv1,
                width: double.infinity,
                // height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/images/logo-g.svg",
                      color: viewModel.clrv4,
                      height: 100,
                      width: 100,
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 9),
                        decoration: BoxDecoration(
                            color: viewModel.clrv2,
                            borderRadius: BorderRadius.circular(66)),
                        width: 266,
                        child: TextField(
                            controller: userName,
                            cursorColor: viewModel.clrv3,
                            style: TextStyle(
                              color: viewModel.clrv4,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "User Name : ",
                              hintStyle: TextStyle(fontSize: 19),
                              prefixIcon: IconTheme(
                                  data: IconThemeData(color: viewModel.clrv4),
                                  child: Icon(
                                    Icons.person,
                                  )),
                            ))),
                    Container(
                        margin: EdgeInsets.only(top: 27),
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 9),
                        decoration: BoxDecoration(
                            color: viewModel.clrv2,
                            borderRadius: BorderRadius.circular(66)),
                        width: 266,
                        child: TextField(
                            controller: email,
                            cursorColor: viewModel.clrv3,
                            style: TextStyle(
                              color: viewModel.clrv4,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email : ",
                              hintStyle: TextStyle(fontSize: 19),
                              prefixIcon: IconTheme(
                                  data: IconThemeData(color: viewModel.clrv4),
                                  child: Icon(
                                    Icons.email,
                                  )),
                            ))),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 27),
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 9),
                        decoration: BoxDecoration(
                            color: viewModel.clrv2,
                            borderRadius: BorderRadius.circular(66)),
                        width: 266,
                        child: TextField(
                            controller: password,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: viewModel.clrv3,
                            obscureText: true,
                            style: TextStyle(
                              color: viewModel.clrv4,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password :  ",
                              hintStyle: TextStyle(fontSize: 19),
                              prefixIcon: IconTheme(
                                  data: IconThemeData(color: viewModel.clrv4),
                                  child: Icon(
                                    Icons.lock,
                                  )),
                              suffixIcon: IconTheme(
                                  data: IconThemeData(color: viewModel.clrv4),
                                  child: Icon(
                                    Icons.visibility,
                                  )),
                            ))),
                    ElevatedButton(
                      onPressed: () async {
                        if (userName.text.isEmpty ||
                            email.text.isEmpty ||
                            password.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Username ,Email,password is required",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.white,
                              textColor: viewModel.clrv4,
                              fontSize: 16.0);
                        }
                        try {
                          UserCredential credential =
                              await instance.createUserWithEmailAndPassword(
                                  email: '${email.text}',
                                  password: '${password.text}');
                          await credential.user
                              ?.updateDisplayName('${userName.text}');

                          Fluttertoast.showToast(
                              msg: "Your registration is completed ",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.white,
                              textColor: viewModel.clrv4,
                              fontSize: 16.0);
                          Navigator.pushReplacementNamed(context, "/taskPage");
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            Fluttertoast.showToast(
                                msg: "Password is weak ",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.white,
                                textColor: viewModel.clrv4,
                                fontSize: 16.0);
                          } else if (e.code == 'email-already-in-use') {
                            Fluttertoast.showToast(
                                msg: "this email is already  registered ",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.white,
                                textColor: viewModel.clrv4,
                                fontSize: 16.0);
                          } else if (e.code == 'invalid-email') {
                            Fluttertoast.showToast(
                                msg: "Email is invalid ",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.white,
                                textColor: viewModel.clrv4,
                                fontSize: 16.0);
                          }
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(viewModel.clrv4),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 99, vertical: 15)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(66))),
                      ),
                      child: Text(
                        "Register",
                        style: TextStyle(fontSize: 27),
                      ),
                    ),
                    InkWell(
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text.rich(TextSpan(
                              text: 'Already have an account? ',
                              children: <InlineSpan>[
                                TextSpan(
                                  text: 'Login',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue,
                                  ),
                                )
                              ])),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/login');
                        })
                  ],
                ),
              ),
            ),
          ));
    });
  }
}
