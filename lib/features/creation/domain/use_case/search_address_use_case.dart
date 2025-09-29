//
//
// import 'package:injectable/injectable.dart';
//
// import '../../data/models/search_address_request.dart';
// import '../../data/models/search_address_response.dart';
// import '../repository/search_address.dart';
// @singleton
// class SearchAddressUseCase {
//   final SearchAddressRepository _repository;
//   SearchAddressUseCase(this._repository);
//
//   Future<SearchAddressResponse> searchAddress(SearchAddressRequest query) async => await _repository.searchAddress(query);
// }