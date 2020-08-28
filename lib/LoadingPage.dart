import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/loadingGif.gif',height: 125.0, width: 125.0,),
              ),
              Text("Loading...",style:TextStyle(
                fontFamily: "present",
                color:Colors.white,
                fontSize:40.0,
              )),
            ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    setUpHomePage();
  }

  void setUpHomePage() async {
    String gotoThisPage = "";


    //Check if the current user is logged in or not if he did then take him to HomePage else to LoginPage
    if (await FirebaseAuth.instance.currentUser() != null) {
      // signed in
      gotoThisPage = "/Home";
    } else {
      gotoThisPage = "/Login";
    }
    print("I'm at This Page : "+gotoThisPage);


    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context)
          .pushReplacementNamed(gotoThisPage);
    });
  }
}