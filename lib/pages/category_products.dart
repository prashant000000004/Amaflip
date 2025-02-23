import 'package:amaflip/pages/product_details.dart';
import 'package:amaflip/services/database.dart';
import 'package:amaflip/widget/support_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryProducts extends StatefulWidget {
  String category;

  CategoryProducts({super.key, required this.category});

  @override
  State<CategoryProducts> createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  Stream? categroyStream;
  getOntheLoad() async {
    categroyStream = await DatabaseMethods().getProducts(widget.category);
    setState(() {});
  }

  @override
  void initState() {
    getOntheLoad();
    super.initState();
  }

  Widget allProduct() {
    return StreamBuilder(
        stream: categroyStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      mainAxisSpacing: 10.0),
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.0,
                          ),
                          Image.network(
                            ds["Image"],
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            ds["Name"],
                            style: AppWidget.semiboldTextFeildStyle(),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                "\$" + ds["Price"],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xfffd6f3e),
                                  fontSize: 22.0,
                                ),
                              ),
                              SizedBox(width: 30.0),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProductDetails(
                                              image: ds["Image"],
                                              name: ds["Name"],
                                              details: ds["Details"],
                                              price: ds["Price"])));
                                },
                                child: Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Color(0xfffd6f3e),
                                        borderRadius: BorderRadius.circular(8)),
                                    child:
                                        Icon(Icons.add, color: Colors.white)),
                              ),
                            ],
                          )
                        ],
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
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          children: [Expanded(child: allProduct())],
        ),
      ),
    );
  }
}
