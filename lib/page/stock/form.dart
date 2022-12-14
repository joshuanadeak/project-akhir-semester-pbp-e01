import 'package:investops/assets/constants.dart';
import 'package:investops/page/stock/mywatchlist.dart';
import 'package:flutter/material.dart';
import 'package:investops/page/drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({Key? key}) : super(key: key);

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();

  String kodeSaham = "";
  String namaPerusahaan = "";
  int hargaSaham = 0;
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
                MaterialPageRoute(builder: (context) => const MyWatchList()),
              );
            },
          ),
          title: const Text('Tambah Saham'),
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
                            hintText: 'Kode Saham',
                            border: OutlineInputBorder()),
                        onSaved: (String? value) {
                          setState(() {
                            kodeSaham = value!;
                          });
                        },
                        onChanged: (String? value) {
                          setState(() {
                            kodeSaham = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Kode Saham tidak boleh kosong";
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
                            namaPerusahaan = value!;
                          });
                        },
                        onChanged: (String? value) {
                          setState(() {
                            namaPerusahaan = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Nama Perusahaan tidak boleh kosong";
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
                            hintText: 'Harga Saham',
                            border: OutlineInputBorder()),
                        onSaved: (String? value) {
                          setState(() {
                            hargaSaham = int.parse(value!);
                          });
                        },
                        onChanged: (String? value) {
                          setState(() {
                            hargaSaham = int.parse(value!);
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Harga Saham tidak boleh kosong";
                          } else if (int.tryParse(value) == null) {
                            return "Harga Saham berupa angka";
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
                    
                        await request.post("$siteUrl/stock/add/", {
                      'kode_saham': kodeSaham,
                      'nama_perusahaan': namaPerusahaan,
                      'harga_saham': '$hargaSaham',
                      'risk': risk,
                    }).then((value){

                    _formKey.currentState!.reset();

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyWatchList()),
                    );
                    });
                  }
                },
                child: const Text(
                  "Tambahkan Saham",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ));
  }
}
