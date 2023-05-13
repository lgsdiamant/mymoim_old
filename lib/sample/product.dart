import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product.g.dart';

class Product {
  Product({required this.name, required this.price, required this.origin});

  final String name;
  final double price;
  final String origin;
}

final _products = [
  Product(name: "Spagetti", price: 10, origin: "Italy"),
  Product(name: "Indomie", price: 6, origin: "South Korea"),
  Product(name: "Fried Yam", price: 9, origin: "Pakistan"),
  Product(name: "Beans", price: 10, origin: "Australia"),
  Product(name: "Red Chicken feet", price: 2, origin: "China"),
  Product(name: "Potato", price: 7, origin: "America"),
];

enum ProductSortType {
  name,
  price,
  origin,
}

//This is the default sort type when the app is run
// final sortTypeProvider = StateProvider<ProductSortType>((ref) => ProductSortType.name);
@riverpod
class SortType extends _$SortType {
  /// Classes annotated by `@riverpod` **must** define a [build] function.
  /// This function is expected to return the initial state of your shared state.
  /// It is totally acceptable for this function to return a [Future] or [Stream] if you need to.
  /// You can also freely define parameters on this method.
  @override
  ProductSortType build() => ProductSortType.name;
}

@riverpod
Future<List<Product>> futureProducts(FutureProductsRef ref) async {
  await Future.delayed(const Duration(seconds: 1));

  final sortType = ref.read(sortTypeProvider);

  switch (sortType) {
    case ProductSortType.name:
      _products.sort((a, b) => a.name.compareTo(b.name));
      break;
    case ProductSortType.price:
      _products.sort((a, b) => a.price.compareTo(b.price));
      break;
    case ProductSortType.origin:
      _products.sort((a, b) => a.origin.compareTo(b.origin));
      break;
  }
  return _products;
}

// final futureProductsProvider = FutureProvider<List<Product>>((ref) async {
//   await Future.delayed(const Duration(seconds: 1));
//
//   final sortType = ref.read(sortTypeProvider);
//
//   switch (sortType) {
//     case ProductSortType.name:
//       _products.sort((a, b) => a.name.compareTo(b.name));
//       break;
//     case ProductSortType.price:
//       _products.sort((a, b) => a.price.compareTo(b.price));
//       break;
//     case ProductSortType.origin:
//       _products.sort((a, b) => a.origin.compareTo(b.origin));
//       break;
//   }
//   return _products;
// });

class ProductPage extends ConsumerWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Future Provider Example"),
          actions: const [DropdownProductSort()],
        ),
        backgroundColor: Colors.lightBlue,
        body: const ProductContainer());
  }
}

class DropdownProductSort extends ConsumerWidget {
  const DropdownProductSort({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    return DropdownButton<ProductSortType>(
        dropdownColor: Colors.brown,
        value: ref.watch(sortTypeProvider),
        icon: const Icon(Icons.arrow_downward),
        items: const [
          DropdownMenuItem(
            value: ProductSortType.name,
            child: Icon(Icons.sort_by_alpha),
          ),
          DropdownMenuItem(
            value: ProductSortType.price,
            child: Icon(Icons.sort),
          ),
          DropdownMenuItem(
            value: ProductSortType.origin,
            child: Icon(Icons.flag),
          ),
        ],
        onChanged: (value) => ref.watch(sortTypeProvider.notifier).state = value!);
  }
}

class ProductContainer extends ConsumerWidget {
  const ProductContainer({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final productOutcome = ref.watch(futureProductsProvider);
    return Container(
      child: productOutcome.when(
        data: (products) => ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Card(
                  color: Colors.blueAccent,
                  elevation: 3,
                  child: ListTile(
                    title: Text("${products[index].name}-${products[index].origin}",
                        style: const TextStyle(color: Colors.white, fontSize: 15)),
                    subtitle: Text("${products[index].price}-${products[index].origin}",
                        style: const TextStyle(color: Colors.white, fontSize: 15)),
                  ),
                ),
              );
            }),
        error: (err, stack) => Text("Error: $err", style: const TextStyle(color: Colors.white, fontSize: 15)),
        loading: () => const Center(child: CircularProgressIndicator(color: Colors.white)),
      ),
    );
  }
}
