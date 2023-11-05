import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/view_models/app_view_model.dart';
import 'package:project/views/login_view.dart';
import 'package:project/views/task_page.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState(){
    super.initState();
    _navigatetohome();
  }
  _navigatetohome()async{

    await Future.delayed(Duration(milliseconds: 3000),(){});
  //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>FirebaseAuth.instance.currentUser == null? Login() : TaskPage()));
  }

  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return Scaffold(
        body: Container(
          color: viewModel.clrv1,
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(color: viewModel.clrv1,
                    width:200,
                    height:200,
                   // margin: EdgeInsets.only(top: 100),
                    child:SvgPicture.asset(
                      "assets/images/logo-g.svg"
                      ,color:viewModel.clrv4 ,
                      height: 200,
                      width: 200,),
                   // child: Image.asset("assets/images/logo.png"),
                  ),
                  Text("Gehad App",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900,color: viewModel.clrv4),),
                ],
              )),
        ),
      );
    });
  }}