class CryptoPorto {
  CryptoPorto({
    required this.kodeCrypto,
    required this.namaCrypto,
    required this.hargaCrypto,
    required this.risk,
    required this.pk,
  });

  String kodeCrypto;
  String namaCrypto;
  int hargaCrypto;
  String risk;
  int pk;

  factory CryptoPorto.fromJson(Map<String, dynamic> json) => CryptoPorto(
    kodeCrypto: json["fields"]["kode_crypto"],
    namaCrypto: json["fields"]["nama_crypto"],
    hargaCrypto: json["fields"]["harga_crypto"],
    risk: json["fields"]["risk"],
    pk: json["pk"],
  );
}