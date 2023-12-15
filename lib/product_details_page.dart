import 'dart:ffi' as ffi;

import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final Map<String, Object> product;

  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late int chiColor;
  @override
  void initState() {
    super.initState();
    chiColor = (widget.product['sizes'] as List<int>)[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Details")),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Text(widget.product['title'] as String,
              style:
                  const TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Image(image: AssetImage(widget.product['imageUrl'] as String)),
          ),
          const Spacer(
            flex: 2,
          ),
          Container(
            width: double.infinity,
            height: 250,
            margin: const EdgeInsets.only(left: 16, right: 16),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 221, 248, 221),
                borderRadius: BorderRadius.circular(40)),
            child: Column(
              children: [
                Text("\$${widget.product['price'] as double}",
                    style: const TextStyle(
                        fontSize: 35, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                      itemCount: (widget.product['sizes'] as List<int>).length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final int current =
                            (widget.product['sizes'] as List<int>)[index];
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  chiColor = current;
                                });
                              },
                              child: Chip(
                                  label: Text(
                                    ("${(widget.product['sizes'] as List<int>)[index]}"),
                                  ),
                                  backgroundColor: current == chiColor
                                      ? Theme.of(context).primaryColor
                                      : const Color.fromRGBO(245, 247, 249, 1)),
                            ));
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton.icon(
                      icon:
                          const Icon(Icons.shopping_cart, color: Colors.black),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor:
                              Theme.of(context).colorScheme.primary),
                      label: const Text(
                        "Add to Card",
                        style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
                      )),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
