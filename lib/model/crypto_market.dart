class Company {
  Company({
    required this.name,
    required this.stockPrice,
  });

  String name;
  int stockPrice;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["fields"]["name"],
        stockPrice: json["fields"]["price_of_stock"],
      );
}
