import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task5/core/constants/constants.dart';
import '../viewmodels/home_viewmodel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeView extends StatelessWidget {
  final HomeViewmodel vm = Get.put(HomeViewmodel());

  @override
  Widget build(BuildContext context) {
    // DefaultTabController provides a controller for TabBar/TabBarView
    return DefaultTabController(
      length: 5, // total tabs
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Subscription Tracker",
            style: TextStyle(
              color: Colors.white,
              fontFamily: GoogleFonts.lato().fontFamily,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: primary,
          bottom: const TabBar(
            //isScrollable: true,
            tabs: [
              Tab(
                text: "All",
                icon: Icon(Icons.list, color: Colors.white),
              ),
              Tab(
                text: "Active",
                icon: Icon(Icons.check_circle, color: Colors.white),
              ),
              Tab(
                text: "Expired",
                icon: Icon(Icons.cancel, color: Colors.white),
              ),
              Tab(
                text: "Expired soon",
                icon: Icon(Icons.warning, color: Colors.white),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _subscriptionsListView(),
            _subscriptionsListView(),
            _subscriptionsListView(),
            _subscriptionsListView(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: primary,
          child: Icon(Icons.add, color: Colors.white),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget _subscriptionsListView() {
    return Obx(() {
      if (vm.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }
      if (vm.subs.isEmpty) {
        return Center(child: Text("No subscriptions found."));
      }
      return ListView.builder(
        itemCount: vm.subs.length,
        itemBuilder: (context, index) {
          final sub = vm.subs[index];
          return ListTile(
            title: Text(sub.name),
            subtitle: Text("${sub.price} USD - ${sub.frequency}"),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  sub.status,
                  style: TextStyle(fontWeight: FontWeight.bold, color: primary),
                ),
                Text(
                  "${sub.daysUntilRenewal} days left",
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
