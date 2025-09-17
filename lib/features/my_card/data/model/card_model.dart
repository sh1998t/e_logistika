class CreditCard {
  final String cardHolderFullName;
  final String cardNumber;
  final String validFrom;
  final String url;
  final String logoUrl;
  final String ccv;

  CreditCard({
    required this.cardHolderFullName,
    required this.cardNumber,
    required this.validFrom,
    required this.url,
    required this.logoUrl,
    required this.ccv,
  });

  Map<String, dynamic> toJson() {
    return {
      'cardHolderFullName': cardHolderFullName,
      'cardNumber': cardNumber,
      'validFrom': validFrom,
      'url': url,
      'logoUrl': logoUrl,
      'ccv': ccv,
    };
  }

  factory CreditCard.fromJson(Map<String, dynamic> json) {
    return CreditCard(
      cardHolderFullName: json['cardHolderFullName'],
      cardNumber: json['cardNumber'],
      validFrom: json['validFrom'],
      url: json['url'],
      logoUrl: json['logoUrl'],
      ccv: json['ccv'],
    );
  }
}
