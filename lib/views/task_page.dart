import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/view_models/app_view_model.dart';
import 'package:project/views/add_task_view.dart';
import 'package:project/views/header_view.dart';
import 'package:project/views/task_list_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  FirebaseAuth instance = FirebaseAuth.instance;
  @override

  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder:(context, viewModel, child ){
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple.shade200,
            title: Text("Welcome , Gehad",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontFamily:"Myfont",
                    fontWeight: FontWeight.w700)),
            centerTitle: true,
            leading: IconButton(
              icon:SvgPicture.asset(
                "assets/images/dashboard.svg"
                ,color: Colors.white,
                height: 30,
                width: 30,),
              onPressed: () {Navigator.pushNamed(context, "/dashboard");},
            ),
            actions: [
              IconButton(
                  icon: SvgPicture.asset(
                    "assets/images/logo-g.svg"
                    ,color: Colors.white,
                    height: 50,
                    width: 50,),
                  onPressed: () {Navigator.pushNamed(context, "/profile");}),
            ],
          ),
          body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(color: viewModel.clrv1,child: HeaderView(),)
                ),

                Expanded(
                    flex: 7,
                    child: Container(color: viewModel.clrv1,child:const TaskListView())
                )
              ],
            ),
          ),        floatingActionButton: AddTaskView()
      );
    });

  }
}
