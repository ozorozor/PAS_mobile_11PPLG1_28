import 'package:get/get.dart';
import 'package:pas_mobile_11pplg1_28/controllers/list_product_controller.dart';

class ListProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListProductController>(()=> ListProductController());
  }
}
