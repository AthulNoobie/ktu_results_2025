import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ktu_results/app_bar.dart';
import 'package:ktu_results/desktop_body.dart';
import 'package:ktu_results/mobile_body.dart';

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const Base());
}

bool filter = false;
ColorFilter mat = const ColorFilter.matrix([
  1,
  0,
  0,
  0,
  0,
  0,
  1,
  0,
  0,
  0,
  0,
  0,
  1,
  0,
  0,
  0,
  0,
  0,
  1,
  0,
]);

class Base extends StatefulWidget {
  const Base({super.key});

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  void updateColorFilter(ColorFilter filter) {
    setState(() {
      mat = filter;
    });
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.latoTextTheme(),
        ),
        home: ColorFiltered(
          colorFilter: mat,
          child: Scaffold(
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(screenWidth > 850 ? 52.5 : 93),
                  child: Appbar(filter:updateColorFilter)),
              body: screenWidth > 850 ? const AppBody() : const MobileBody()),
        ));
  }
}
