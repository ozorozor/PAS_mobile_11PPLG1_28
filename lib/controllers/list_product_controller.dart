import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg1_28/models/table_model.dart';

class ListProductController extends GetxController {
  var isLoading = false.obs;
  var standings = <Table>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPremiereTable();
  }

  Future<void> fetchPremiereTable() async {
    const url = "https://fakestoreapi.com/products";
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        standings.assignAll(data.map((e) => Table.fromJson(e)).toList());
      } else {
        Get.snackbar("failed", "Failed to load product data");
      }
    } catch (e) {
      Get.snackbar("error", e.toString());
    }
    isLoading.value = false;
  }
}