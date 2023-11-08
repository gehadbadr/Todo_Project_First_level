import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/views/login_view.dart';
import 'package:provider/provider.dart';
import 'package:project/view_models/app_view_model.dart';

class HeaderView extends StatelessWidget {
  HeaderView({super.key});
  User? user = FirebaseAuth.instance.currentUser;
  String checkUserName() {
    if (user == null) {
      return "Mr Megahid";
    } else {
      return '${user?.displayName}';
    }
  }
  /*String username() {
    //  User? username= FirebaseAuth.instance.currentUser ;
     if(user == null){
       return "Mr Megahid";
     }
   }*/

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return Row(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        // fit:BoxFit.fitHeight,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'Hi : ' + checkUserName(),
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: viewModel.clrv4),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 20),
                          child: IconButton(
                              onPressed: () async {
                                await FirebaseAuth.instance.signOut();
                                Navigator.pushReplacementNamed(
                                    context, '/login');
                              },
                              icon: Icon(Icons.logout_rounded,
                                  color: viewModel.clrv4, size: 40)),
                        ))
                  ],
                ),
              )),
        ],
      );
    });
  }
}
