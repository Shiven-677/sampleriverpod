import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sampleriverpod/model/product.dart';

part 'products_provider.g.dart';

const List<Product> allProducts = [
  Product(
    id: '1',
    title: 'Groovy Shoes',
    price: 800,
    image: 'assets/products/shorts.png',
  ),
  Product(
    id: '2',
    title: 'Karate Kit',
    price: 600,
    image: 'assets/products/karati.png',
  ),
  Product(
    id: '3',
    title: 'Denim Jeans',
    price: 1500,
    image: 'assets/products/jeans.png',
  ),
  Product(
    id: '4',
    title: 'Electric Guitar',
    price: 2200,
    image: 'assets/products/guitar.png',
  ),
  Product(
    id: '5',
    title: 'Red Backpack',
    price: 750,
    image: 'assets/products/backpack.png',
  ),
  Product(
    id: '6',
    title: 'Drum & sticks',
    price: 300,
    image: 'assets/products/drum.png',
  ),
  Product(
    id: '7',
    title: 'Big Suitcase',
    price: 1600,
    image: 'assets/products/suitcase.png',
  ),
  Product(
    id: '8',
    title: 'Roller Skates',
    price: 1200,
    image: 'assets/products/skates.png',
  ),
];

final lessThan1500Provider = Provider((ref) {
  return allProducts.where((p) => p.price < 1500).toList();
});

//generated
@riverpod
List<Product> products(ref) {
  return allProducts;
}

@riverpod
List<Product> productslessThan1500(ref) {
  return allProducts.where((p) => p.price < 1500).toList();
}
