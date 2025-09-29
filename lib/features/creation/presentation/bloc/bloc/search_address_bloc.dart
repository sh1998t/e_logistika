// import 'dart:async';
//
// import 'package:bloc/bloc.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:injectable/injectable.dart';
//
// import '../../../data/models/search_address_request.dart';
// import '../../../data/models/search_address_response.dart';
// import '../../../domain/use_case/search_address_use_case.dart';
//
//
//
// part 'search_address_event.dart';
// part 'search_address_state.dart';
// part 'search_address_bloc.freezed.dart';
// @injectable
// class SearchAddressBloc extends Bloc<SearchAddressEvent, SearchAddressState> {
//   final SearchAddressUseCase _searchAddressUseCase;
//   SearchAddressBloc(this._searchAddressUseCase) : super(const SearchAddressState()) {
//     on<SearchAddressEvent>(_searchAddressHandler);
//   }
//
//   FutureOr<void> _searchAddressHandler(SearchAddressEvent event, Emitter<SearchAddressState> emit) async{
//       emit(state.copyWith(isLoading: true));
//       try{
//         final response = await _searchAddressUseCase.searchAddress(event.query);
//       } on DioException catch(e){
//         emit(state.copyWith(error: e.message, isLoading: false));
//       } catch(e){
//         emit(state.copyWith(error: e.toString(), isLoading: false));
//       }
//   }
// }
