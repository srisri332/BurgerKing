import 'package:burger_king/fakedatabase/db.dart';
import 'package:burger_king/model/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List db;
  FakeDB dB = FakeDB();
  int totalAmt;

  fetchAmount() {
    setState(() {
      totalAmt = dB.totalAmount;
    });
  }

  @override
  void initState() {
    setState(() {
      dB.fetchKS();
      db = dB.db;
      totalAmt = dB.totalAmount;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // print(width);
    // print(height);
    // print(db);
    print("total amount - $totalAmt");
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
            top: width / 10, right: width / 30, left: width / 30),
        child: Column(
          children: [
            AppBar(),
            Container(
              margin: EdgeInsets.only(top: width / 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: FlatButton(
                        onPressed: () {
                          // Provider.of<FakeDB>(context, listen: false).fetchKS();
                          setState(() {
                            dB.fetchKS();
                            db = dB.db;
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            side: BorderSide(color: Colors.black)),
                        child: Text("King Saver..."),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: FlatButton(
                        onPressed: () {
                          // Provider.of<FakeDB>(context, listen: false)
                          //     .fetchWhopper();
                          setState(() {
                            dB.fetchWhopper();
                            db = dB.db;
                            print(db);
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            side: BorderSide(color: Colors.black)),
                        child: Text("Whopper"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: FlatButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            side: BorderSide(color: Colors.black)),
                        child: Text("Meal Combos"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: FlatButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            side: BorderSide(color: Colors.black)),
                        child: Text("Classic Burgers"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Stack(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Consumer<FakeDB>(
                        builder: (context, value, child) => ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: db.length,
                            itemBuilder: (context, index) {
                              return ListItem(
                                image: db[index]["image"].toString(),
                                title: db[index]["title"].toString(),
                                subtitle: db[index]["subtitle"].toString(),
                                count: db[index]["count"].toString(),
                                cost: db[index]["cost"].toString(),
                                veg: db[index]["veg"].toString(),
                                db: db,
                                index: index,
                              );
                            }),
                      )
                    ],
                  ),
                ),
                Consumer<FakeDB>(builder: (context, value, child) {
                  return 
                  totalAmt == 0
                      ? Container()
                      : 
                      Positioned(
                          bottom: 0,
                          child: Container(
                            width: width,
                            height: height / 8,
                            color: Colors.green[100],
                            child: Text(
                                dB.totalAmount.toString()
                                // totalAmt.toString()),
                          ),
                ));
                })
              ],
            )),
            Container(
              margin: EdgeInsets.only(bottom: 10, top: 5),
              height: height / 9,
              decoration: BoxDecoration(
                  color: Colors.blue[800],
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton.icon(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    color: Colors.blue[900],
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    label: Text(
                      "Home",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.shopping_basket,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          "assets/logo.png",
          scale: 4,
        ),
        Row(
          children: [
            Container(
              child: Icon(
                Icons.search,
                color: Colors.grey,
                size: 30,
              ),
            ),
            SizedBox(
              width: 40,
            ),
            Container(
              child: Icon(
                Icons.local_offer,
                color: Colors.grey,
              ), //TODO: change the icon
            ),
          ],
        )
      ],
    );
  }
}

class ListItem extends StatefulWidget {
  final title;
  final subtitle;
  final cost;
  final count;
  final veg;
  final image;
  final db;
  final index;
  ListItem(
      {this.cost,
      this.count,
      this.subtitle,
      this.title,
      this.veg,
      this.image,
      this.db,
      this.index});

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Stack(
        children: [
          Container(
            height: 165,
            color: Colors.white,
          ),
          Container(
            height: 140,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey[400])]),
            child: Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 160,
                    width: 160,
                    child: Image.asset(
                      widget.image,
                      scale: 2,
                    ),
                  ),
                  Container(
                    width: 160,
                    // color: Colors.red,
                    child: Column(
                      children: [
                        Container(
                          width: 140,
                          child: Text(
                            widget.title,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Divider(
                          thickness: 2,
                          color: Colors.grey[600],
                          endIndent: 70,
                          indent: 10,
                        ),
                        Container(
                          width: 140,
                          child: Text(
                            widget.subtitle,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 20,
            child: Container(
              height: 50,
              width: 230,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(blurRadius: 5, color: Colors.grey[400])
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Rs ${widget.cost}/-",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  widget.db[widget.index]["count"] == 0
                      // widget.count == 0
                      ? FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text("ADD"),
                          color: Colors.amber,
                          onPressed: () {
                            Provider.of<FakeDB>(context, listen: false)
                                .incCount(widget.db, widget.index);
                            Provider.of<FakeDB>(context, listen: false)
                                .totAmount(widget.db);
                          },
                        )
                      : Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Provider.of<FakeDB>(context, listen: false)
                                    .decCount(widget.db, widget.index);
                                Provider.of<FakeDB>(context, listen: false)
                                    .totAmount(widget.db);
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.amber),
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              alignment: Alignment.center,
                              child: Text(
                                "${widget.count}",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Provider.of<FakeDB>(context, listen: false)
                                    .incCount(widget.db, widget.index);
                                Provider.of<FakeDB>(context, listen: false)
                                    .totAmount(widget.db);
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.amber),
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
