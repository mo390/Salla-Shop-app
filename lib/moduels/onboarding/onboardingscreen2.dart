import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:salla/moduels/auth/login.dart';



class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(

      dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Colors.blue,
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0))),
      onSkip: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const LoginScreen()));
      },
      showSkipButton: true,
      showNextButton: true,
      next: const Icon(Icons.arrow_forward_rounded),
      onDone: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const LoginScreen()));
      },
      skip: const Text(
        'SKIP',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
      ),
      done: const Text("Done",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30)),
      pages: [
        PageViewModel(
          decoration: const PageDecoration(
          imagePadding: EdgeInsets.all(8),
            imageAlignment: Alignment.center,
            titleTextStyle: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent),
            bodyTextStyle: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          title: 'Welcome To Salla App',
          body: 'Salla is app for shopping ',
          image: Image.network(
              'https://pbs.twimg.com/profile_images/1443191599756890112/aDjgxfVK_400x400.png'),
        ),
        PageViewModel(
          decoration: const PageDecoration(
            imageAlignment: Alignment.center,
            titleTextStyle: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent),
            bodyTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          title: 'The best E-commerce',
          body: 'best offers is here and free delivery ',
          image: Image.network(
              'https://pbs.twimg.com/media/Ee_4UUIXYAIJAYt.jpg'),
        ),
        PageViewModel(
          decoration: const PageDecoration(
            imageAlignment: Alignment.center,
              titleTextStyle: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent)),
          title: 'Let\'s go',
          body: 'Shopping Start From Here',
          image: Image.network(
              'https://i0.wp.com/arabianexpert.org/wp-content/uploads/2021/06/%D9%85%D8%AA%D8%A7%D8%AC%D8%B1-%D9%85%D9%86%D8%B5%D8%A9-.jpg?resize=780%2C470&ssl=1'),
        ),
        // PageViewModel(
        //   title: "go to login",
        //   bodyWidget: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: const [Text('body page')],
        //   ),
        //   image: Image.asset(
        //       'assets/images/ckmpz8guf054h9cg1kwn7u1o0-free-onboarding-software.full.png'),
        // ),
        // PageViewModel(
        //     title: '5 page',
        //     bodyWidget: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Image.asset(
        //             'assets/images/ckmpz8guf054h9cg1kwn7u1o0-free-onboarding-software.full.png'),
        //         Text(
        //           'body page',
        //           style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        //         ),
        //       ],
        //     ))
      ],
    );
  }
}
