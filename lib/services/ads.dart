import 'package:flutter/material.dart';
import 'package:sounds/services/admob_ad_network.dart';
import 'package:sounds/services/applovin_ad_network.dart';
import 'package:sounds/tools.dart';

class AdsHelper {
  // static late AdsModel ids;
  static ApplovinAdNetwork applovin = ApplovinAdNetwork();
  static AdmobHelper admob = AdmobHelper();

  static late String adNetwork;
  static late String appOpen;
  static late String banner;
  static late String inter;
  static late String rewarded;
  static late String native;
  static late String mRec;



  static init() async {

    adNetwork = Tools.allData.ads.adNetwork.toLowerCase();
    
    appOpen = Tools.allData.ads.ids.appOpen;
    banner = Tools.allData.ads.ids.banner;
    inter = Tools.allData.ads.ids.inter;
    rewarded = Tools.allData.ads.ids.reward;
    native = Tools.allData.ads.ids.native;
    mRec = Tools.allData.ads.ids.mRec;


    switch (adNetwork) {
      case "admob":
        await AdmobHelper.init();
        break;
      case "applovin":
        await ApplovinAdNetwork.init();
        break;
      case "unity":
        break;
      case "facebook":
        break;
      default: //"any"
        break;
    }
  }

  Widget getBannerAd() {
    switch (adNetwork) {
      case "admob":
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: admob.getBanner(banner),
        );
      case "applovin":
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: applovin.getBanner(banner),
        );
      case "unity":
        return const SizedBox();
      case "facebook":
        return const SizedBox();
      default: //"any"
        return const SizedBox();
    }
  }

  loadInter() async {
    switch (adNetwork) {
      case "admob":
        admob.loadInter(inter);
        break;
      case "applovin":
        await applovin.loadInter(inter);
        break;
      case "unity":
        break;
      case "facebook":
        break;
      default: //"any"
        break;
    }
  }

  showInter() async {
    switch (adNetwork) {
      case "admob":
        admob.showInter(inter);
        break;
      case "applovin":
        await applovin.showInter(inter);
        break;
      case "unity":
        break;
      case "facebook":
        break;
      default: //"any"
        break;
    }
  }

  loadAndShowInter(BuildContext context) async {
    switch (adNetwork) {
      case "admob":
        admob.loadAndShowInter(context: context, id: inter, onFinished: () {});
        break;
      case "applovin":
        await applovin.loadAndShowInter(
            context: context, id: inter, onFinished: () {});
        break;
      case "unity":
        break;
      case "facebook":
        break;
      default: //"any"
        break;
    }
  }

  loadReward() async {
    switch (adNetwork) {
      case "admob":
        break;
      case "applovin":
        applovin.loadReward(rewarded);
        break;
      case "unity":
        break;
      case "facebook":
        break;
      default: //"any"
        break;
    }
  }

  showReward() async {
    switch (adNetwork) {
      case "admob":
        break;
      case "applovin":
        applovin.showReward(rewarded);
        break;
      case "unity":
        break;
      case "facebook":
        break;
      default: //"any"
        break;
    }
  }
}
