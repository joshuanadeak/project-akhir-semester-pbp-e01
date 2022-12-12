class StockPorto {
  StockPorto({
    required this.kodeSaham,
    required this.namaPerusahaan,
    required this.hargaSaham,
    required this.risk,
    required this.pk,
  });

  String kodeSaham;
  String namaPerusahaan;
  int hargaSaham;
  String risk;
  int pk;

  factory StockPorto.fromJson(Map<String, dynamic> json) => StockPorto(
        kodeSaham: json["fields"]["kode_saham"],
        namaPerusahaan: json["fields"]["nama_perusahaan"],
        hargaSaham: json["fields"]["harga_saham"],
        risk: json["fields"]["risk"],
        pk: json["pk"],
      );
}
