import 'package:mongo_dart/mongo_dart.dart';

class Categories {
  Categories({
    required this.id,
    required this.icon,
    required this.title,
    required this.cost,
    required this.date,
    required this.category,
  });

  final ObjectId id;
  final int icon;
  final String title;
  final int cost;
  final DateTime date;
  final String category;

  factory Categories.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null && json['id'] is ObjectId) {
      return Categories(
        id: json['id'],
        icon: json['icon'],
        title: json['title'],
        cost: json['cost'],
        date: json['date'],
        category: json['category'],
      );
    } else {
      // Handle the case where 'id' is null or of the wrong type, e.g., set a default ObjectId.
      return Categories(
        id: ObjectId(), // You can set a default value or handle it differently based on your requirements.
        icon: json['icon'],
        title: json['title'],
        cost: json['cost'],
        date: json['date'],
        category: json['category'],
      );
    }
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "icon": icon,
        "title": title,
        "cost": cost,
        "date": date,
        "category": category,
      };
}
