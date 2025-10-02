

class SearchAddressResponse {
  final List<SearchAddressItem> results;

  SearchAddressResponse({required this.results});

  factory SearchAddressResponse.fromJson(dynamic json) {
    if (json is List) {
      // To‘g‘ridan-to‘g‘ri List kelsa
      return SearchAddressResponse(
        results: json.map((e) => SearchAddressItem.fromJson(e as Map<String, dynamic>)).toList(),
      );
    } else if (json is Map<String, dynamic>) {
      // Agar Map bo‘lsa va ichida results bo‘lsa
      final list = json['results'] as List<dynamic>? ?? [];
      return SearchAddressResponse(
        results: list.map((e) => SearchAddressItem.fromJson(e as Map<String, dynamic>)).toList(),
      );
    } else {
      throw Exception("Invalid JSON format");
    }
  }
}


class SearchAddressItem {
  final String title;
  final String? subtitle;
  final String? distanceText;

  SearchAddressItem({
    required this.title,
    this.subtitle,
    this.distanceText,
  });

  factory SearchAddressItem.fromJson(Map<String, dynamic> json) {
    return SearchAddressItem(
      title: (json['title']?['text'] as String?) ?? '',
      subtitle: (json['subtitle']?['text'] as String?) ?? '',
      distanceText: (json['distance']?['text'] as String?),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subtitle': subtitle,
      'distanceText': distanceText,
    };
  }

  @override
  String toString() {
    return 'SearchAddressItem(title: $title, subtitle: $subtitle, distance: $distanceText)';
  }
}
