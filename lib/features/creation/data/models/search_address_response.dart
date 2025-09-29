//
//
//
// import 'package:json_annotation/json_annotation.dart';
// part "search_address_response.g.dart";
//
// @JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
// class SearchAddressResponse{
//   @JsonKey(name: "suggest_reqid")
//   final String suggestRuqId;
//   final List<YandexAddressModel> results;
//
//   SearchAddressResponse({required this.suggestRuqId, required this.results});
//
//   factory SearchAddressResponse.fromJson(Map<String, dynamic> json) => _$SearchAddressResponseFromJson(json);
// }
//
// @JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
// class YandexAddressModel {
//   final  TitleModel title;
//   final  SubtitleModel subtitle;
//   final List<String> tags;
//   final DistanceModel distance;
//   final AddressModel address;
//   final String uri;
//
//   YandexAddressModel({required this.title, required this.subtitle, required this.tags, required this.distance, required this.address, required this.uri});
//   factory YandexAddressModel.fromJson(Map<String, dynamic> json) => _$YandexAddressModelFromJson(json);
// }
//
// @JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
// class TitleModel{
//   final String text;
//
//   TitleModel({required this.text});
//
//   factory TitleModel.fromJson(Map<String, dynamic> json) => _$TitleModelFromJson(json);
// }
// @JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
// class SubtitleModel{
//   final String text;
//
//   SubtitleModel({required this.text});
//
//   factory SubtitleModel.fromJson(Map<String, dynamic> json) => _$SubtitleModelFromJson(json);
// }
//
// @JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
// class DistanceModel{
//   final double value;
//   final String text;
//
//   DistanceModel({required this.value, required this.text});
//
//   factory DistanceModel.fromJson(Map<String, dynamic> json) => _$DistanceModelFromJson(json);
//
// }
//
// @JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
// class AddressModel {
//   final String formattedAddress;
//   final List<ComponentModel> component;
//
//   AddressModel({required this.formattedAddress, required this.component});
//   factory AddressModel.fromJson(Map<String, dynamic> json) => _$AddressModelFromJson(json);
// }
//
// @JsonSerializable()
// class ComponentModel {
//   final String name;
//   final List<String> kind;
//
//   ComponentModel({required this.name, required this.kind});
//
//   factory ComponentModel.fromJson(Map<String, dynamic> json) => _$ComponentModelFromJson(json);
// }