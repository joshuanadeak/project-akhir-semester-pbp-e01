class Company {
  Company({required this.nama, required this.stockPrice});

  String nama;
  int stockPrice;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        nama: json["fields"]["name"],
        stockPrice: json["fields"]["price_of_stock"],
      );
}
