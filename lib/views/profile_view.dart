import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project/view_models/app_view_model.dart';
import 'package:provider/provider.dart';
class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder:(context, viewModel, child ){
      return Scaffold(
        backgroundColor:  viewModel.clrv1,
        appBar: AppBar(
          backgroundColor: viewModel.clrv2,
          title: Text("To My Profile",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  fontFamily:"Myfont",
                  fontWeight: FontWeight.w700)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
          child: Container(
                width: MediaQuery.of(context).size.width,
                      child: Column(
                          children: [
                            Container(color: viewModel.clrv1,
                              width:200,
                              height:200,
                              margin: EdgeInsets.all(10),
                              child: Image.asset("assets/images/logo.png"),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children:[
                                    Text("Gehad Ahmed Badr",
                                         style: TextStyle(fontSize: 28,fontWeight: FontWeight.w900)
                                      ,),
                                    Row(
                                      mainAxisAlignment : MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.email_outlined,
                                          color: viewModel.clrv4,
                                          size: 20,
                                        ),
                                        SizedBox(width: 10,),
                                        Text("gehad.bader@gmail.com"),
                                      ],),
                                    Row(
                                      mainAxisAlignment : MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/images/linkedin.svg"
                                          ,color:viewModel.clrv4 ,
                                          height: 20,
                                          width: 20,
                                        ),
                                        SizedBox(width: 10,),
                                        Text("https://eg.linkedin.com/gehadbadr "),
                                      ],),
                                    Row(
                                      mainAxisAlignment : MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/images/github.svg"
                                          ,color:viewModel.clrv4 ,
                                          height: 20,
                                          width: 20,),
                                        SizedBox(width: 10,),
                                        Text("https://github.com/gehadbadr"),
                                      ],),
                                    Row(
                                      mainAxisAlignment : MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.phone_android,
                                          color: viewModel.clrv4,
                                          size: 20,
                                        ),
                                        SizedBox(width: 10,),
                                        Text("+201278998944"),
                                      ],),
                                    SizedBox(height: 10,),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [

                                          Text("Education",
                                          style: TextStyle(fontWeight: FontWeight.w900)
                                          ,),
                                          SizedBox(height: 5,),
                                          Text("  Bachelor of Management Information System (MIS), Faculty of Commerce, Alexandria University (June.2008)  ",
                                            // style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400)
                                          ),
                                          SizedBox(height: 10,),
                                          Text("Work Experience",
                                            style: TextStyle(fontWeight: FontWeight.w900)
                                            ,),
                                          SizedBox(height: 5,),
                                          Text("Freelancer laravel Developer "),
                                          SizedBox(height: 5,),
                                          Text("   June.2022  -     present"),
                                          SizedBox(height: 10,),
                                          Text("Codeignitier Developer in 2windesign Software Solutions company "),
                                          SizedBox(height: 5,),
                                          Text("   Sep.2018  -     Feb.2021"),
                                          SizedBox(height: 10,),
                                          Text("PHP Developer in Elnaddy Software Solutions company "),
                                          SizedBox(height: 5,),
                                          Text("   Oct.2010  -     Feb.2012"),
                                          SizedBox(height: 10,),
                                          Text("J2me Developer in Maddar Software Solutions company "),
                                          SizedBox(height: 5,),
                                          Text("   Apr.2009   -     Oct.2009"),
                                          SizedBox(height: 10,),
                                          Text("Skills",
                                            style: TextStyle(fontWeight: FontWeight.w900)
                                            ,),
                                          SizedBox(height: 5,),
                                          Text("  Dart, Flutter3 ,HTML5, CSS3, JavaScript, PHP , Laravel9 ,Codeigniter4,Codeigniter3, Nodejs , Wordpress , MySQL, XML ,AJAX ,Jquery, Photoshop "),
                                        ],
                                      ),
                                    ),

                            ]
                              ),
                            ),

                          ],
                      ),
                    ),
          ),
      );
    }
    );
  }
}
//hh/h/h