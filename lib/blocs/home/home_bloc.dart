import 'package:artisanaflutterapp/blocs/home/home_event.dart';
import 'package:artisanaflutterapp/blocs/home/home_state.dart';
import 'package:artisanaflutterapp/models/product.dart';
import 'package:artisanaflutterapp/repository/home_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../repository/auth_repository.dart';
import 'package:bloc/bloc.dart';

class HomeBloc extends Bloc<HomeEvents, HomeState> {
  final HomeRepository _homeRepository;

  @override
  HomeBloc({required homeRepository})
      : _homeRepository = homeRepository,
        super(ProductLoadingState()) {
    on<LoadProductEvent>(_onLoadProductEvent);

    on<RateProductEvent>(_onRateProductEvent);
    //  on<DisplayRateProductEvent>(_onDisplayRateProductEvent);
  }

  // void _onLoadProductsEvent(
  //   LoadProductEvent event,
  //   Emitter<HomeState> emit,
  // ) {
  //   emit(ProductLoadingState());
  // }

  ///*******display product */
  void _onLoadProductEvent(
    LoadProductEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(ProductLoadingState());
    try {
      var products = await _homeRepository.fetchDealOfDay();

      {
        emit(ProductLoadedState(products: products));
      }
    } catch (_) {
      emit(ProductLodingErrorState("auth error"));
    }
  }

  ///***** add rating */
  void _onRateProductEvent(
    RateProductEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      await _homeRepository.rateProduct(event.product, event.rate);
      {
        emit(ProductRatedState());
      }
    } catch (_) {
      emit(ProductLodingErrorState("auth error"));
    }
  }

  ///********** Get Rating */
  // void _onDisplayRateProductEvent(
  //   DisplayRateProductEvent event,
  //   Emitter<HomeState> emit,
  // ) async {
  //   try {
  //     print("prebloc");
  //     await _homeRepository.rateProduct(event.product, event.rate);

  //     //
  //     double totalRating = 0;
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? userId = prefs.getString('userId');
  //   for (int i = 0; i < event.product.rating!.length; i++) {
  //     totalRating += event.product.rating![i].rating;

  //     if (event.product.rating![i].userId == userId) {
  //       myRating = event.product.rating![i].rating;
  //       print('myrating:$myRating');
  //     }
  //   }

  //   if (totalRating != 0) {
  //     avgRating = totalRating / widget.product.rating!.length;
  //   }
  //   return myRating;

  //     //

  //     {
  //       emit(ProductRatedState());
  //     }
  //     print("postbloc");
  //   } catch (_) {
  //     emit(ProductLodingErrorState("auth error"));
  //   }
  // }
}
