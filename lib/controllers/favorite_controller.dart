import 'package:get/get.dart';
import '../helper/db_helper.dart';

class FavoriteController extends GetxController {
  var favorites = [].obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final data = await DBHelper.getFavorites();
    favorites.assignAll(data);
  }

  Future<void> deleteFavorite(int id) async {
    await DBHelper.deleteFavorite(id);
    await loadFavorites();
  }
}