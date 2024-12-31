import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:http/http.dart' as http;
import 'package:pd_scan/screens/scan_screen/scan_screen.dart';

import '../../utilities/storage.dart';

class LoginViewModel extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscurePassword = true; // For toggling password visibility

  Future<void> signInWithEmailPassword() async {
    final url =
        'https://app.flowforceengineering.com/Api/AccountApi/GetUserByParam/${emailController.text}/${passwordController.text}';

    try {
      final response = await http.get(
        Uri.parse(url),
        // headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
        // Handle success
        await QStorage()
            .setString("userName", data['data']['userName'].toString());
       await QStorage()
            .setString("userCode", data['data']['userId'].toString());

        Get.snackbar(
          'Login Success',
          'Welcome ${data['data']['userName']}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
        emailController.clear();
        passwordController.clear();
        Get.to(() =>  ScanScreen(userId: data['data']['userId'].toString(),userName:data['data']['userName'].toString()));
      } else {
        // Handle server error
        Get.snackbar(
          'Login Error',
          'Failed with status: ${response.statusCode}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
      }
    } catch (e) {
      // Handle connection error
      Get.snackbar(
        'Login Error',
        'Something went wrong: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
      );
    }
  }
}
