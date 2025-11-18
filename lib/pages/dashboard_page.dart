import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_28/pages/favorite_page.dart';
import 'package:pas_mobile_11pplg1_28/pages/list_product_page.dart';
import 'package:pas_mobile_11pplg1_28/pages/profile_page.dart';
import '../controllers/dashboard_controller.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController c = Get.put(DashboardController());

    final List<Widget> pages = [
      ListProductPage(),
      FavoritePage(),
      const ProfilePage()
    ];

    return Obx(() {
      return Scaffold(
        body: IndexedStack(
          index: c.currentIndex.value,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: c.currentIndex.value,
          onTap: (i) => c.changePage(i),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "List Produk",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorite",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      );
    });
  }
}
