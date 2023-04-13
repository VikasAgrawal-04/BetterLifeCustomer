import 'package:flutter/material.dart';

const kRadius = 4.0;
const kInputRadius = 12.0;

const kCircularRadius = Radius.circular(kRadius);
const kBorderRadius = BorderRadius.all(kCircularRadius);
const kPhysics = BouncingScrollPhysics();
const kCurve = Curves.fastLinearToSlowEaseIn;
const kMargin = EdgeInsets.all(10);
const kSplashDuration = Duration(milliseconds: 3000);
const kDuration = Duration(milliseconds: 500);
const kBorderSide = BorderSide(color: Colors.transparent);
const kPadding = EdgeInsets.all(20);
const kInputPadding = EdgeInsets.fromLTRB(20, 15, 12, 15);
