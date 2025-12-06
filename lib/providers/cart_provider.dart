import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sampleriverpod/model/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_provider.g.dart';

@riverpod
class CartNotifier extends _$CartNotifier {
  // initial value
  @override
  Set<Product> build() {
    return const {};
  }

  //methods to update the state
  void addProduct(Product product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  void removeProduct(Product product) {
    if (state.contains(product)) {
      state = state.where((p) => p.id != product.id).toSet();
    }
  }
}

//manual
//final CartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(
//  () => CartNotifier(),
//);

final cartTotalProvider = Provider<double>((ref) {
  final cartProducts = ref.watch(cartProvider);

  double total = 0;

  for (Product p in cartProducts) {
    total += p.price;
  }
  return total;
});

// @riverpod
// double cartTotal(ref) {
//   final cartProducts = ref.watch(cartProvider);

//   double total = 0;

//   for (Product p in cartProducts) {
//     total += p.price;
//   }
//   return total;
// }
