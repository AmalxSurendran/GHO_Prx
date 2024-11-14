import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  String? token;

  @override
  void onInit() {
    super.onInit();
    // Check login status after a delay
    Future.delayed(const Duration(seconds: 3), checkLoginStatus);
  }

  // Method to fetch data from SharedPreferences
  Future<void> getData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    token = pref.getString('token');
  }

  // Method to check login status and navigate
  Future<void> checkLoginStatus() async {
    await getData();
    if (token == null) {
      // Navigate to the login page if no token found
      Get.offNamed('/LoginPage');
    } else {
      // Navigate to homepage if token is present
      Get.offNamed('/homepage');
    }
  }
}
