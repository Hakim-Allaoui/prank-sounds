import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sounds/tools.dart';

class AdmobHelper {
  static InterstitialAd? _interstitialAd;

  static int numOfAttemptToLoad = 0;

  static init() async {
    await MobileAds.instance.initialize();
  }

  Widget getBanner(String id) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      height: 50.0,
      child: CustomBannerAd(
        id: id,
      ),
    );
  }

  // create interstitial ads (2)
  void loadInter(String id) {
    Tools.logger.i("create interstitial called");

    if (_interstitialAd != null) {
      Tools.logger.i("interstitial already created called");
      return;
    }

    InterstitialAd.load(
      adUnitId: id,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          Tools.logger.i("Loaded interstitial");
          _interstitialAd = ad;
          numOfAttemptToLoad = 0;
        },
        onAdFailedToLoad: (LoadAdError error) {
          numOfAttemptToLoad = numOfAttemptToLoad + 1;
          if (numOfAttemptToLoad <= 2) {
            loadInter(id);
          }
          _interstitialAd = null;
        },
      ),
    );
  }

// show interstitial ads to user (2)
  showInter(String id) {
    /*interCalledTimes++;

    Tools.logger.i(
        "\ntteesstt frequency= $frequency / recommendationCalledTimes= $interCalledTimes" +
            "\ntteesstt interstitial Div = ${frequency / interCalledTimes}" +
            "\ntteesstt interstitial Frequency = ${interCalledTimes % frequency}");

    if (interCalledTimes % frequency != 0) {
      if (_interstitialAd == null) {
        createInterstitialStatic();
      }
      return;
    }
    */

    if (_interstitialAd == null) {
      return;
    }

    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) {
        Tools.logger.i("ad onAdShowedFullscreen interstitial");
      },
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        Tools.logger.i("ad Disposed interstitial");
        ad.dispose();
        loadInter(id);
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError adError) {
        Tools.logger.i('$ad OnAdFailed $adError interstitial');
        ad.dispose();
      },
      onAdWillDismissFullScreenContent: (InterstitialAd ad) {
        Tools.logger.i('$ad onAdWillDismissFullScreenContent interstitial');
      },
    );

    _interstitialAd!.show();
    _interstitialAd = null;
  }

  loadAndShowInter({
    required BuildContext context,
    required String id,
    required VoidCallback onFinished
  }) async {

    Future.delayed(const Duration(seconds: 30), () {
      Navigator.pop(context);
      onFinished();
      Tools.logger.i("TIMEOUT");
      return;
    });

    Tools.waitingDialog(
        context: context,
        process: () {
          InterstitialAd.load(
            adUnitId: id,
            request: const AdRequest(),
            adLoadCallback: InterstitialAdLoadCallback(
              onAdLoaded: (InterstitialAd ad) {
                Tools.logger.i("Loaded interstitial");
                _interstitialAd = ad;
                numOfAttemptToLoad = 0;

                _interstitialAd!.fullScreenContentCallback =
                    FullScreenContentCallback(
                  onAdShowedFullScreenContent: (InterstitialAd ad) {
                    Tools.logger.i("ad onAdShowedFullscreen interstitial");
                  },
                  onAdDismissedFullScreenContent: (InterstitialAd ad) {
                    Tools.logger.i("ad Disposed interstitial");
                    ad.dispose();
                    loadInter(id);

                    Navigator.pop(context);
                    onFinished();
                    return;
                  },
                  onAdFailedToShowFullScreenContent:
                      (InterstitialAd ad, AdError adError) {
                    Tools.logger.e('$ad OnAdFailed $adError interstitial');
                    ad.dispose();
                  },
                  onAdWillDismissFullScreenContent: (InterstitialAd ad) {
                    Tools.logger
                        .e('$ad onAdWillDismissFullScreenContent interstitial');
                  },
                );

                _interstitialAd!.show();
                _interstitialAd = null;
              },
              onAdFailedToLoad: (LoadAdError error) {
                numOfAttemptToLoad = numOfAttemptToLoad + 1;
                if (numOfAttemptToLoad <= 2) {
                  loadInter(id);
                }
                _interstitialAd = null;

                Navigator.pop(context);
                onFinished();
                return;
              },
            ),
          );
        });
  }
}

class CustomBannerAd extends StatefulWidget {
  const CustomBannerAd({Key? key, required this.id})
      : super(key: key);

  final String id;

  @override
  State<CustomBannerAd> createState() => _CustomBannerAdState();
}

class _CustomBannerAdState extends State<CustomBannerAd> {
  BannerAd? bannerAd;
  bool isBannerAdLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: widget.id,
      listener: BannerAdListener(
        onAdFailedToLoad: (ad, error) {
          Tools.logger.i("Ad Failed to Load\nError: ${error.message}");
          ad.dispose();
        },
        onAdLoaded: (ad) {
          Tools.logger.i("Ad Loaded");
          setState(() {
            isBannerAdLoaded = true;
          });
        },
      ),
      request: const AdRequest(),
    );

    bannerAd!.load();
  }

  @override
  Widget build(BuildContext context) {
    return isBannerAdLoaded
        ? SizedBox(
            width: double.infinity, height: 50, child: AdWidget(ad: bannerAd!))
        : const SizedBox();
  }
}
