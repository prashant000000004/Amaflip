import 'dart:io';

import 'package:amaflip/services/database.dart';
import 'package:amaflip/widget/support_widget.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String? value;
  final ImagePicker _picker = ImagePicker();
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descController = TextEditingController();

  File? selectedImage;
  Future<void> getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage = File(image.path);
      setState(() {});
    }
  }

  Future<void> uploadItem() async {
    if (selectedImage == null || nameController.text.isEmpty) {
      print("No image selected or product name is empty.");
      return;
    }
    if (selectedImage != null &&
        nameController.text.isNotEmpty &&
        value != null) {
      try {
        String addId = randomAlphaNumeric(10);
        Reference firebaseStorageRef = FirebaseStorage.instance
            .ref()
            .child("productImages")
            .child("$addId.jpg");
        UploadTask task = firebaseStorageRef.putFile(selectedImage!);
        TaskSnapshot snapshot = await task;
        var downloadUrl = await snapshot.ref.getDownloadURL();

        String firstLetter = nameController.text.substring(0, 1).toUpperCase();
        Map<String, dynamic> addProduct = {
          "Name": nameController.text,
          "SearchKey": firstLetter,
          "UpdatedName": nameController.text.toUpperCase(),
          "Image": downloadUrl,
          "Price": priceController.text,
          "Detail": descController.text,
          "Category": value
        };

        await DatabaseMethods().addProduct(addProduct, value!);

        await DatabaseMethods().addAllProducts(addProduct);

        setState(() {
          selectedImage = null;
          nameController.clear();
          priceController.clear();
          descController.clear();
          value = null;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Product has been uplaoded Sucessfully",
              style: TextStyle(fontSize: 20.0),
            )));
      } catch (e) {
        print("Error uploading product: $e");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text("Failed to upload product."),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text("Please fill all fields and select an image."),
      ));
    }
  }

  final List<String> categoryitem = ["Watch", "Laptop", "Phone", "Headphones"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new_outlined)),
        title: Text("Add Product", style: AppWidget.semiboldTextFeildStyle()),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Upload The Product Image",
                style: AppWidget.lightTextFieldStyle(),
              ),
              SizedBox(height: 20.0),
              selectedImage == null
                  ? GestureDetector(
                      onTap: () {
                        getImage();
                      },
                      child: Center(
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(Icons.camera_alt_outlined),
                        ),
                      ),
                    )
                  : Center(
                      child: Material(
                        elevation: 4.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.file(selectedImage!,
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ),
              SizedBox(height: 20.0),
              Text(
                "Product Name",
                style: AppWidget.lightTextFieldStyle(),
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xffececf8),
                    borderRadius: BorderRadius.circular(20.0)),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                "Product Category",
                style: AppWidget.lightTextFieldStyle(),
              ),
              SizedBox(height: 20.0),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Color(0xffececf8),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      items: categoryitem
                          .map((item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: AppWidget.semiboldTextFeildStyle(),
                              )))
                          .toList(),
                      onChanged: ((value) => setState(() {
                            this.value = value;
                          })),
                      dropdownColor: Colors.white,
                      hint: Text("Select Category"),
                      iconSize: 36,
                      icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                      value: value,
                    ),
                  )),
              SizedBox(height: 20.0),
              Text(
                "Product Price",
                style: AppWidget.lightTextFieldStyle(),
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xffececf8),
                    borderRadius: BorderRadius.circular(20.0)),
                child: TextField(
                  controller: priceController,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                "Product Description",
                style: AppWidget.lightTextFieldStyle(),
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xffececf8),
                    borderRadius: BorderRadius.circular(20.0)),
                child: TextField(
                  maxLines: 6,
                  controller: descController,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
              SizedBox(height: 20.0),
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        uploadItem();
                      },
                      child: Text(
                        "Add Product",
                        style: TextStyle(fontSize: 22),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
