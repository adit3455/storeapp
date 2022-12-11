// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [name, imageUrl];

  static List<Category> categories = [
    const Category(
      name: "Soft Drink",
      imageUrl:
          "https://sagaciresearch.com/wp-content/uploads/2019/09/Top-10-Carbonated-Soft-Drinks-Egypt-V3.jpg",
    ),
    const Category(
      name: "Smoothies",
      imageUrl:
          "https://www.dbs.com/spark/index/id_id/site/assets/images/repository/articles/Resep-Homemade-Smoothies-Bowl.jpg",
    ),
    const Category(
      name: "Water",
      imageUrl:
          "https://post.healthline.com/wp-content/uploads/2020/06/glass-drinking-water-732x549-thumbnail-1-732x549.jpg",
    ),
  ];
}
