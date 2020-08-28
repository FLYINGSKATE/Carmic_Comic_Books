import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:learningflutter/Comics.dart';
import 'package:page_turn/page_turn.dart';

class ReadingPage extends StatefulWidget {

  final Comics comic;

  const ReadingPage({
    Key key, this.comic,
  }) : super(key: key);

  @override
  _ReadingPageState createState() => _ReadingPageState();
}

class _ReadingPageState extends State<ReadingPage> {
  Timer _timerForInter;
  MobileAdTargetingInfo targetingInfo;
  InterstitialAd myInterstitial;

  final _controller = GlobalKey<PageTurnState>();

  InterstitialAd _interstitalAds;



  @override
  void initState(){


    targetingInfo = MobileAdTargetingInfo(
      keywords: <String>['flutterio', 'beautiful apps'],
      contentUrl: 'https://flutter.io',
      birthday: DateTime.now(),
      childDirected: false,
      designedForFamilies: false,
      gender: MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
      testDevices: <String>[], // Android emulators are considered test devices
    );

    _timerForInter = Timer.periodic(Duration(seconds: 60), (result) {
    _interstitalAds = createInterstitialAd()..load()..show(
      anchorType: AnchorType.bottom,
      anchorOffset: 0.0,
      horizontalCenterOffset: 0.0,
    );
    });
    super.initState();


  }

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
        adUnitId: 'ca-app-pub-2781524319588199/1733968126',
        //Change Interstitial AdUnitId with Admob ID
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print("IntersttialAd |||||||||||||||| $event");
        });
  }



  @override
  void dispose() {
    // Add these to dispose to cancel timer when user leaves the app
    _timerForInter.cancel();
    myInterstitial.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    //print("One Page"+widget.comic.pages[2]);
    createInterstitialAd()
      ..load()
      ..show();
    return Scaffold(
      body: PageTurn(
        key: _controller,
        backgroundColor: Colors.white,
        showDragCutoff: false,
        lastPage: Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("The End!",style:TextStyle(
                fontFamily: "present",
                color:Colors.white,
                fontSize:50.0,
              )),
            ],
          ),
        ),
        children: <Widget>[
          for (var i = 0; i < widget.comic.pages.length; i++)
            Container(
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: widget.comic.pages[i],
              placeholder: (BuildContext context, String url) => Container(
                width: 100,
                height: 100,
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
                color: Colors.black,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
        ],
      ),
    ) ;
  }
}
