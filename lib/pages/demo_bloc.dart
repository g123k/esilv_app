// Events
import 'package:esilv_dart/model/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ProductBlocEvent {}

class _LoadProductEvent extends ProductBlocEvent {}

// Bloc
class ProductBloc extends Bloc<ProductBlocEvent, ProductBlocState> {
  /// Valeur initiale
  ProductBloc() : super(ProductBlocState.init()) {
    on<_LoadProductEvent>(_loadProduct);
    add(_LoadProductEvent());
  }

  Future<void> _loadProduct(
    ProductBlocEvent event,
    Emitter<ProductBlocState> emit,
  ) async {
    await Future.delayed(Duration(seconds: 2));
    emit(ProductBlocState(generateProduct()));
  }
}

// States
class ProductBlocState {
  final Product? product;

  ProductBlocState.init() : product = null;

  ProductBlocState(this.product);
}
