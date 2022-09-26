import 'package:demo_application/consts/colors.dart';
import 'package:demo_application/consts/consts.dart';
import 'package:demo_application/consts/images.dart';
import 'package:demo_application/consts/strings.dart';
import 'package:demo_application/consts/utils.dart';
import 'package:demo_application/views/home_screen/home.dart';
import 'package:demo_application/views/signin_screen/signin_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark),
  );

  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var isUser = false;

  checkUser() async {
    auth.authStateChanges().listen((User? user) {
      if(user == null && mounted) {
        setState(() {
          isUser = false;
        });
      } else {
        setState(() {
          isUser = true;
        });
      }
    });
  }

  @override
  void initStat() {
    super.initState();
    checkUser();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: "mont"),
      debugShowCheckedModeBanner: false,
      home: isUser ? HomeScreen() : const ChatApp(),
      title: appname,
    );
  }
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      logo,
                      width: 120,
                      color: btnColor,
                    ),
                    appname.text.size(28).fontFamily(bold).make(),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 10.0,
                    children: List.generate(listOfFeatures.length, (index) {
                      return Chip(
                        labelPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                        backgroundColor: Colors.transparent,
                        side: const BorderSide(
                          color: Vx.gray400,
                        ),
                        label: listOfFeatures[index].text.semiBold.gray600.make(),
                      );
                    }),
                  ),
                  20.heightBox,
                  slogan.text.size(38).fontFamily(bold).make(),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: context.screenWidth - 80,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: btnColor,
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.all(16),
                        ),
                        onPressed: () {
                          Get.to(() => VerificationScreen(), transition: Transition.downToUp);
                        },
                        child: cont.text.semiBold.size(15).make(),
                      ),
                    ),
                  ),
                  10.heightBox,
                  poweredby.text.size(10).gray600.make(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
