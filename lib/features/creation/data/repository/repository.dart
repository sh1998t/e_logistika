//
//
// import 'package:injectable/injectable.dart';
//
// import '../../domain/repository/search_address.dart';
// import '../data_source/search_address_data_source.dart';
// import '../models/search_address_request.dart';
// import '../models/search_address_response.dart';
// @Singleton(as: SearchAddressRepository)
// class SearchRepositoryImpl extends SearchAddressRepository{
//   final SearchAddressDataSource _dataSource;
//
//   SearchRepositoryImpl(this._dataSource);
//   @override
//   Future<SearchAddressResponse> searchAddress(SearchAddressRequest query) async => await _dataSource.searchAddress(query);
//
// }