// import 'package:dio/dio.dart';
//
// import '../models/search_address_request.dart';
// import '../models/search_address_response.dart';
//
// class SearchAddressDataSource {
//   final Dio _dio = Dio();
//
//   Future<SearchAddressResponse> searchAddress(SearchAddressRequest query) async {
//     final Response response = await _dio.get(
//       "https://suggest-maps.yandex.ru/v1/suggest?apikey=8ce127bc-9ece-4ed1-bc10-c520ea39f56f",
//       queryParameters: query.toJson(),
//     );
//
//     return SearchAddressResponse.fromJson(response.data);
//
//     print(response.data);
//   }
// }
