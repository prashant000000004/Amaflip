import 'package:amaflip/pages/category_products.dart';
import 'package:amaflip/pages/product_details.dart';
import 'package:amaflip/services/database.dart';
import 'package:amaflip/services/shared_pref.dart';
import 'package:amaflip/widget/support_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool search = false;
  List categories = [
    "images/headphones.jpg",
    "images/watch.jpg",
    "images/laptop.jpg",
    "images/phone.jpg"
  ];
  List categoryName = ["Headphones", "Watch", "Laptop", "Phone"];

  var queryResultSet = [];
  var tempSearchStore = [];
  TextEditingController searchController = TextEditingController();

  initiateSeach(value) {
    if (value.legth == 0) {
      setState(() {
        var queryResultSet = [];
        var tempSearchStore = [];
      });
    }
    setState(() {
      search = true;
    });

    var capitalizedValue =
        value.substring(0, 1).toUpperCase() + value.substring(1);
    if (queryResultSet.isEmpty && value.length == 1) {
      DatabaseMethods().search(value).then((QuerySnapshot docs) {
        for (int i = 0; i < docs.docs.length; ++i) {
          queryResultSet.add(docs.docs[i].data());
        }
      });
    } else {
      tempSearchStore = [];
      for (var element in queryResultSet) {
        if (element['UpdatedName'].startsWith(capitalizedValue)) {
          setState(() {
            tempSearchStore.add(element);
          });
        }
      }
    }
  }

  String? name, image;
  getthesharedpref() async {
    name = await SharedPreferenceHelper().getUserName();
    image = await SharedPreferenceHelper().getUserImage();
    setState(() {});
  }

  ontheload() async {
    await getthesharedpref();
    setState(() {});
  }

  @override
  void initState() {
    ontheload();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: name == null
          ? Center(child: CircularProgressIndicator())
          : Container(
              margin: EdgeInsets.only(top: 50.0, left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Hey, ${name!}",
                              style: AppWidget.boldTextFieldStyle()),
                          Text("Good Morning",
                              style: AppWidget.lightTextFieldStyle()),
                        ],
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          image!,
                          height: 70,
                          width: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                      controller: searchController,
                      onChanged: (value) {
                        initiateSeach(value.toUpperCase());
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Product",
                        hintStyle: AppWidget.lightTextFieldStyle(),
                        prefixIcon: search
                            ? GestureDetector(
                                onTap: () {
                                  search = false;
                                  tempSearchStore = [];
                                  queryResultSet = [];
                                  searchController.text = "";
                                  setState(() {});
                                },
                                child: Icon(Icons.close))
                            : Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  search
                      ? ListView(
                          padding: EdgeInsets.only(left: 10.0, right: 10.0),
                          primary: false,
                          shrinkWrap: true,
                          children: tempSearchStore.map((element) {
                            return buildResultCard(element);
                          }).toList(),
                        )
                      : Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Categories",
                                    style: AppWidget.semiboldTextFeildStyle(),
                                  ),
                                  Text(
                                    "see all",
                                    style: TextStyle(
                                        color: Color(0xfffd6f3e),
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 150,
                                  padding: EdgeInsets.all(20),
                                  margin: EdgeInsets.only(left: 20.0),
                                  decoration: BoxDecoration(
                                      color: Color(0xfffd6f3e),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      "All",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 20.0),
                                    height: 150,
                                    child: ListView.builder(
                                        itemCount: categories.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return CategoryTile(
                                            image: categories[index],
                                            name: categoryName[index],
                                          );
                                        }),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "All Products",
                                  style: AppWidget.semiboldTextFeildStyle(),
                                ),
                                Text(
                                  "see all",
                                  style: TextStyle(
                                      color: Color(0xfffd6f3e),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30.0,
                            ),
                            SizedBox(
                              height: 190,
                              child: ListView(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 20),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "images/watch.jpg",
                                          height: 120,
                                          width: 120,
                                          fit: BoxFit.cover,
                                        ),
                                        Text(
                                          "Watch",
                                          style: AppWidget
                                              .semiboldTextFeildStyle(),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "\$100",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xfffd6f3e),
                                                fontSize: 22.0,
                                              ),
                                            ),
                                            SizedBox(width: 40.0),
                                            Container(
                                                padding: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                    color: Color(0xfffd6f3e),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Icon(Icons.add,
                                                    color: Colors.white)),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 20.0),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "images/headphones.jpg",
                                          height: 120,
                                          width: 120,
                                          fit: BoxFit.cover,
                                        ),
                                        Text(
                                          "Headphones",
                                          style: AppWidget
                                              .semiboldTextFeildStyle(),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "\$300",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xfffd6f3e),
                                                fontSize: 22.0,
                                              ),
                                            ),
                                            SizedBox(width: 40.0),
                                            Container(
                                                padding: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                    color: Color(0xfffd6f3e),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Icon(Icons.add,
                                                    color: Colors.white)),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "images/laptop.jpg",
                                          height: 120,
                                          width: 120,
                                          fit: BoxFit.cover,
                                        ),
                                        Text(
                                          "Laptop",
                                          style: AppWidget
                                              .semiboldTextFeildStyle(),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "\$900",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xfffd6f3e),
                                                fontSize: 22.0,
                                              ),
                                            ),
                                            SizedBox(width: 40.0),
                                            Container(
                                                padding: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                    color: Color(0xfffd6f3e),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Icon(Icons.add,
                                                    color: Colors.white)),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                ],
              ),
            ),
    );
  }

  Widget buildResultCard(data) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetails(
                    image: data["Image"],
                    name: data["Name"],
                    details: data["Detail"],
                    price: data["Price"])));
      },
      child: Container(
        padding: EdgeInsets.only(left: 20.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 100,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(data["Image"],
                  height: 70, width: 70, fit: BoxFit.cover),
            ),
            SizedBox(
              width: 20.0,
            ),
            Text(
              data["Name"],
              style: AppWidget.semiboldTextFeildStyle(),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  String image, name;
  CategoryTile({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryProducts(category: name)));
      },
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(left: 20.0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              image,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
            Icon(Icons.arrow_forward)
          ],
        ),
      ),
    );
  }
}
