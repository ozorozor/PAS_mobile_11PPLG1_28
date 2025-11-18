import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/db_helper.dart';
import '../controllers/list_product_controller.dart';
import '../widgets/reusable.dart';

class ListProductPage extends StatelessWidget {
  ListProductPage({super.key});

  final ListProductController controller = Get.put(ListProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List Product")),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return RefreshIndicator(
            onRefresh: () => controller.fetchPremiereTable(),
            child: ListView.builder(
              itemCount: controller.standings.value.length,
              itemBuilder: (context, index) {
                final product = controller.standings[index];
                return ReusableCard(
                  imageUrl: product.image,
                  title: product.title,
                  subtitle: "Harga: \$${product.price}",
                  trailing: ElevatedButton(
                    onPressed: () async {
                      await DBHelper.addFavorite({
                        'id': product.id,
                        'title': product.title,
                        'price': product.price,
                        'description': product.description,
                        'category': product.category.toString(),
                        'image': product.image,
                      });
                      Get.snackbar("Success", "Produk berhasil di Favorite!");
                    },
                    child: const Text("Favorite"),
                  ),
                );
              },
            ),
          );
        }),
      ),
    );
  }
}