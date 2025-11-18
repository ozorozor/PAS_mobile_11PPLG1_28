import 'package:flutter/material.dart';
import '../helper/db_helper.dart';
import '../widgets/reusable.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<Map<String, dynamic>> favorites = [];

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    final data = await DBHelper.getFavorites();
    print("Loaded favorites: $data");
    setState(() {
      favorites = data;
    });
  }

  Future<void> deleteFavorite(int id) async {
    print("Deleting favorite with id: $id");
    await DBHelper.deleteFavorite(id);
    await loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List Favorite Products")),
      body: RefreshIndicator(
        onRefresh: loadFavorites,
        child: favorites.isEmpty
            ? ListView(
                children: const [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 200),
                      child: Text("Belum ada produk favorit."),
                    ),
                  ),
                ],
              )
            : ListView.builder(
                itemCount: favorites.length,
                itemBuilder: (context, index) {
                  final product = favorites[index];
                  return ReusableCard(
                    imageUrl: product['image'],
                    title: product['title'],
                    subtitle: "Harga: \$${product['price']}",
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => deleteFavorite(product['id']),
                    ),
                  );
                },
              ),
      ),
    );
  }
}