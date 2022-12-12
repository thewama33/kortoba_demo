import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../core/debug_prints.dart';
import '../../models/ProductsModel/products_model.dart';
import '../../repos/home_repo.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  HomeRepo? homeRepo = HomeRepo();
  ProductsResponse? productsModel;

  ProductsBloc() : super(ProductsInitial()) {
    on<ProductsEvent>((event, emit) async {
      // TODO: implement event handler
      print("Getting Products");
      try {
        productsModel = await homeRepo?.getProducts();
        if (productsModel != null) {
          emit(ProductsSuccessState());
        }
      } on DioError catch (error) {
        printError(error);
        emit(ProductsFailureState());
      }
    });
  }
}
