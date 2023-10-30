import 'package:artisanaflutterapp/blocs/search/search_event.dart';
import 'package:artisanaflutterapp/blocs/search/search_state.dart';
import 'package:artisanaflutterapp/repository/search_repository.dart';
import 'package:bloc/bloc.dart';

class SearchBloc extends Bloc<SearchEvents, SearchState> {
  final SearchRepository _searchRepository;

  @override
  SearchBloc({required searchRepository})
      : _searchRepository = searchRepository,
        super(ProductLoadingState()) {
    on<SearchProductEvent>(_onSearchProductEvent);
  }

  ///*******search product */
  void _onSearchProductEvent(
    SearchProductEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(ProductLoadingState());
    try {
      var products = await _searchRepository.fetchSearchedProduct(event.query);

      {
        emit(ProductSearchedState(products: products));
      }
    } catch (_) {
      emit(ProductLodingErrorState("auth error"));
    }
  }
}
