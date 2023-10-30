import 'package:artisanaflutterapp/blocs/category/category_event.dart';
import 'package:artisanaflutterapp/blocs/category/category_state.dart';
import 'package:artisanaflutterapp/blocs/home/home_bloc.dart';
import 'package:artisanaflutterapp/models/product.dart';
import 'package:artisanaflutterapp/repository/home_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../repository/auth_repository.dart';
import 'package:bloc/bloc.dart';

class CategoryBloc extends Bloc<CategoryEvents, CategoryState> {
  final HomeRepository _homeRepository;

  @override
  CategoryBloc({required homeRepository})
      : _homeRepository = homeRepository,
        super(CategoryProductLoadingState()) {
    on<LoadCategoryProductEvent>(_onLoadCategoryProductEvent);
    //  on<DisplayRateProductEvent>(_onDisplayRateProductEvent);
  }
  // void _onLoadProductsEvent(
  //   LoadProductEvent event,
  //   Emitter<CategoryState> emit,
  // ) {
  //   emit(ProductLoadingState());LoadingCategoryProductEvent
  // }

  ///*******display category product */
  void _onLoadCategoryProductEvent(
    LoadCategoryProductEvent event,
    Emitter<CategoryState> emit,
  ) async {
    emit(CategoryProductLoadingState());
    print('prolistbloc');
    var products = await _homeRepository.fetchCategoryProducts(event.category);
    {
      emit(CategoryProductLoadedState(products: products));
    }
  }
}
