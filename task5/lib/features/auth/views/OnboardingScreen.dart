import 'package:flutter/material.dart';
import 'package:task5/core/constants/constants.dart';
import 'package:task5/features/auth/views/login_view.dart';
import 'package:task5/features/auth/views/register_view.dart';

class Onboardingscreen extends StatelessWidget {
  const Onboardingscreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -410,
            right: -410,
            child: Container(
              height: 630,
              width: 630,
              decoration: BoxDecoration(
                color: lightblue,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: -((1 / 4) * 800),
            right: -((1 / 4) * 800),
            child: Container(
              height: 450,
              width: 450,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: lightblue, width: 2),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              children: [
                SizedBox(height: 10),
                Image.asset(
                  "assets/illustration.png",
                  height: 320,
                  width: 320,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Keep Track On Your Subscriptions",
                    style: h1,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(
                  "Manage all of your subscriptions in one place",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CustomButtom(
                      text: 'Login',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginView()),
                        );
                      },
                    ),
                    SizedBox(width: 20),
                    CustomButtom(
                      text: 'Signup',
                      isTransparent: true,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterView(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    super.key,
    this.isTransparent = false,
    required this.text,
    this.onPressed,
  });
  final bool isTransparent;
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 120,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isTransparent ? Colors.transparent : primary,
          foregroundColor: isTransparent ? null : primary,
          //disabledBackgroundColor: Colors.transparent,
          //disabledForegroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onPressed,

        child: Text(
          text,
          style: h2.copyWith(
            color: isTransparent ? Colors.black : white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
