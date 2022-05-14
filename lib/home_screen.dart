import 'dart:ui';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

import 'ad_manager.dart';
import 'data_inputs.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BannerAd _bannerAd;
  bool adShown = false;

  Future<void> _initAdMob() {
    // TODO: Initialize AdMob SDK
    return FirebaseAdMob.instance.initialize(appId: AdManager.appId);
  }

  void _loadBannerAd() {
    _bannerAd
      ..load()
      ..show(anchorType: AnchorType.bottom);
  }

  void initState() {
    super.initState();
    // TODO: Initialize _bannerAd
    _bannerAd = BannerAd(
        adUnitId: AdManager.bannerAdUnitId,
        size: AdSize.banner,
        listener: (MobileAdEvent event) {
          if (event == MobileAdEvent.loaded) {
            setState(() {
              adShown = true;
            });
          } else if (event == MobileAdEvent.failedToLoad) {
            setState(() {
              adShown = false;
            });
          }
        });

    // TODO: Load a Banner Ad
    _loadBannerAd();
  }

  void dispose() {
    // TODO: Dispose BannerAd object
    _bannerAd?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> fakeBottomButtons = List<Widget>();
    fakeBottomButtons.add(Container(
      height:40.0,
    ));
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 440,
                    child: Container(
                      color: Color.fromARGB(255, 76, 42, 133),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'BMI Calculator',
                          style: TextStyle(
                              fontSize: 50,
                              shadows: [
                                Shadow(
                                    offset: Offset(2, 2),
                                    blurRadius: 5.0,
                                    color: Colors.black),
                              ],
                              color: Color.fromARGB(255, 221, 251, 210),
                              fontFamily: 'Billy Ohio'),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 430,
                      ),
                      Stack(
                        children: [
                          Container(
                            alignment: Alignment.topCenter,
                            child: TweenAnimationBuilder(
                              tween: Tween(
                                  begin: MediaQuery.of(context).size.height *
                                      0.145,
                                  end: MediaQuery.of(context).size.height *
                                      0.353),
                              duration: Duration(seconds: 2),
                              builder: (_, size, __) {
                                return SizedBox(
                                  width: double.infinity,
                                  height: size,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              AssetImage('assets/Path_2.png'),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            alignment: Alignment.topCenter,
                            child: TweenAnimationBuilder(
                              tween: Tween(
                                  begin: MediaQuery.of(context).size.height *
                                      0.159,
                                  end: MediaQuery.of(context).size.height *
                                      0.397),
                              duration: Duration(seconds: 2),
                              builder: (_, size, __) {
                                return SizedBox(
                                  width: double.infinity,
                                  height: size,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              AssetImage('assets/Path_1.png'),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.080,
                            top: MediaQuery.of(context).size.height * 0.162,
                            child: TweenAnimationBuilder(
                              tween: Tween(begin: 0.0, end: 1.0),
                              duration: Duration(seconds: 2),
                              builder: (_, scale, child) {
                                return Transform.scale(
                                  scale: scale,
                                  child: child,
                                );
                              },
                              curve: Interval(0.5, 1),
                              child: Container(
                                child: Text(
                                  'Control Your \nBody Shape...',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                          offset: Offset(1, 1),
                                          blurRadius: 5.0,
                                          color: Colors.black),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.227,
                            top: -MediaQuery.of(context).size.height * 0.023,
                            child: TweenAnimationBuilder(
                              curve: Interval(0.5, 1, curve: Curves.easeIn),
                              tween: Tween(begin: 0.0, end: 1.0),
                              duration: Duration(seconds: 2),
                              builder: (_, scale, child) {
                                return Transform.scale(
                                  scale: scale,
                                  child: child,
                                );
                              },
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.463,
                                width:
                                    MediaQuery.of(context).size.width * 0.892,
                                child: Container(
                                    child: Image.asset('assets/bmi.png')),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 120,
                      ),
                      DataInputs(),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: adShown? fakeBottomButtons:null,
    );
  }
}
