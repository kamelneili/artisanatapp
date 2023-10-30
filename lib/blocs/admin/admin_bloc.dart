import 'package:artisanaflutterapp/blocs/admin/admin_event.dart';
import 'package:artisanaflutterapp/blocs/admin/admin_state.dart';
import 'package:artisanaflutterapp/repository/admin_repository.dart';

import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminBloc extends Bloc<AdminEvents, AdminState> {
  final AdminRepository _adminRepository;

  @override
  AdminBloc({required adminRepository})
      : _adminRepository = adminRepository,
        super(StartStatusState()) {
    on<ChangeOrderStatusEvent>(_changeOrderStatusEvent);
  }

  ///*******display Orders */
  void _changeOrderStatusEvent(
    ChangeOrderStatusEvent event,
    Emitter<AdminState> emit,
  ) async {
    print('kamel');
    var data = await _adminRepository.changeOrderStatus(
        status: event.status, order: event.order);
    SharedPreferences pref = await SharedPreferences.getInstance();
    print("datahere:ata");
    var status = pref.setInt('status', data);
    print(status);

    {
      emit(OrderStatusChangedState(data: data));
    }
  }

  ///********* Logout */
  //////*******display Orders */

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
