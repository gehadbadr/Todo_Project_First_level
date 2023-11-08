import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project/view_models/app_view_model.dart';
import 'package:project/views/register_view.dart';
import 'package:project/views/task_page.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  Login({super.key});
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
                margin: EdgeInsets.only(top: 150),
                color: viewModel.clrv1,
                width: double.infinity,
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
                        if (email.text.isEmpty || password.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Email,password is required",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.white,
                              textColor: viewModel.clrv4,
                              fontSize: 16.0);
                        }
                        try {
                          UserCredential credential =
                              await instance.signInWithEmailAndPassword(
                                  email: '${email.text}',
                                  password: '${password.text}');
                          Navigator.pushReplacementNamed(context, "/taskPage");
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'wrong-password') {
                            Fluttertoast.showToast(
                                msg: "Wrong Password ",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.white,
                                textColor: viewModel.clrv4,
                                fontSize: 16.0);
                          } else if (e.code == 'user-not-found') {
                            Fluttertoast.showToast(
                                msg: "this email is not found ",
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
                        "Log in",
                        style: TextStyle(fontSize: 27),
                      ),
                    ),
                    InkWell(
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text.rich(TextSpan(
                              text: "Don't have an account? ",
                              children: <InlineSpan>[
                                TextSpan(
                                  text: 'Register Now',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue,
                                  ),
                                )
                              ])),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, "/register");
                        }),
                    InkWell(
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text("Home ",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                              )),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/taskPage');
                        })
                  ],
                ),
              ),
            ),
          ));
    });
  }
}
