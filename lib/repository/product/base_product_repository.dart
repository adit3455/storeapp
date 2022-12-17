import '../../models/export_model.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}
