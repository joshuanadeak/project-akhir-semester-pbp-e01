import 'package:flutter/material.dart';
import 'package:investops/page/drawer.dart';
import 'package:countup/countup.dart';

class MyMainPage extends StatefulWidget {
  const MyMainPage({super.key});

  final String title = 'INVESTOPS.';

  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              ),
          ),
        ),
        drawer: const UniversalDrawer(),
        body: SingleChildScrollView(
          child: Center(
          child:
            Container(
                    padding: const EdgeInsets.only(top: 1),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                    child:
                     Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              height: 220,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: const AssetImage(
                                    'assets/images/invest.jpg'),
                                fit: BoxFit.fill,
                                colorFilter: ColorFilter.mode(
                                    const Color.fromARGB(255, 201, 200, 200)
                                        .withOpacity(0.6),
                                    BlendMode.dstATop),
                              ))),
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      const Text(
                                          'Berdasarkan statisik OJK, terdapat', 
                                          style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Alexandria')),
                                      Countup(
                                        begin: 0,
                                        end: 7190000,
                                        duration: const Duration(seconds: 3),
                                        separator: ',',
                                        style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.red[600],
                                        ),
                                      ),
                                      const Text(
                                          'Investor di Indonesia dari seluruh penduduk',
                                          style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Alexandria')),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () => {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return const AlertDialog(
                                            title: Text(
                                              'The Story Behind INVESTOPS.',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            content: Text(
                                              'Modern economy is one of the most complex structure in human civilization, that have been formed from the early days of the humans until the era of digital technology. It puts everybody, you and me included, in the structure of supply and demand. And because of this, the will of people to "bond" with it, by investing for instance, have been higher than ever. That is why we need a system that can provide reliable and accurate information about trading and investment. our target is that trading and investment can be accessed by everyone, from corporates to even a person that has never heard about it. That is why we created this app, that can provide all the main needs for trading and investment. This includes, learning about investing in stocks and crypto, understanding about companies and corporate, trivia to understand investing, and also a suggestion box for any new ideas.',
                                              style: TextStyle(fontSize: 12),
                                              textAlign: TextAlign.justify,
                                            ),
                                          );
                                        },
                                      )
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 120.0,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(255, 150, 252, 3),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.5),
                                              spreadRadius: 1,
                                              blurRadius: 3,
                                              offset: const Offset(0, 2),
                                            )
                                          ],
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(20))),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text('The Story Behind ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                  fontFamily: 'Alexandria')),
                                          Text('INVESTOPS.',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  color: Colors.red,
                                                  fontFamily: 'Alexandria'))
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () => {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                          width: 25.0,
                                                          height: 25.0,
                                                          decoration:
                                                              const BoxDecoration(
                                                                  //shape: BoxShape.circle,
                                                                  image: DecorationImage(
                                                                      fit: BoxFit
                                                                          .fill,
                                                                      image: AssetImage(
                                                                          'assets/images/stock.png')))),
                                                      const SizedBox(width: 5),
                                                      const Text(
                                                        'Saham',
                                                        style: TextStyle(
                                                          fontWeight:FontWeight.w700,
        
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  content: const Text(
                                                      'Saham dapat diartikan sebagai tanda penyertaan modal seseorang atau pihak (badan usaha) pada suatu perusahaan atau Perseroan Terbatas.',
                                                      style:
                                                          TextStyle(fontSize: 12),
                                                      textAlign:
                                                          TextAlign.justify),
                                                );
                                              },
                                            )
                                          },
                                          child: Container(
                                            height: 120.0,
                                            decoration: BoxDecoration(
                                                color: const Color.fromARGB(255, 150, 252, 3),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    spreadRadius: 1,
                                                    blurRadius: 3,
                                                    offset: const Offset(0, 2),
                                                  )
                                                ],
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(20))),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    decoration:
                                                        const BoxDecoration(
                                                            //shape: BoxShape.circle,
                                                            image: DecorationImage(
                                                                fit: BoxFit.fill,
                                                                image: AssetImage(
                                                                    'assets/images/stock.png')))),
                                                const Text('Saham',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w700,
                                                        color: Colors.black,
                                                        fontFamily: 'Alexandria'))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: () => {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                          width: 25.0,
                                                          height: 25.0,
                                                          decoration:
                                                              const BoxDecoration(
                                                                  //shape: BoxShape.circle,
                                                                  image: DecorationImage(
                                                                      fit: BoxFit
                                                                          .fill,
                                                                      image: AssetImage(
                                                                          'assets/images/crypto.png')))),
                                                      const SizedBox(width: 5),
                                                      const Text(
                                                        'Kripto',
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w700,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  content: const Text(
                                                      'Kripto adalah aset digital yang dirancang untuk bekerja sebagai media pertukaran menggunakan kriptografi yang kuat untuk mengamankan transaksi keuangan, mengontrol penciptaan unit tambahan, dan memverifikasi transfer aset.',
                                                      style:
                                                          TextStyle(fontSize: 12),
                                                      textAlign:
                                                          TextAlign.justify),
                                                );
                                              },
                                            )
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,
                                            height: 120.0,
                                            decoration: BoxDecoration(
                                                color: const Color.fromARGB(255, 150, 252, 3),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    spreadRadius: 1,
                                                    blurRadius: 3,
                                                    offset: const Offset(0, 2),
                                                  )
                                                ],
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(20))),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    decoration:
                                                        const BoxDecoration(
                                                            //shape: BoxShape.circle,
                                                            image: DecorationImage(
                                                                fit: BoxFit.fill,
                                                                image: AssetImage(
                                                                    'assets/images/crypto.png')))),
                                                const Text('Kripto',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w700,
                                                        color: Colors.black,
                                                        fontFamily: 'Alexandria'))
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
              ),
        ),
    );
  }
}