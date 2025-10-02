import '../../data/models/search_address_response.dart';

abstract class SearchAddressState {
}

class SearchAddressInitial extends SearchAddressState {}

class SearchAddressLoading extends SearchAddressState {}

class SearchAddressSuccess extends SearchAddressState {
  final List<SearchAddressItem> results;
  SearchAddressSuccess(this.results);
}

class SearchAddressFailure extends SearchAddressState {
  final String message;
  SearchAddressFailure(this.message);
}
