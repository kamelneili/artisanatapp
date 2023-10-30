import 'package:artisanaflutterapp/blocs/account/account_event.dart';
import 'package:artisanaflutterapp/blocs/account/account_state.dart';
import 'package:artisanaflutterapp/repository/account_repository.dart';

import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountBloc extends Bloc<AccountEvents, AccountState> {
  final AccountRepository _accountRepository;

  @override
  AccountBloc({required accountRepository})
      : _accountRepository = accountRepository,
        super(OrdersLoadingState()) {
    on<LoadOrdersEvent>(_onLoadOrdersEvent);

    //  on<DisplayRateOrderEvent>(_onDisplayRateOrderEvent);
  }

  ///*******display Orders */
  void _onLoadOrdersEvent(
    LoadOrdersEvent event,
    Emitter<AccountState> emit,
  ) async {
    emit(OrdersLoadingState());
    var orders = await _accountRepository.fetchMyOrders();
    SharedPreferences pref = await SharedPreferences.getInstance();

    var type = pref.getString('type')!;

    {
      emit(OrdersLoadedState(orders: orders));
    }
  }

  ///********** Get Rating */
  // void _onDisplayRateProductEvent(
  //   DisplayRateProductEvent event,
  //   Emitter<OrderState> emit,
  // ) async {
  //   try {
  //     print("prebloc");
  //     await _OrderRepository.rateOrder(event.Order, event.rate);

  //     //
  //     double totalRating = 0;
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? userId = prefs.getString('userId');
  //   for (int i = 0; i < event.Order.rating!.length; i++) {
  //     totalRating += event.Order.rating![i].rating;

  //     if (event.Order.rating![i].userId == userId) {
  //       myRating = event.Order.rating![i].rating;
  //       print('myrating:$myRating');
  //     }
  //   }

  //   if (totalRating != 0) {
  //     avgRating = totalRating / widget.Order.rating!.length;
  //   }
  //   return myRating;

  //     //

  //     {
  //       emit(OrderRatedState());
  //     }
  //     print("postbloc");
  //   } catch (_) {
  //     emit(OrderLodingErrorState("auth error"));
  //   }
  // }
}
