import 'package:investops/assets/constants.dart';
import 'package:investops/model/stock_market.dart';
import 'package:investops/page/form.dart';
import 'package:investops/page/login.dart';
import 'package:investops/page/market_detail.dart';
import 'package:investops/page/myporto.dart';
import 'package:flutter/material.dart';
import 'package:investops/page/drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class MyWatchList extends StatefulWidget {
  const MyWatchList({Key? key}) : super(key: key);

  @override
  State<MyWatchList> createState() => MyWatchlist();
}

class MyWatchlist extends State<MyWatchList> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    Future<List<StockMarket>> getStockMarket() async {
      var url = '${siteUrl}/stock/mjson/';
      var response = await request.get(url);
      List<StockMarket> listStockMarket = [];
      for (var d in response) {
        if (d != null) {
          listStockMarket.add(StockMarket.fromJson(d));
        }
      }

      return listStockMarket;
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Watchlist Saham'),
          actions: [
            IconButton(
                tooltip: 'Portofolio',
                onPressed: (() {
                  (request.loggedIn)
                      ? Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyPorto()),
                        )
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                }),
                icon: const Icon(Icons.description_outlined))
          ],
        ),
        drawer: const UniversalDrawer(),
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              height: 40,
              width: double.infinity,
              color: const Color.fromARGB(255, 150, 252, 3),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: const TextSpan(
                        style: TextStyle(
                            color: Colors.black, fontFamily: 'Alexandria'),
                        children: [
                          TextSpan(text: "Analisis "),
                          TextSpan(
                              text: "Watchlist",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: " Investops"),
                        ]),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: const Text(
                "Watchlist merupakan analisis intrinsik value terhadap emiten pilihan yang dilakukan oleh Tim Analis Investops. Analisis di bawah bukan merupakan rekomendasi, nasihat serta ajakan untuk membeli ataupun menjual.",
                style: TextStyle(
                    color: Colors.white,
                    height: 1.5,
                    fontSize: 13,
                    fontFamily: 'Alexandria-Light'),
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                textAlign: TextAlign.start,
              ),
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: InkWell(
                    onTap: () {
                      if (!request.loggedIn) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      }
                    },
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      color: const Color.fromARGB(255, 21, 21, 21),
                      child: Row(children: [
                        Container(
                          color: const Color.fromARGB(255, 150, 252, 3),
                          height: double.infinity,
                          width: 5,
                        ),
                        Expanded(
                          flex: 8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Row(
                                  children: const [
                                    Text(
                                        "Jadi Member Untuk Cek Dampak IHSG Terhadap",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Row(
                                  children: const [
                                    Text("Watchlist Investops",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color.fromARGB(
                                                255, 150, 252, 3)))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Expanded(
                          flex: 1,
                          child: Icon(
                              color: Colors.white, Icons.navigate_next_rounded),
                        ),
                      ]),
                    ),
                  ),
                )),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 25, 15, 15),
              height: 60,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Updated Hari Ini, 09.00 WIB",
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                    InkWell(
                      onTap: () {
                        if (nama == "christophernw") {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyFormPage()),
                          );
                        }
                      },
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: const [
                          Icon(Icons.lock_outline_rounded,
                              size: 12,
                              color: Color.fromARGB(255, 150, 252, 3)),
                          Text(
                            "Update Watchlist",
                            style: TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 150, 252, 3)),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
            Container(
                color: const Color.fromARGB(255, 21, 21, 21),
                height: 30,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 6,
                      child: Container(
                        padding: const EdgeInsets.only(left: 15),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'KODE SAHAM',
                            style: TextStyle(
                                color: Color.fromARGB(255, 171, 171, 171),
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const Flexible(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'PRICE',
                          style: TextStyle(
                              color: Color.fromARGB(255, 171, 171, 171),
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.only(right: 15),
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'RISK',
                            style: TextStyle(
                                color: Color.fromARGB(255, 171, 171, 171),
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Expanded(
              child: FutureBuilder<List<StockMarket>>(
                future: getStockMarket(),
                builder: (context, AsyncSnapshot<List<StockMarket>> snapshot) {
                  if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MarketDetail(
                                        kodeSaham:
                                            snapshot.data![index].kodeSaham,
                                        namaPerusahaan: snapshot
                                            .data![index].namaPerusahaan,
                                        hargaSaham:
                                            snapshot.data![index].hargaSaham,
                                        risk: snapshot.data![index].risk,
                                        pk: snapshot.data![index].pk,
                                      )));
                        },
                        child: SizedBox(
                            height: 60,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  flex: 6,
                                  child: ListTile(
                                    dense: true,
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      backgroundImage: NetworkImage(
                                          "https://www.idx.co.id/Portals/0/StaticData/ListedCompanies/LogoEmiten/${snapshot.data![index].kodeSaham}.jpg"),
                                    ),
                                    title: Text(
                                      snapshot.data![index].kodeSaham,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    subtitle: Text(
                                      snapshot.data![index].namaPerusahaan,
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 171, 171, 171),
                                          fontSize: 10),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      snapshot.data![index].hargaSaham
                                          .toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Container(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        snapshot.data![index].risk,
                                        style: TextStyle(
                                            color:
                                                (snapshot.data![index].risk ==
                                                        "LOW")
                                                    ? const Color.fromARGB(
                                                        255, 150, 252, 3)
                                                    : Colors.red,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ));
  }
}
