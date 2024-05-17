import 'package:flutter/material.dart';
import 'package:iot/pages/temp.dart';


class LogoScreen extends StatefulWidget{
  const LogoScreen({super.key});
  @override
  State<LogoScreen> createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5),() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const temp(),));
    },);
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(
              "assets/icons/smart-home.png",
            ),
            color: Colors.white,
            height: 150,
            width: double.infinity,
          ),
          SizedBox(height: 50,),
          Text("Smart Home",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
        ],
      ),
    );
  }
}