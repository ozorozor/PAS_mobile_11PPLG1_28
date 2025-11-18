import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterController extends GetxController {
  final username = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final email = TextEditingController();

  var isLoading = false.obs;
  var registerStatus = ''.obs;

  Future<void> register() async {
    isLoading.value = true;
    registerStatus.value = '';
    final url = Uri.parse('https://mediadwi.com/api/latihan/register-user');
    try {
      final response = await http.post(
        url,
        body: {
          'username': username.text,
          'password': password.text,
          'full_name': fullName.text,
          'email': email.text,
        },
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == true) {
          registerStatus.value = 'Register success!';
          Get.back();
        } else {
          registerStatus.value = data['message'] ?? 'Register failed!';
        }
      } else {
        registerStatus.value = 'Register failed!';
      }
    } catch (e) {
      registerStatus.value = 'Error: ' + e.toString();
    }
    isLoading.value = false;
  }

  @override
  void onClose() {
    username.dispose();
    password.dispose();
    fullName.dispose();
    email.dispose();
    super.onClose();
  }
}
