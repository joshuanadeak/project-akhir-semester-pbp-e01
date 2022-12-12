import 'package:investops/assets/constants.dart';
import 'package:investops/page/login.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  void togglePasswordView() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  String _username = "";
  String _password = "";

  List<String> listJenis = ['Pemasukan', 'Pengeluaran'];
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
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
          title: const Text('Daftar Akun'),
        ),
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100,
            ),
            Container(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                child: const Text(
                  'INVESTOPS.',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )),
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
                            hintText: 'Username', border: OutlineInputBorder()),
                        onSaved: (String? value) {
                          setState(() {
                            _username = value!;
                          });
                        },
                        onChanged: (String? value) {
                          setState(() {
                            _username = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Username tidak boleh kosong";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        obscureText: !isPasswordVisible,
                        cursorColor: const Color.fromARGB(255, 5, 110, 86),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'Alexandria-Light'),
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'Password',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              togglePasswordView();
                            },
                            child: Icon(isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                        ),
                        onSaved: (String? value) {
                          setState(() {
                            _password = value!;
                          });
                        },
                        onChanged: (String? value) {
                          setState(() {
                            _password = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Password tidak boleh kosong";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 150, 252, 3),
                  foregroundColor: Colors.black,
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final response = await request
                        .post("${siteUrl}/authenticate/register/", {
                      'username': _username,
                      'password1': _password,
                      'password2': _password,
                    });
                    if (response['status'] == true) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              backgroundColor:
                                  const Color.fromARGB(255, 21, 21, 21),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 10,
                              child: Container(
                                child: ListView(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    shrinkWrap: true,
                                    children: <Widget>[
                                      const Center(
                                          child: Text(
                                        'Username atau Password tidak valid',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      )),
                                      const SizedBox(height: 20),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          'Coba Lagi',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 150, 252, 3),
                                              fontSize: 12),
                                        ),
                                      )
                                    ]),
                              ),
                            );
                          });
                    }
                  }
                },
                child: const Text(
                  "Daftar",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
              child: const Text(
                'Dengan mendaftar kamu menyetujui Syarat dan Ketentuan, Privacy Policy, dan Disclaimer.',
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Alexandria',
                    color: Color.fromARGB(255, 171, 171, 171)),
              ),
            ),
          ],
        ));
  }
}
