import 'package:flutter/material.dart';
import 'package:co_bot/home.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main()
{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp
    (  
      debugShowCheckedModeBanner:false,
      home:
      AnimatedSplashScreen
      (
        splash:Container
        ( 
          child:
          Image.asset('assets/home.gif',fit: BoxFit.cover,),
          height:double.maxFinite,
        ),
        nextScreen: Main(),
        backgroundColor: Colors.blueAccent,
        duration: 5000,
      ),
    );  
  }
}

class Main extends StatelessWidget
{
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
          appBar: AppBar(title:Text('Welcome to Co-Bot',),backgroundColor: Colors.blueGrey,),
          backgroundColor: Colors.grey,
          body: HomeScreen(),
          
        );
  }
}
