class SearchAddressRequest {
  final String text;
  final String lang;
  final String coords;

  SearchAddressRequest({
    required this.text,
    this.lang = "uz_UZ",
    this.coords = "69.2401,41.2995",
  });

  Map<String, dynamic> toJson() => {
    "text": text,
    "lang": lang,
    "ll": coords,
  };
}
