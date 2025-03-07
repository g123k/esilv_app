import 'package:esilv_dart/api/openfoodfacts_api.dart';
import 'package:esilv_dart/model/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class ProductBlocEvent {}

class _LoadProductEvent extends ProductBlocEvent {}

// Bloc
class ProductBloc extends Bloc<ProductBlocEvent, ProductBlocState> {
  // super = Valeur initiale
  ProductBloc() : super(ProductBlocState.init()) {
    on<_LoadProductEvent>(_loadProduct);
    // Dès que le BLoC est inséré, on veut faire la requête
    add(_LoadProductEvent());
  }

  Future<void> _loadProduct(
    ProductBlocEvent event,
    Emitter<ProductBlocState> emit,
  ) async {
    var product = await OpenFoodFactsAPIManager().loadProduct('5000159484695');
    emit(ProductBlocState(product.response.toProduct()));
  }
}

// States
class ProductBlocState {
  final Product? product;

  ProductBlocState.init() : product = null;

  ProductBlocState(this.product);
}
