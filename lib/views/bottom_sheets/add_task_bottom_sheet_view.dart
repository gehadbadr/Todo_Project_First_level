
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project/models/task_model.dart';
import 'package:project/view_models/app_view_model.dart';

class AddTaskBottomSheetView extends StatelessWidget {
  const AddTaskBottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController entryController = TextEditingController();
    return Consumer<AppViewModel>(builder: (context,viewModel , child){
      return Padding(
          padding: EdgeInsets.only(bottom:MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 5,horizontal: 0),
          height: 90,
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  height: 40,
                  width: 250,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      filled: true,
                      fillColor: viewModel.clrv1,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          )
                      ),
                    ),
                    textAlignVertical: TextAlignVertical.center,
                    cursorColor: viewModel.clrv3,
                    autofocus: true,
                    autocorrect: true,
                    controller: entryController,
                    style: TextStyle(
                      color: viewModel.clrv4,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                    width: 100,
                    child: ElevatedButton(
                        child: Text("Save",
                            style: TextStyle(fontWeight: FontWeight.w600),),
                        onPressed: () {
                              if(entryController.text.isNotEmpty){
                              Task newTask = Task(entryController.text,false);
                              viewModel.addTask(newTask);
                              entryController.clear();
                              Navigator.pop(context);}
                        },
                      // I use styleFrom instead of ButtonStyle beacuse foregroundColor not work in emulater
                      style:ElevatedButton.styleFrom(
                            primary: viewModel.clrv3, // background
                            onPrimary: viewModel.clrv1
                        ),

                    ),

                  ),
                  SizedBox(width: 5,),
                  SizedBox(
                    height: 40,
                    width: 100,
                    child: ElevatedButton(
                         child: Text("Cancel",
                             style: TextStyle(fontWeight: FontWeight.w600),),
                        onPressed: () {
                           //entryController.clear();
                        Navigator.pop(context);  },
                      // I use styleFrom instead of ButtonStyle beacuse foregroundColor not work in emulater
                        style:ElevatedButton.styleFrom(
                            primary: viewModel.clrv3, // background
                            onPrimary: viewModel.clrv1
                        ), /*ButtonStyle(
                          backgroundColor:MaterialStateProperty.all(viewModel.clrv3),
                          foregroundColor:MaterialStateProperty.all(viewModel.clrv1),
                          padding:MaterialStateProperty.all(EdgeInsets.all(20)),
                        )*/
                    ),

                  ),
              ]),

            ],
          ),
        ),
      );
    });
  }
}
