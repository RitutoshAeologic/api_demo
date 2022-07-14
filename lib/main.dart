import 'package:api_demo/model/user_model.dart';
import 'package:api_demo/router.dart';
import 'package:api_demo/services/remote_service.dart';
import 'package:api_demo/widget/material_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Api Demo',
    //  debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      onGenerateRoute: RouterApp.generateRoute,
      initialRoute: Routes.homeScreen,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.lightGreen.shade400,
         title: Text('Api Demo'),
         centerTitle: true,
        ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButtonBox(title: 'User Data',
            onTap: () => Navigator.pushNamed(context, Routes.userScreen),),

          SizedBox(height: 10,),
          MaterialButtonBox(title: 'Posts Data',  onTap: () => Navigator.pushNamed(context, Routes.postsscreen),),
          SizedBox(height: 10,),
          MaterialButtonBox(title: 'Album Data',  onTap: () => Navigator.pushNamed(context, Routes.albumscreen),),

        ],
    ),
            ),
    );
  }
}




