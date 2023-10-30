import 'package:artisanaflutterapp/blocs/rating/rating_event.dart';
import 'package:artisanaflutterapp/blocs/rating/rating_state.dart';
import 'package:artisanaflutterapp/models/product.dart';
import 'package:artisanaflutterapp/repository/home_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../repository/auth_repository.dart';
import 'package:bloc/bloc.dart';

class RatingBloc extends Bloc<RatingEvents, RatingState> {
  final HomeRepository _homeRepository;

  @override
  RatingBloc({required homeRepository})
      : _homeRepository = homeRepository,
        super(ProductRatingState()) {
    on<RateProductEvent>(_onRateProductEvent);
    //  on<DisplayRateProductEvent>(_onDisplayRateProductEvent);
  }

  // void _onLoadProductsEvent(
  //   LoadProductEvent event,
  //   Emitter<RatingState> emit,
  // ) {
  //   emit(ProductLoadingState());
  // }

  ///* add rating */
  void _onRateProductEvent(
    RateProductEvent event,
    Emitter<RatingState> emit,
  ) async {
    var d = await _homeRepository.rateProduct(event.product, event.rate);
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setDouble("r", d);
    double? ra = pref.getDouble("r");

    {
      emit(ProductRatedState());
    }
  }

  ///********** Get Rating */
  // void _onDisplayRateProductEvent(
  //   DisplayRateProductEvent event,
  //   Emitter<RatingState> emit,
  // ) async {
  //   try {
  //     print("prebloc");
  //     await _RatingRepository.rateProduct(event.product, event.rate);

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
