import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:salla/moduels/splash%20screen/splash%20screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const SallaShop());
}

class SallaShop extends StatelessWidget {
  const SallaShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
