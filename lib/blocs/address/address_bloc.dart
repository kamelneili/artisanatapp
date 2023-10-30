import 'package:artisanaflutterapp/blocs/address/address_event.dart';
import 'package:artisanaflutterapp/blocs/address/address_state.dart';
import 'package:artisanaflutterapp/repository/address_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressBloc extends Bloc<AddressEvents, AddressState> {
  final AddressRepository _addressRepository;

  @override
  AddressBloc({required addressRepository})
      : _addressRepository = addressRepository,
        super(ProductLoadingState()) {
    on<SaveUserAddressEvent>(_onsaveUserAddressEvent);
    on<SaveOrderEvent>(_onsaveOrderEvent);
  }

  ///***** save adress */
  void _onsaveUserAddressEvent(
    SaveUserAddressEvent event,
    Emitter<AddressState> emit,
  ) async {
    try {
      print(event.address);
      var d = await _addressRepository.saveUserAddress(event.address);
      print('good');
      {
        emit(UserAddresssavedState(d: d));
      }
    } catch (_) {
      // emit(ProductLodingErrorState("auth error"));
    }
  }

  ///***** save order */
  void _onsaveOrderEvent(
    SaveOrderEvent event,
    Emitter<AddressState> emit,
  ) async {
    try {
      // print("preadressbloc");
      // //print(event.l["0"]);
      // print(event.totalSum);
      // print(event.cart);

      var d = await _addressRepository.placeOrder(
        event.address,
        event.totalSum,
        event.cart,
      );
      {
        emit(OrdersavedState(d: d));
      }
    } catch (_) {
      // emit(ProductLodingErrorState("auth error"));
    }
  }
}
