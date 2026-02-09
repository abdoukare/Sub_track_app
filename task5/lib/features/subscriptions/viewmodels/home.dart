import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../auth/viewmodels/auth_controller.dart';

class HomeView extends StatelessWidget {
  final AuthController auth = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Subscription Tracker"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              auth.logout();
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          "Welcome to the  Temporary Home Screen!",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
