// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$futureProductsHash() => r'5a5b40325e7170d7bf9b2472dad2817703589c4f';

/// See also [futureProducts].
@ProviderFor(futureProducts)
final futureProductsProvider =
    AutoDisposeFutureProvider<List<Product>>.internal(
  futureProducts,
  name: r'futureProductsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$futureProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FutureProductsRef = AutoDisposeFutureProviderRef<List<Product>>;
String _$sortTypeHash() => r'0413628e7a64c11527a004b7e75a4442ee7a7020';

/// See also [SortType].
@ProviderFor(SortType)
final sortTypeProvider =
    AutoDisposeNotifierProvider<SortType, ProductSortType>.internal(
  SortType.new,
  name: r'sortTypeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$sortTypeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SortType = AutoDisposeNotifier<ProductSortType>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
