import 'package:flutter/material.dart';
import 'package:project/view_models/app_view_model.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return Scaffold(
        backgroundColor:  viewModel.clrv1,
        appBar: AppBar(
          backgroundColor: Colors.purple.shade200,
          title: Text("To Do Dashboard",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  fontFamily: "Myfont",
                  fontWeight: FontWeight.w700)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: double.infinity,
            color: viewModel.clrv1,
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                      alignment: Alignment.center,
                      height: 100,
                      width: 400,
                      child: Text(
                        "Total Task",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: viewModel.clrv4,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: viewModel.clrv2,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                      alignment: Alignment.center,
                      height: 100,
                      width: 200,
                      child: Text(
                        "${viewModel.numTasks}",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: viewModel.clrv4,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: viewModel.clrv2,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                      alignment: Alignment.center,
                      height: 100,
                      width: 400,
                      child: Text(
                        "Completed Task",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: viewModel.clrv4,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: viewModel.clrv2,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                      alignment: Alignment.center,
                      height: 100,
                      width: 200,
                      child: Text(
                        "${viewModel.NumCompletedTasks}",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: viewModel.clrv4,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: viewModel.clrv2,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                      alignment: Alignment.center,
                      height: 100,
                      width: 400,
                      child: Text(
                        "Non-Completed Task",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: viewModel.clrv4,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: viewModel.clrv2,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                      alignment: Alignment.center,
                      height: 100,
                      width: 200,
                      child: Text(
                        "${viewModel.NumNonCompletedTasks}",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: viewModel.clrv4,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: viewModel.clrv2,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
//hh/h/h
