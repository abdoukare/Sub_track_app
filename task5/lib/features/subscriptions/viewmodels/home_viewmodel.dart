import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:task5/core/constants/app_api_links.dart';
import 'package:task5/core/models/subscription_model.dart';
import 'package:task5/core/network/api_client.dart';
import 'package:task5/core/services/storage_service.dart';

class HomeViewmodel extends GetxController {
  // oberservable list of subscriptions
  final subs = <Subscription>[].obs;

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSubscriptions();
  }

  // method to fetch subscriptions from the json file (mbe3d twli from api)
  Future<void> fetchSubscriptions() async {
    try {
      isLoading.value = true;

      // get dependencies
      final apiClient = Get.find<ApiClient>();
      final storageService = Get.find<StorageService>();
      final userId = storageService.getUserId();

      if (userId == null) {
        debugPrint('❌ User not authenticated');
        return;
      }

      // fetch from api
      final response = await apiClient.getSubscriptions(userId);
      subs.value = (response as List)
          .map((json) => Subscription.fromJson(json as Map<String, dynamic>))
          .toList();
      debugPrint('✅ Loaded ${subs.length} subscriptions');
    } catch (e) {
      debugPrint('Error : $e');
    } finally {
      isLoading.value = false;
    }

    // get total total spending per month
    double getTotalMonthlySpending() {
      return subs.fold(
        0.0,
        (sum, sub) => sum + (sub.price * (sub.frequency == "Monthly" ? 1 : 12)),
      );
    }

    // get the subs by status
    List<Subscription> getSubsByStatus(String status) {
      return subs.where((sub) => sub.status == status).toList();
    }

    // get the subs by category
    List<Subscription> getSubByCategory(String category) {
      return subs.where((sub) => sub.category == category).toList();
    }
  }
}
