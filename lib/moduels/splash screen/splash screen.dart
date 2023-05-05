import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:salla/moduels/onboarding/onboardingscreen2.dart';

import '../../Layout/homelayout.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(

      splash: Expanded(
        child: Container(
          child: const Image(
            fit: BoxFit.cover,
            image: NetworkImage(
              'https://pbs.twimg.com/profile_images/1443191599756890112/aDjgxfVK_400x400.png',
            ),
          ),
        ),
      ),
      nextScreen: OnboardingScreen(),
      duration: 4000,
      splashTransition: SplashTransition.rotationTransition,
      pageTransitionType: PageTransitionType.leftToRight,

      splashIconSize: 400,
    );
  }
}
