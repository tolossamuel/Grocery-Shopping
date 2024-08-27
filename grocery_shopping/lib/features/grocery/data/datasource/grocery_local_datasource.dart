import 'package:grocery_shopping/features/grocery/data/model/local_storage_model.dart';
import 'package:hive/hive.dart';

class CartService {
  final String _boxName = "cartProducts";

  Future<Box<CartProduct>> get _box async =>
      await Hive.openBox<CartProduct>(_boxName);


  Future<bool> addOrUpdateCartProduct(String cartId, dynamic product) async {
    var box = await _box;
    CartProduct cartProduct = box.get(cartId) ?? CartProduct(products: {});
    cartProduct.products[cartId] = product;
    await box.put(cartId, cartProduct);
    return box.containsKey(
        cartId); 
  }

  Future<dynamic> getCartProductById(String cartId) async {
    var box = await _box;
    CartProduct? cartProduct = box.get(cartId);
    return cartProduct?.products[cartId];
  }

  // Read all CartProducts and return as a Map<String, dynamic>
  Future<Map<String, dynamic>> getAllCartProducts() async {
    var box = await _box;
    Map<String, dynamic> allProducts = {};
    for (var cartProduct in box.values) {
      allProducts.addAll(cartProduct.products);
    }
    return allProducts;
  }

  // Delete a CartProduct by cartId
  Future<bool> deleteCartProduct(String cartId) async {
    var box = await _box;
    if (box.containsKey(cartId)) {
      await box.delete(cartId);
      return true;
    } else {
      return false;
    }
  }
}
