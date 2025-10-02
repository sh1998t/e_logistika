import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/data_source/search_address_data_source.dart';
import '../../data/models/search_address_request.dart';
import '../../data/models/search_address_response.dart';
import 'search_address_state.dart';

class SearchAddressCubit extends Cubit<SearchAddressState> {
  final SearchAddressDataSource dataSource;
  Timer? _debounce;

  SearchAddressCubit(this.dataSource) : super(SearchAddressInitial());

  Future<void> search(String raw) async {
    final query = raw.trim();
    _debounce?.cancel();

    if (query.isEmpty) {
      emit(SearchAddressInitial());
      return;
    }

    // 350 ms debounce
    _debounce = Timer(const Duration(milliseconds: 350), () async {
      emit(SearchAddressLoading());
      try {
        final resp = await dataSource.searchAddress(SearchAddressRequest(text: query));
        // print("resp.results == ${resp.results}");
        emit(SearchAddressSuccess(resp.results));
      } catch (e) {
        emit(SearchAddressFailure(e.toString()));
      }
    });
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}
