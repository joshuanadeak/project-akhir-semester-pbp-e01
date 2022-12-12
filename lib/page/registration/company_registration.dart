import 'package:investops/assets/constants.dart';
import 'package:investops/page/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:investops/page/drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class CompanyRegistrationPage extends StatefulWidget {
  const CompanyRegistrationPage({Key? key}) : super(key: key);

  @override
  State<CompanyRegistrationPage> createState() =>
      _CompanyRegistrationPageState();
}

class _CompanyRegistrationPageState extends State<CompanyRegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  String nameVal = "";
  int stockPriceVal = 0;

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
                MaterialPageRoute(builder: (context) => const MyMainPage()),
              );
            },
          ),
          title: const Text('Registrasi Perusahaan'),
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
                            hintText: 'Nama Perusahaan',
                            border: OutlineInputBorder()),
                        onSaved: (String? value) {
                          setState(() {
                            nameVal = value!;
                          });
                        },
                        onChanged: (String? value) {
                          setState(() {
                            nameVal = value!;
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
                            stockPriceVal = int.parse(value!);
                          });
                        },
                        onChanged: (String? value) {
                          setState(() {
                            stockPriceVal = int.parse(value!);
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Harga Saham tidak boleh kosong";
                          } else if (int.tryParse(value) == null) {
                            return "Harga Saham berupa angka";
                          } else if (int.tryParse(value)! < 0) {
                            return "Harga Saham berupa angka positif";
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
                    print("DEBUGGG");
                        await request.post("$siteUrl/registration", {
                      'name': nameVal,
                      'price_of_stock': '$stockPriceVal',
                    }).then((value){
                      _formKey.currentState!.reset();

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyMainPage()),
                      );
                    });
                    
                  }
                },
                child: const Text(
                  "Registrasi perusahaan anda",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ));
  }
}
