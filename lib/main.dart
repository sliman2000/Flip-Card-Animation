import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      
       localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  
  bool isBack = false;
  double angle = 0;
  void flip(){
    setState(() {
      angle  = (angle + pi)%(2*pi);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff292a3e),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(onTap:flip,
              child: TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: angle),
                  duration: const Duration(seconds: 1),
                  builder: ((context, value, __) {
                    if(value >= (pi/2)){
                      isBack = true;
                    }else{
                      isBack = false;
                    }
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(value),
                      child: SizedBox(
                        width: 309,
                        height: 474,
                        child: isBack
                            ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                      'assets/back.png',
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                              alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                      'assets/face.jpeg',
                                    ),
                                  ),
                                ),
                                child:  Text(
                                  S.of(context).title,textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 30.0,color: Colors.white,fontWeight: FontWeight.w700),
                                ),
                              ),
                      ),
                    );
                  })),
            )
          ],
        ),
      )),
    );
  }
}




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(color:Colors.amber ,);
  }
}