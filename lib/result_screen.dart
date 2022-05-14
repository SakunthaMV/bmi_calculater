import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final double bmi;
  final String bmiWarning;

  const ResultScreen(this.bmi, this.bmiWarning);

  @override
  _ResultScreenState createState() => _ResultScreenState(bmi, bmiWarning);
}

class _ResultScreenState extends State<ResultScreen> {
  double bmi;
  String bmiWarning;

  _ResultScreenState(this.bmi, this.bmiWarning);

  double _obeseValue = 0.1;
  double _overValue = 0.1;
  double _normalValue = 0.1;
  double _underValue = 0.1;
  double _obeseConstant = 0.0;
  double _overConstant = 0.0;
  double _normalConstant = 0.0;
  String _roundBmi = '';
  Color _colorVal = Colors.red.shade900;

  @override
  void initState() {
    super.initState();
    if (bmi < 18.5) {
      setState(() {
        _underValue = bmi;
        _colorVal = Colors.blue.shade900;
      });
    } else if (bmi < 25.0) {
      setState(() {
        _normalValue = bmi - 18.49;
        _normalConstant = 0.2;
        _colorVal = Colors.green.shade600;
      });
    } else if (bmi < 30) {
      setState(() {
        _overValue = bmi - 24.99;
        _overConstant = 0.4;
        _colorVal = Colors.yellow.shade900;
      });
    } else if (bmi < 40) {
      setState(() {
        _obeseValue = bmi - 29.99;
        _obeseConstant = 0.6;
      });
    } else {
      setState(() {
        _obeseValue = 10.0;
        _obeseConstant = 0.6;
      });
    }
    setState(() {
      _roundBmi = bmi.toStringAsFixed(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> fakeBottomButtons = List<Widget>();
    fakeBottomButtons.add(Container(
      height:40.0,
    ));
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 129, 191, 70),
                            Color.fromARGB(255, 96, 153, 62)
                          ]),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          child: SizedBox(
                            width: 200,
                            height: 65,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.blue.shade600),
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.black),
                              child: Stack(
                                children: [
                                  Center(
                                    child: Stack(
                                      children: [
                                        Text(
                                          _roundBmi,
                                          style: TextStyle(
                                            fontSize: 50,
                                            color: _colorVal,
                                            fontFamily: 'Crashnumber',
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                        Text(
                                          _roundBmi,
                                          style: TextStyle(
                                              fontSize: 50,
                                              fontFamily: 'Crashnumber',
                                              fontStyle: FontStyle.italic,
                                              foreground: Paint()
                                                ..style = PaintingStyle.stroke
                                                ..strokeWidth = 0.2
                                                ..color = Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: TweenAnimationBuilder(
                                      tween: Tween(begin: 1.0, end: 0.0),
                                      curve: Curves.easeIn,
                                      duration: Duration(seconds: 2),
                                      builder: (_, opacity, child) {
                                        return Opacity(
                                          opacity: opacity,
                                          child: child,
                                        );
                                      },
                                      child: Container(
                                        width: 220,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          alignment: Alignment(0,-0.3),
                        ),
                        Align(
                          child: Text(
                            bmiWarning,
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Safety',
                                letterSpacing: -0.3,
                                wordSpacing: -1,
                                shadows: [
                                  Shadow(
                                    blurRadius: 1.0,
                                    offset: Offset(0.2,0.2),
                                    color: Colors.grey.shade900
                                  ),
                                ]),
                          ),
                          alignment: Alignment(0, .82),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 160, 226, 76),
                            Color.fromARGB(255, 129, 191, 70)
                          ]),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment(0.6, 0),
                          child: Text(
                            'OBESE',
                            style: TextStyle(
                              fontFamily: 'Oswald',
                              fontSize: 25,
                              letterSpacing: 1,
                              color: Colors.red.shade900,
                              shadows: [
                                Shadow(
                                    blurRadius: 2.0,
                                    offset: Offset(1, 1.5),
                                    color: Colors.black),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: Image.asset(
                            'assets/4.png',
                          ),
                          padding: EdgeInsets.only(top: 10),
                          margin: EdgeInsets.only(top: 20, left: 0),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 140, 241, 112),
                            Color.fromARGB(255, 129, 191, 70)
                          ]),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment(0.8, 0),
                          child: Text(
                            'OVERWEIGHT',
                            style: TextStyle(
                              fontFamily: 'Oswald',
                              fontSize: 25,
                              letterSpacing: 1,
                              color: Colors.yellow.shade900,
                              shadows: [
                                Shadow(
                                    blurRadius: 2.0,
                                    offset: Offset(1, 1.5),
                                    color: Colors.black),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: Image.asset(
                            'assets/3.png',
                          ),
                          padding: EdgeInsets.only(top: 5, left: 0, bottom: 15),
                          margin: EdgeInsets.only(top: 10, left: 0, bottom: 10),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 119, 254, 146),
                            Color.fromARGB(255, 139, 242, 113)
                          ]),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment(0.85, 0),
                          child: Text(
                            'NORMAL OR\nHEALTHY WEIGHT',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Oswald',
                              fontSize: 25,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 1,
                              color: Colors.green.shade600,
                              shadows: [
                                Shadow(
                                    blurRadius: 2.0,
                                    offset: Offset(1, 1.5),
                                    color: Colors.black),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: Image.asset(
                            'assets/2.png',
                          ),
                          padding: EdgeInsets.only(top: 5, left: 2, bottom: 15),
                          margin: EdgeInsets.only(top: 10, left: 0, bottom: 10),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 121, 253, 212),
                            Color.fromARGB(255, 119, 254, 148)
                          ]),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment(0.75, 0),
                          child: Text(
                            'UNDERWEIGHT',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Oswald',
                              fontSize: 25,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 1,
                              color: Colors.blue.shade900,
                              shadows: [
                                Shadow(
                                    blurRadius: 2.0,
                                    offset: Offset(1, 1.5),
                                    color: Colors.black),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          child: Image.asset(
                            'assets/2.png',
                          ),
                          padding: EdgeInsets.only(top: 0, left: 3, bottom: 40),
                          margin: EdgeInsets.only(top: 0, left: 0, bottom: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            CustomPaint(
              painter: HolePainter(
                  MediaQuery.of(context).size.height * 1,
                  MediaQuery.of(context).size.height * 0.8,
                  Colors.white,
                  Colors.white,
                  0.2,
                  0.5),
              child: Container(),
            ),
            TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: _obeseValue),
              curve: Curves.linearToEaseOut,
              duration: Duration(seconds: 3),
              builder: (_, height, __) {
                return CustomPaint(
                  painter: HolePainter(
                      MediaQuery.of(context).size.height * 1,
                      MediaQuery.of(context).size.height *
                          ((_obeseConstant / _obeseValue) * height +
                              (0.2 / 10) * height),
                      Colors.black,
                      Colors.red,
                      0.2,
                      0.5),
                  child: Container(),
                );
              },
            ),
            TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: _overValue),
              duration: Duration(seconds: 3),
              curve: Curves.linearToEaseOut,
              builder: (_, height, __) {
                return CustomPaint(
                  painter: HolePainter(
                      MediaQuery.of(context).size.height * 1,
                      MediaQuery.of(context).size.height *
                          ((_overConstant / _overValue) * height +
                              (0.2 / 5) * height),
                      Colors.black,
                      Colors.red,
                      0.4,
                      0.65),
                  child: Container(),
                );
              },
            ),
            TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: _normalValue),
              duration: Duration(seconds: 3),
              curve: Curves.linearToEaseOut,
              builder: (_, height, __) {
                return CustomPaint(
                  painter: HolePainter(
                      MediaQuery.of(context).size.height * 1,
                      MediaQuery.of(context).size.height *
                          ((_normalConstant / _normalValue) * height +
                              (0.2 / 6.5) * height),
                      Colors.black,
                      Colors.red,
                      0.6,
                      0.82),
                  child: Container(),
                );
              },
            ),
            TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: _underValue),
              curve: Curves.linearToEaseOut,
              duration: Duration(seconds: 3),
              builder: (_, height, __) {
                return CustomPaint(
                  painter: HolePainter(
                      MediaQuery.of(context).size.height * 1,
                      MediaQuery.of(context).size.height *
                          ((0.2 / 18.5) * height),
                      Colors.black,
                      Colors.red,
                      0.8,
                      0.92),
                  child: Container(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HolePainter extends CustomPainter {
  double height;
  double top;
  Color color1;
  Color color2;
  double stop1;
  double stop2;

  HolePainter(
      this.height, this.top, this.color1, this.color2, this.stop1, this.stop2);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    var rect = Offset.zero & size;
    paint.shader = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        color1,
        color2,
      ],
      stops: [stop1, stop2],
    ).createShader(rect);
    paint.blendMode = BlendMode.srcOver;
    paint.style = PaintingStyle.fill;
    var path = Path();

    path.moveTo(0, size.height * 0.2);
    path.quadraticBezierTo(
        size.width * 0.6, size.height * 0.55, 0.0, size.height);
    path.quadraticBezierTo(size.width * 0.82, size.height * 0.6,
        size.width * 0.3, size.height * 0.2);
    canvas.drawPath(
        Path.combine(PathOperation.intersect,
            Path()..addRect(Rect.fromLTWH(0, height - top, 600, height)), path),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
