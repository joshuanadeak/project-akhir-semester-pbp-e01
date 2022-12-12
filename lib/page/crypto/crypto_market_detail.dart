// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:investops/assets/constants.dart';
import 'package:investops/page/login.dart';
import 'package:investops/page/crypto/crypto_watchlist.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class CryptoMarketDetail extends StatelessWidget {

  const CryptoMarketDetail({
    Key? key,
    required this.kodeCrypto,
    required this.namaCrypto,
    required this.hargaCrypto,
    required this.risk,
    required this.pk,
  }) : super(key: key);

  final String kodeCrypto;
  final String namaCrypto;
  final int hargaCrypto;
  final String risk;
  final int pk;

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
          title: const Text('Detail Watchlist'),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 8,
              child: Column(
                children: [
                  Container(
                    color: const Color.fromARGB(255, 21, 21, 21),
                    width: double.infinity,
                    height: 100,
                    child: Center(
                      child: ListTile(
                        dense: true,
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(
                              "https://images.reku.id/accounts/${kodeCrypto.toLowerCase()}.png"),
                        ),
                        title: Text(
                          kodeCrypto,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          namaCrypto,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 172, 171, 171),
                              fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.all(15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: InkWell(
                          onTap: () => {},
                          child: Container(
                            height: 60,
                            width: double.infinity,
                            color: const Color.fromARGB(255, 35, 35, 35),
                            child: Row(children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Current',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 172, 171, 171),
                                              fontSize: 10,
                                            ),
                                          ),
                                          Text(
                                            '$hargaCrypto',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          )
                                        ],
                                      ))),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Consensus Terget',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 172, 171, 171),
                                              fontSize: 10,
                                            ),
                                          ),
                                          Text(
                                            '${hargaCrypto + 275}',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          )
                                        ],
                                      ))),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Risk',
                                            style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 172, 171, 171),
                                              fontSize: 10,
                                            ),
                                          ),
                                          (risk == 'LOW')
                                              ? Text(risk,
                                                  style: const TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 150, 252, 3),
                                                      fontSize: 14))
                                              : Text(
                                                  risk,
                                                  style: const TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 14),
                                                )
                                        ],
                                      ))),
                            ]),
                          ),
                        ),
                      )),
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: const Text.rich(TextSpan(children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.warning_rounded,
                          color: Colors.red,
                          size: 16,
                        ),
                      ),
                      TextSpan(
                          text: " Disclaimer",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              height: 1.5,
                              fontSize: 13,
                              fontFamily: 'Alexandria')),
                      TextSpan(
                          text:
                              ", keputusan investasi ditanggung oleh masing-masing pengguna. Investops tidak bertanggung jawab untuk segala keputusan investasi individual.",
                          style: TextStyle(
                              color: Colors.white,
                              height: 1.5,
                              fontSize: 13,
                              fontFamily: 'Alexandria')),
                    ])),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              // flex: 2,
              child: Container(
                // color: Colors.blue,
                margin: const EdgeInsets.all(15),
                height: 35,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(8),
                    backgroundColor: const Color.fromARGB(255, 150, 252, 3),
                    foregroundColor: Colors.black,
                  ),
                  onPressed: () async {
                    if (!request.loggedIn) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    } else {
                      await request
                          .post("${siteUrl}/crypto/delete_market/${pk}", {});
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
                              child: ListView(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20),
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    const Center(
                                        child: Text(
                                      'Pembelian Berhasil',
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    )),
                                    const SizedBox(height: 20),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const MyCryptoWatchList()),
                                        );
                                      },
                                      child: const Text(
                                        'Kembali ke Watchlist',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 150, 252, 3),
                                            fontSize: 12),
                                      ),
                                    )
                                  ]),
                            );
                          });
                    }
                  },
                  child: const Text(
                    "Beli Crypto",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
