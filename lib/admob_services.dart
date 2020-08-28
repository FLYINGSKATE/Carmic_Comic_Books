import 'dart:io';

class AdmobServices{

  String getAdMobAppId(){
    if(Platform.isAndroid){
      return 'ca-app-pub-2781524319588199~6810007313';
    }
    return null;
  }

  String getInterstitialAdId(){
    if(Platform.isAndroid){
      return 'ca-app-pub-2781524319588199/1733968126';
    }
    return null;
  }

}