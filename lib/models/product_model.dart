// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecomended;
  final bool isPopular;

  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecomended,
    required this.isPopular,
  });

  @override
  List<Object> get props {
    return [name, category, imageUrl, price, isRecomended, isPopular];
  }

  static const List<Product> products = [
    Product(
      name: "Soft Drinks #1",
      category: "Soft Drinks",
      imageUrl:
          "https://www.foodbeverageinsider.com/sites/foodbeverageinsider.com/files/FBI%20carbonated%20soft%20drinks.jpg",
      price: 2.99,
      isRecomended: true,
      isPopular: true,
    ),
    Product(
      name: "Soft Drinks #2",
      category: "Soft Drinks",
      imageUrl:
          "https://sagaciresearch.com/wp-content/uploads/2019/09/Top-10-Carbonated-Soft-Drinks-Egypt-V3.jpg",
      price: 2.99,
      isRecomended: false,
      isPopular: true,
    ),
    Product(
      name: "Soft Drinks #3",
      category: "Soft Drinks",
      imageUrl:
          "https://lirp.cdn-website.com/1fdafd38/dms3rep/multi/opt/softdrinks-1920w.jpg",
      price: 2.99,
      isRecomended: true,
      isPopular: true,
    ),
    Product(
      name: "Smoothies #1",
      category: "Smoothies",
      imageUrl:
          "https://images.bisnis.com/posts/2022/01/05/1485565/smoothies-bowl.jpg",
      price: 2.99,
      isRecomended: true,
      isPopular: false,
    ),
    Product(
      name: "Smoothies #2",
      category: "Smoothies",
      imageUrl:
          "https://awsimages.detik.net.id/community/media/visual/2022/01/08/resep-smothie-mangga-ala-chef-eddrian-tjhia-2.jpeg?w=700&q=90",
      price: 2.99,
      isRecomended: false,
      isPopular: false,
    ),
    Product(
      name: "Water #1",
      category: "Water",
      imageUrl:
          "https://hips.hearstapps.com/ame-prod-goodhousekeeping-assets.s3.amazonaws.com/main/embedded/25836/glass_water.jpg",
      price: 0,
      isRecomended: true,
      isPopular: true,
    ),
  ];
}
