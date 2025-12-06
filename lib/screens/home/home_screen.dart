import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sampleriverpod/providers/cart_provider.dart';
import 'package:sampleriverpod/providers/products_provider.dart';
import 'package:sampleriverpod/shared/cart_icon.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProducts = ref.watch(productsProvider);
    final cartProducts = ref.watch(cartProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Garage Sale Products'),
        actions: const [CartIcon()],
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          itemCount: allProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            return Container(
              color: Colors.blueGrey.withOpacity(0.05),
              padding: EdgeInsets.all(20),

              child: Column(
                children: [
                  const SizedBox(height: 7),
                  //image
                  Image.asset(allProducts[index].image, height: 60, width: 60),

                  //text
                  Text(
                    allProducts[index].title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const Expanded(child: SizedBox()),

                  //price
                  Text("₹${allProducts[index].price}"),

                  //buttons
                  if (cartProducts.contains(allProducts[index]))
                    TextButton(
                      child: Text("Remove"),
                      onPressed: () {
                        ref
                            .read(cartProvider.notifier)
                            .removeProduct(allProducts[index]);
                      },
                    ),

                  if (!cartProducts.contains(allProducts[index]))
                    TextButton(
                      child: Text("Add to cart"),
                      onPressed: () {
                        ref
                            .read(cartProvider.notifier)
                            .addProduct(allProducts[index]);
                      },
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
