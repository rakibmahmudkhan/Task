import 'package:flutter/material.dart';
import 'package:task/CRUD_app/screen/product_list_screen.dart';
import 'package:task/CRUD_app/widget/product_item.dart';

void main() {
  return runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:ProductListScreen()
    );
  }
}


