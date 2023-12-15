import 'package:flutter/material.dart';
import 'package:shoeapp/global_variables.dart';
import 'package:shoeapp/product_details_page.dart';
import 'package:shoeapp/product_list.dart';
import 'package:shoeapp/shopping_cart.dart';

import 'product.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  List<String> categories = const ['All', 'NIke', 'Puma', 'Adidas', 'GoldStar'];
  late String selectedbtn;
  int currentPage = 0;

  final borders = const OutlineInputBorder(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28), topLeft: Radius.circular(28)));
  @override
  void initState() {
    super.initState();
    selectedbtn = categories[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage == 0 ? const ProductList() : const ShoppingCart(),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          items: const [
            BottomNavigationBarItem(label: '', icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: '', icon: Icon(Icons.shopping_cart))
          ]),
    );
  }
}
