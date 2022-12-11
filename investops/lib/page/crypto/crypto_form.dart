import 'package:investops/assets/constants.dart';
import 'package:investops/page/crypto/crypto_watchlist.dart';
import 'package:flutter/material.dart';
import 'package:investops/page/drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class MyCryptoFormPage extends StatefulWidget {
  const MyCryptoFormPage({Key? key}) : super(key: key);

  @override
  State<MyCryptoFormPage> createState() => _MyCryptoFormPageState();
}

class _MyCryptoFormPageState extends State<MyCryptoFormPage> {
  final _formKey = GlobalKey<FormState>();

  String kodeCrypto = "";
  String namaCrypto = "";
  int hargaCrypto = 0;
  String risk = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            color: Colors.white,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyCryptoWatchList()),
              );
            },
          ),
          title: const Text('Tambah Crypto'),
        ),
        drawer: const UniversalDrawer(),
        backgroundColor: Colors.black,
        body: Column(
          children: [
            //
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      TextFormField(
                        cursorColor: const Color.fromARGB(255, 5, 110, 86),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Alexandria-Light'),
                        decoration: const InputDecoration(
                            hintText: 'Kode Crypto',
                            border: OutlineInputBorder()),
                        onSaved: (String? value) {
                          setState(() {
                            kodeCrypto = value!;
                          });
                        },
                        onChanged: (String? value) {
                          setState(() {
                            kodeCrypto = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Kode Crypto tidak boleh kosong";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        cursorColor: const Color.fromARGB(255, 5, 110, 86),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Alexandria-Light'),
                        decoration: const InputDecoration(
                            hintText: 'Nama Perusahaan',
                            border: OutlineInputBorder()),
                        onSaved: (String? value) {
                          setState(() {
                            namaCrypto = value!;
                          });
                        },
                        onChanged: (String? value) {
                          setState(() {
                            namaCrypto = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Nama Crypto tidak boleh kosong";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        cursorColor: const Color.fromARGB(255, 5, 110, 86),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Alexandria-Light'),
                        decoration: const InputDecoration(
                            hintText: 'Harga Crypto',
                            border: OutlineInputBorder()),
                        onSaved: (String? value) {
                          setState(() {
                            hargaCrypto = int.parse(value!);
                          });
                        },
                        onChanged: (String? value) {
                          setState(() {
                            hargaCrypto = int.parse(value!);
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Harga Crypto tidak boleh kosong";
                          } else if (int.tryParse(value) == null) {
                            return "Harga Crypto berupa angka";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        cursorColor: const Color.fromARGB(255, 5, 110, 86),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Alexandria-Light'),
                        decoration: const InputDecoration(
                            hintText: 'Risk', border: OutlineInputBorder()),
                        onSaved: (String? value) {
                          setState(() {
                            risk = value!;
                          });
                        },
                        onChanged: (String? value) {
                          setState(() {
                            risk = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Risk tidak boleh kosong";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 30, 15, 15),
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 150, 252, 3),
                  foregroundColor: Colors.black,
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final response =
                        await request.post("${siteUrl}/crypto/add/", {
                      'kode_crypto': kodeCrypto,
                      'nama_crypto': namaCrypto,
                      'harga_crypto': '$hargaCrypto',
                      'risk': risk,
                    });
                    _formKey.currentState!.reset();

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyCryptoWatchList()),
                    );
                  }
                },
                child: const Text(
                  "Tambahkan Crypto",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ));
  }
}
