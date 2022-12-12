import 'package:flutter/material.dart';
import 'package:investops/page/drawer.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:countup/countup.dart';

class MyMainPage extends StatefulWidget {
  const MyMainPage({super.key});

  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) {
          CookieRequest request = CookieRequest();
          return request;
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'INVESTOPS.',
          theme: ThemeData(
              inputDecorationTheme: const InputDecorationTheme(
                  hintStyle: TextStyle(
                    color: Color.fromARGB(70, 171, 171, 171),
                    fontFamily: 'Alexandria-Light',
                    fontSize: 14,
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(255, 21, 21, 21),
                  suffixIconColor: Color.fromARGB(255, 171, 171, 171),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(70, 171, 171, 171),
                          width: 0.2)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(70, 171, 171, 171),
                          width: 0.2))),
              textTheme: const TextTheme(
                bodyText1: TextStyle(),
                bodyText2: TextStyle(),
              ).apply(
                bodyColor: const Color.fromARGB(255, 150, 252, 3),
                displayColor: const Color.fromARGB(255, 150, 252, 3),
              ),
              fontFamily: 'Alexandria',
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(size: 20, color: Colors.white),
                titleTextStyle: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontFamily: 'Alexandria'),
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                centerTitle: true,
              ),
              scaffoldBackgroundColor: Colors.black,
              // brightness: Brightness.light,
              // primaryColor: Color(0xff5D4524),
              primarySwatch: Colors.lime,
              iconTheme: IconThemeData(color: Colors.white)),
          home: const MyHomePage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  final String title = 'INVESTOPS.';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter != 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            widget.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        drawer: UniversalDrawer(),
        body: Center(
        child: DraggableScrollableSheet(
            initialChildSize: 0.85,
            minChildSize: 0.85,
            maxChildSize: 1,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                  padding: const EdgeInsets.only(top: 1),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 250, 250, 250),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            height: 220,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: const AssetImage(
                                  'assets/images/WorldHunger.jpg'),
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
                                        'Based on World Food Programme, there is'),
                                    Countup(
                                      begin: 0,
                                      end: 0.8,
                                      duration: const Duration(seconds: 3),
                                      separator: ',',
                                      style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.red[600],
                                      ),
                                    ),
                                    const Text(
                                        'Number of people that suffered from hunger'),
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
                                        color: Colors.white,
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
                                        Text('The Story Behind INVESTOPS.',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20))
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
                                                                        'assets/images/donatur.png')))),
                                                    const SizedBox(width: 5),
                                                    const Text(
                                                      'Penyalur',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                content: const Text(
                                                    'Pengguna yang mendaftarkan dirinya sebagai penyalur dapat membuka donasi baru untuk kemudian disalurkan ke orang-orang yang membutuhkan.',
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
                                              color: Colors.white,
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
                                                                  'assets/images/donatur.png')))),
                                              const Text('Penyalur',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700))
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
                                                                        'assets/images/donatur.png')))),
                                                    const SizedBox(width: 5),
                                                    const Text(
                                                      'Donatur',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                content: const Text(
                                                    'Pengguna yang mendaftarkan dirinya sebagai donatur dapat menyumbangkan makanan/uang ke donasi yang dibuka oleh para penyalur.',
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
                                              color: Colors.white,
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
                                                                  'assets/images/penyalur.png')))),
                                              const Text('Donatur',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700))
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
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.yellow[900], // Background color
                            ),
                            onPressed: () {
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const HarapanPage()));
                            },
                            child: const Text('Harapan Demo')),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.yellow[900], // Background color
                            ),
                            onPressed: () {
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const PageOverview()));
                            },
                            child: const Text('Page Overview'))
                      ],
                    ),
                  ));
            }),
      ),
    );
  }
}