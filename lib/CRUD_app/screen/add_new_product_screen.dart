import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  final TextEditingController _productNameTextctl = TextEditingController();
  final TextEditingController _unitPriceTextctl = TextEditingController();
  final TextEditingController _totalPriceTextctl = TextEditingController();
  final TextEditingController _imageTextctl = TextEditingController();
  final TextEditingController _codeTextctl = TextEditingController();
  final TextEditingController _quantityTextctl = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _inProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("add new product".toUpperCase())),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _buildNewProductForm(),
        ),
      ),
    );
  }

  Widget _buildNewProductForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _productNameTextctl,
            decoration: const InputDecoration(
                hintText: "name", labelText: "Product Name"),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Enter a valid value";
              }
              return null;
            },
          ),
          TextFormField(
            controller: _unitPriceTextctl,
            decoration: const InputDecoration(
                hintText: 'Unit Price', labelText: 'Unit Price'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Enter a valid value';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _totalPriceTextctl,
            decoration: const InputDecoration(
                hintText: 'Total Price', labelText: 'Total Price'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Enter a valid value';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _imageTextctl,
            decoration: const InputDecoration(
                hintText: 'Image', labelText: 'Product Image'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Enter a valid value';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _codeTextctl,
            decoration: const InputDecoration(
                hintText: 'Product code', labelText: 'Product Code'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Enter a valid value';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _quantityTextctl,
            decoration: const InputDecoration(
                hintText: 'Quantity', labelText: 'Quantity'),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Enter a valid value';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 20,
          ),
          _inProgress
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size.fromWidth(double.maxFinite),
                  ),
                  onPressed: () {
                    _onTapAddProductButton();
                  },
                  child: const Text("Add Product"),
                )
        ],
      ),
    );
  }

  void _onTapAddProductButton() {
    if (_formKey.currentState!.validate()) {
      addNewProduct();
    } else {
      print("Not validate");
    }
  }

  Future<void> addNewProduct() async {
    _inProgress = true;
    setState(() {});

    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/CreateProduct');

    Map<String, dynamic> requestBody = {
     "ProductName": _productNameTextctl.text,
      "ProductCode": _codeTextctl.text,
      "Img": _imageTextctl.text,
      "UnitPrice": _unitPriceTextctl.text,
      "Qty": _quantityTextctl.text,
      "TotalPrice": _totalPriceTextctl.text
    };
    Response response = await post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(requestBody),
    );

    if (response.statusCode == 200) {
      print(response.body);
      _clearTextField();

      showSnackbar(context);
    }
    _inProgress = false;
    setState(() {});
  }

  void showSnackbar(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('Product Successfully Added'),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _clearTextField() {
    _productNameTextctl.clear();
    _unitPriceTextctl.clear();
    _totalPriceTextctl.clear();
    _imageTextctl.clear();
    _codeTextctl.clear();
    _quantityTextctl.clear();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    _productNameTextctl.dispose();
    _unitPriceTextctl.dispose();
    _totalPriceTextctl.dispose();
    _imageTextctl.dispose();
    _codeTextctl.dispose();
    _quantityTextctl.dispose();
    super.dispose();
  }
}
