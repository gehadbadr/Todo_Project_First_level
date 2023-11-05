import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/views/dashboard_view.dart';
import 'package:project/views/login_view.dart';
import 'package:project/views/profile_view.dart';
import 'package:project/views/splash.dart';
import 'package:provider/provider.dart';
import 'package:project/view_models/app_view_model.dart';
import 'package:project/views/task_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(create: (context)=>AppViewModel(),child: const MyApp()));
}
/*void main() {
  runApp(ChangeNotifierProvider(create: (context)=>AppViewModel(),child: const MyApp()));
}*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute:'/',
        routes: {
          '/taskPage':(context)=> const TaskPage(),
          '/dashboard':(context)=> const DashboardView(),
          '/profile':(context)=> const ProfileView(),
          '/login':(context)=>  Login(),
        },
        debugShowCheckedModeBanner: false,
        home:Splash()
    );
  }
}

