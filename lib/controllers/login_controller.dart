import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../networks/client_network.dart';
import '../models/login_model.dart';
import '../routes/app_routes.dart';

class LoginController extends GetxController {
  final username = TextEditingController();
  final password = TextEditingController();

  var isLoading = false.obs;
  var loginStatus = "".obs;

  Future<void> login() async {
    final user = username.text.trim();
    final pass = password.text.trim();

    if (user.isEmpty || pass.isEmpty) {
      Get.snackbar("Error", "Username dan password tidak boleh kosong");
      return;
    }

    isLoading.value = true;
    loginStatus.value = "";

    try {
      final url = Uri.parse(ClientNetwork.login);
      final response = await http.post(url, body: {
        "username": user,
        "password": pass,
      });

      if (response.statusCode == 200) {
        final result = LoginModel.fromJson(jsonDecode(response.body));

        if (result.status == true) {
          final prefs = await SharedPreferences.getInstance();
          if (result.token != null && result.token!.isNotEmpty) {
            await prefs.setString('token', result.token!);
          }
          await prefs.setString('username', user);

          Get.offAllNamed(AppRoutes.dashboard);
        } else {
          loginStatus.value = result.message;
        }
      } else {
        Get.snackbar("Error", "Status code: ${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar("Error", "$e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    username.dispose();
    password.dispose();
    super.onClose();
  }
}
