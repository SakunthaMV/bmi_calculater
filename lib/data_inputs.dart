import 'package:bmi_calculater/result_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class DataInputs extends StatefulWidget {
  @override
  _DataInputsState createState() => _DataInputsState();
}

class _DataInputsState extends State<DataInputs> {
  var _currentItem = 'Male';
  var _massUnit = 'kg';
  var _heightUnit = 'cm';
  double _mass = 0.0;
  double _height = 0.0;
  int _age = 0;
  var _ageValidity = '';
  var _massValidity = '';
  var _heightValidity = '';
  double _looseWeight = 0.0;
  double _gainWeight = 0.0;
  String bmiWarning = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TweenAnimationBuilder(
            tween: Tween(begin: pi / 2, end: 0.0),
            duration: Duration(seconds: 2),
            builder: (_, rotate, child) {
              return Transform(
                transform: Matrix4.rotationX(rotate),
                child: child,
                alignment: Alignment.center,
              );
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 300,
                  height: 64,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 199, 146, 223),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blue.shade900,
                          blurRadius: 2.0,
                          spreadRadius: 2)
                    ],
                  ),
                ),
                Positioned(
                  left: 25,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 0.8, color: Colors.black),
                      color: Color.fromARGB(255, 245, 247, 73),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.blueGrey,
                            blurRadius: 7,
                            offset: Offset(0, 6))
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 55,
                  child: Text(
                    'AGE',
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Hearth',
                        shadows: [
                          Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 0.5,
                              color: Colors.grey),
                        ],
                        letterSpacing: 2),
                  ),
                ),
                Positioned(
                  left: 155,
                  child: SizedBox(
                    width: 70,
                    height: 50,
                    child: TextField(
                      cursorColor: Colors.black,
                      cursorHeight: 30,
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.bottom,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      style: TextStyle(
                        fontFamily: 'Digital',
                        fontSize: 30,
                        letterSpacing: 3.0,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 76, 42, 133))),
                      ),
                      onChanged: (age) {
                        if (age == '') {
                          _age = 0;
                        } else {
                          _age = int.parse(age);
                        }
                      },
                      onTap: () {
                        setState(() {
                          _ageValidity = '';
                        });
                      },
                    ),
                  ),
                ),
                Positioned(
                  left: 235,
                  child: Text(
                    'Yrs',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Positioned(
                  top: 4,
                  left: 55,
                  child: Text(
                    _ageValidity,
                    style: TextStyle(
                        color: Colors.red.shade900,
                        fontFamily: 'Philosopher',
                        letterSpacing: 1),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TweenAnimationBuilder(
            tween: Tween(begin: pi / 2, end: 0.0),
            duration: Duration(seconds: 2),
            builder: (_, rotate, child) {
              return Transform(
                transform: Matrix4.rotationX(rotate),
                child: child,
                alignment: Alignment.center,
              );
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 300,
                  height: 64,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 220, 171, 223),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blue.shade900,
                          blurRadius: 5.0,
                          spreadRadius: 2)
                    ],
                  ),
                ),
                Positioned(
                  left: 25,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 0.8, color: Colors.black),
                      color: Color.fromARGB(255, 245, 247, 73),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.blueGrey,
                            blurRadius: 7,
                            offset: Offset(0, 6))
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 55,
                  child: Text(
                    'GENDER',
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Hearth',
                        shadows: [
                          Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 0.5,
                              color: Colors.grey),
                        ],
                        letterSpacing: 2),
                  ),
                ),
                Positioned(
                  left: 155,
                  child: DropdownButton(
                    items: [
                      DropdownMenuItem(
                        value: 'Male',
                        child: Text(
                          'male',
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Male',
                          ),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'Female',
                        child: Text(
                          'female',
                          style: TextStyle(fontSize: 25, fontFamily: 'Female'),
                        ),
                      ),
                    ],
                    onChanged: (String newValue) {
                      setState(() {
                        this._currentItem = newValue;
                      });
                    },
                    value: _currentItem,
                    dropdownColor: Color.fromARGB(255, 220, 171, 223),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TweenAnimationBuilder(
            tween: Tween(begin: pi / 2, end: 0.0),
            duration: Duration(seconds: 2),
            builder: (_, rotate, child) {
              return Transform(
                transform: Matrix4.rotationX(rotate),
                child: child,
                alignment: Alignment.center,
              );
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 300,
                  height: 64,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 208, 196, 223),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blue.shade900,
                          blurRadius: 5.0,
                          spreadRadius: 2)
                    ],
                  ),
                ),
                Positioned(
                  left: 25,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 0.8, color: Colors.black),
                      color: Color.fromARGB(255, 245, 247, 73),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.blueGrey,
                            blurRadius: 7,
                            offset: Offset(0, 6))
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 55,
                  child: Text(
                    'MASS',
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Hearth',
                        shadows: [
                          Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 0.5,
                              color: Colors.grey),
                        ],
                        letterSpacing: 2),
                  ),
                ),
                Positioned(
                  left: 155,
                  child: SizedBox(
                    width: 70,
                    height: 50,
                    child: TextField(
                      cursorColor: Colors.black,
                      cursorHeight: 30,
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.bottom,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      style: TextStyle(
                          fontFamily: 'Digital',
                          fontSize: 30,
                          letterSpacing: 3.0),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 76, 42, 133))),
                      ),
                      onChanged: (mass) {
                        if (mass == '') {
                          _mass = 0.0;
                        } else if (_massUnit == 'kg') {
                          _mass = double.parse(mass);
                        } else {
                          _mass = double.parse(mass) / 2.205;
                        }
                      },
                      onTap: () {
                        setState(() {
                          _massValidity = '';
                        });
                      },
                    ),
                  ),
                ),
                Positioned(
                  left: 235,
                  child: DropdownButton(
                    items: [
                      DropdownMenuItem(
                        value: 'kg',
                        child: Text(
                          'kg',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'lb',
                        child: Text(
                          'lb',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                    onChanged: (String newValue) {
                      setState(() {
                        this._massUnit = newValue;
                      });
                    },
                    value: _massUnit,
                    dropdownColor: Color.fromARGB(255, 208, 196, 223),
                  ),
                ),
                Positioned(
                  top: 4,
                  left: 55,
                  child: Text(
                    _massValidity,
                    style: TextStyle(
                        color: Colors.red.shade900,
                        fontFamily: 'Philosopher',
                        letterSpacing: 1),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TweenAnimationBuilder(
            tween: Tween(begin: pi / 2, end: 0.0),
            duration: Duration(seconds: 2),
            builder: (_, rotate, child) {
              return Transform(
                transform: Matrix4.rotationX(rotate),
                child: child,
                alignment: Alignment.center,
              );
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 300,
                  height: 64,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 221, 221, 223),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blue.shade900,
                          blurRadius: 5.0,
                          spreadRadius: 2)
                    ],
                  ),
                ),
                Positioned(
                  left: 25,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 0.8, color: Colors.black),
                      color: Color.fromARGB(255, 245, 247, 73),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.blueGrey,
                            blurRadius: 7,
                            offset: Offset(0, 6))
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 55,
                  child: Text(
                    'HEIGHT',
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Hearth',
                        shadows: [
                          Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 0.5,
                              color: Colors.grey),
                        ],
                        letterSpacing: 2),
                  ),
                ),
                Positioned(
                  left: 235,
                  child: DropdownButton(
                    items: [
                      DropdownMenuItem(
                        value: 'cm',
                        child: Text(
                          'cm',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'm',
                        child: Text(
                          'm',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'in',
                        child: Text(
                          'in',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                    onChanged: (String newValue) {
                      setState(() {
                        this._heightUnit = newValue;
                      });
                    },
                    value: _heightUnit,
                    dropdownColor: Color.fromARGB(255, 221, 221, 223),
                  ),
                ),
                Positioned(
                  left: 155,
                  child: SizedBox(
                    width: 70,
                    height: 50,
                    child: TextField(
                      cursorColor: Colors.black,
                      cursorHeight: 30,
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.bottom,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      style: TextStyle(
                          fontFamily: 'Digital',
                          fontSize: 30,
                          letterSpacing: 3.0),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 76, 42, 133))),
                      ),
                      onChanged: (height) {
                        if (height == '') {
                          _height = 0.0;
                        } else if (_heightUnit == 'm') {
                          _height = double.parse(height);
                        } else if (_heightUnit == 'cm') {
                          _height = double.parse(height) / 100;
                        } else {
                          _height = double.parse(height) * 0.0254;
                        }
                      },
                      onTap: () {
                        setState(() {
                          _heightValidity = '';
                        });
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 4,
                  left: 55,
                  child: Text(
                    _heightValidity,
                    style: TextStyle(
                        color: Colors.red.shade900,
                        fontFamily: 'Philosopher',
                        letterSpacing: 1),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 38,
          ),
          TweenAnimationBuilder(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: Duration(seconds: 2),
            builder: (_, scale, child) {
              return Transform.scale(
                scale: scale,
                child: child,
                alignment: Alignment.center,
              );
            },
            curve: Curves.slowMiddle,
            child: SizedBox(
              width: 200,
              height: 60,
              child: RaisedButton(
                elevation: 6,
                splashColor: Colors.blue,
                color: Color.fromARGB(255, 0, 48, 73),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.white)),
                child: Text(
                  'Calculate',
                  style: TextStyle(
                    height: 1.35,
                    fontFamily: 'Sketch',
                    fontSize: 50,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                          offset: Offset(3, 3),
                          blurRadius: 5.0,
                          color: Colors.black),
                    ],
                  ),
                ),
                onPressed: () {
                  double bmi = _mass / (_height * _height);
                  if (_age >= 120 ||
                      _age < 1 ||
                      _mass > 450.0 ||
                      _mass < 2.5 ||
                      _height > 3.0 ||
                      _height < 0.3) {
                    if (_age >= 120 || _age < 1) {
                      setState(() {
                        _ageValidity = 'Enter a Valid Age...';
                      });
                    } else {
                      setState(() {
                        _ageValidity = '';
                      });
                    }
                    if (_mass > 450.0 || _mass < 2.5) {
                      setState(() {
                        _massValidity = 'Enter a Valid Mass...';
                      });
                    } else {
                      setState(() {
                        _massValidity = '';
                      });
                    }
                    if (_height > 3.0 || _height < 0.3) {
                      setState(() {
                        _heightValidity = 'Enter a Valid Height...';
                      });
                    } else {
                      setState(() {
                        _heightValidity = '';
                      });
                    }
                  } else {
                    setState(() {
                      _ageValidity = '';
                      _massValidity = '';
                      _heightValidity = '';
                    });
                    if (bmi > 25.0) {
                      if (_massUnit == 'kg') {
                        setState(() {
                          _looseWeight = _mass - _height * _height * 25.0;
                          String _looseWeightRound =
                              _looseWeight.toStringAsFixed(1);
                          bmiWarning = 'You need to lose at least ' +
                              _looseWeightRound +
                              ' Kilograms';
                        });
                      } else {
                        setState(() {
                          _looseWeight =
                              (_mass - _height * _height * 25.0) * 2.205;
                          String _looseWeightRound =
                              _looseWeight.toStringAsFixed(1);
                          bmiWarning = 'You need to lose at least ' +
                              _looseWeightRound +
                              ' pounds';
                        });
                      }
                    } else if (bmi < 18.5) {
                      if (_massUnit == 'kg') {
                        setState(() {
                          _gainWeight = _height * _height * 18.5 - _mass;
                          String _gainWeightRound =
                              _gainWeight.toStringAsFixed(1);
                          bmiWarning = 'You need to gain at least ' +
                              _gainWeightRound +
                              ' Kilograms';
                        });
                      } else {
                        setState(() {
                          _gainWeight =
                              (_height * _height * 18.5 - _mass) * 2.205;
                          String _gainWeightRound =
                              _gainWeight.toStringAsFixed(1);
                          bmiWarning = 'You need to gain at least ' +
                              _gainWeightRound +
                              ' pounds';
                        });
                      }
                    } else {
                      setState(() {
                        bmiWarning = 'You have a healthy BMI Value';
                      });
                    }
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return ResultScreen(bmi, bmiWarning);
                    }));
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
