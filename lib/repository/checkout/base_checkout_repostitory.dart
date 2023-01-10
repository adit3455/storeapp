import '../../models/export_model.dart';

abstract class BaseCheckOutRepository {
  Future<void> addCheckout(Checkout checkout);
}
