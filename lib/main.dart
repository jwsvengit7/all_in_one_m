import 'package:all_in_one_m/shared/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:all_in_one_m/state_management/provider.dart';

int? screen;
String? email;

Future<void> main() async {
 
  WidgetsFlutterBinding.ensureInitialized();
 SharedPreferences preferences = await SharedPreferences.getInstance();

  AuthProvider provider = AuthProvider();
  runApp(ChangeNotifierProvider.value(
    value: provider,
    child: MyApp(),
  ));
}

// Future<void> initSharedPreferences() async {
//   SharedPreferences preferences = await SharedPreferences.getInstance();
//   screen = preferences.getInt("screen");
//   await preferences.setInt("screen", 1);
//   email = preferences.getString("email");
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      initialRoute: "/",
      routes: {
        "/": (context) => const Splash(),
      },
    );
  }
}
