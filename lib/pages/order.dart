import 'package:amaflip/services/database.dart';
import 'package:amaflip/services/shared_pref.dart';
import 'package:amaflip/widget/support_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  String? email;
  Stream? orderStream;
  getthesharefpref() async {
    email = await SharedPreferenceHelper().getUserEmail();

    setState(() {});
  }

  getontheload() async {
    await getthesharefpref();
    orderStream = await DatabaseMethods().getOrders(email!);
    setState(() {});
  }

  @override
  void initState() {
    getontheload();
    super.initState();
  }

  Widget allOrders() {
    return StreamBuilder(
        stream: orderStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];

                    return Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: Material(
                        elevation: 3.0,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 20.0, top: 10, bottom: 10.0),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Image.network(
                                ds["ProductImage"],
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      ds["Product"],
                                      style: AppWidget.semiboldTextFeildStyle(),
                                    ),
                                    Text("\$" + ds["Price"],
                                        style: TextStyle(
                                            color: Color(0xfffd6f3e),
                                            fontSize: 23.0,
                                            fontWeight: FontWeight.bold)),
                                    Text("Status:  " + ds["Status"],
                                        style: TextStyle(
                                            color: Color(0xfffd6f3e),
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  })
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        appBar: AppBar(
          backgroundColor: Color(0xfff2f2f2),
          title: Center(
            child: Text(
              "Current Orders",
              style: AppWidget.boldTextFieldStyle(),
            ),
          ),
        ),
        body: Container(
            margin: EdgeInsets.only(left: 20.0, bottom: 10.0),
            child: Column(children: [
              Expanded(child: allOrders()),
            ])));
  }
}
