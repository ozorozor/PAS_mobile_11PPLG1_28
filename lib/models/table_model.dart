import 'dart:convert';

List<Table> TableFromJson(String str) => List<Table>.from(json.decode(str).map((x) => Table.fromJson(x)));

String TableToJson(List<Table> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Table {
  int id;
  String title;
  double price;
  String description;
  Category? category;
  String image;
  Rating rating;

  Table({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Table.fromJson(Map<String, dynamic> json) => Table(
        id: json["id"],
        title: json["title"],
        price: (json["price"] is int)
            ? (json["price"] as int).toDouble()
            : (json["price"] ?? 0).toDouble(),
        description: json["description"] ?? '',
        category: categoryValues.map[json["category"]],
        image: json["image"] ?? '',
        rating: json["rating"] != null
            ? Rating.fromJson(json["rating"])
            : Rating(rate: 0, count: 0),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "category": category != null ? categoryValues.reverse[category] : null,
        "image": image,
        "rating": rating.toJson(),
      };
}

enum Category {
    ELECTRONICS,
    JEWELERY,
    MEN_S_CLOTHING,
    WOMEN_S_CLOTHING
}

final categoryValues = EnumValues({
    "electronics": Category.ELECTRONICS,
    "jewelery": Category.JEWELERY,
    "men's clothing": Category.MEN_S_CLOTHING,
    "women's clothing": Category.WOMEN_S_CLOTHING
});

class Rating {
    double rate;
    int count;

    Rating({
        required this.rate,
        required this.count,
    });

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: json["rate"]?.toDouble(),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "rate": rate,
        "count": count,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
