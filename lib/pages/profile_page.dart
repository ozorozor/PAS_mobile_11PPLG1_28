import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController controller = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Center(
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 55,
                backgroundImage: controller.profileImage.value.isNotEmpty
                    ? NetworkImage(controller.profileImage.value)
                    : const AssetImage("assets/profile.png") as ImageProvider,
              ),
              const SizedBox(height: 16),

              Text(
                controller.username.value,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),

              const SizedBox(height: 32),

              ElevatedButton.icon(
                onPressed: controller.logout,
                icon: const Icon(Icons.logout),
                label: const Text("Logout"),
              )
            ],
          );
        }),
      ),
    );
  }
}
