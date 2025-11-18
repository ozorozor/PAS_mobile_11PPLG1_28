import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            margin: const EdgeInsets.all(24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 6,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                      Text(
                            "Login",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 24),
                      TextField(
                        controller: controller.username,
                        decoration: const InputDecoration(
                          labelText: "Username",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: controller.password,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),
                              const SizedBox(height: 20),
                  
                              Obx(() {
                  return ElevatedButton(
                    onPressed: controller.isLoading.value
                        ? null
                        : () async => await controller.login(),
                    child: controller.isLoading.value
                        ? const CircularProgressIndicator()
                        : const Text("Login"),
                  );
                              }),
                  
                              const SizedBox(height: 1),
                              Obx(() => Text(
                  controller.loginStatus.value,
                  style: const TextStyle(color: Colors.red),
                              )),
                              const SizedBox(height: 1),
                              ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/register');
                  },
                  child: const Text('Register'),
                              ),
                            ],
                ),
                              ),
            ),
        ),
      ),
    );
  }
}
