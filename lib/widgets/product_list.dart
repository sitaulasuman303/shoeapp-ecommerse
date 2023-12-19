import 'package:flutter/material.dart';
import 'package:shoeapp/global_variables.dart';
import 'package:shoeapp/widgets/product.dart';
import 'package:shoeapp/pages/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProductList> {
  List<String> categories = const ['All', 'Nike', 'Puma', 'Adidas', 'GoldStar'];
  final nikeProdcut = products[0];
  late String selectedbtn;

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
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Shoes\nCollection",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: TextField(
                  maxLines: 1,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      border: borders,
                      focusedBorder: borders,
                      hintText: "search"),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 40,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final filter = categories[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 6.0, vertical: 2),
                    elevation: 2,
                    child: SizedBox(
                      width: 90,
                      height: 35,
                      child: TextButton(
                        style: ButtonStyle(
                            backgroundColor: selectedbtn == filter
                                ? MaterialStatePropertyAll(
                                    Theme.of(context).colorScheme.primary)
                                : const MaterialStatePropertyAll(
                                    Color.fromRGBO(245, 247, 249, 1))),
                        onPressed: () {
                          setState(() {
                            selectedbtn = filter;
                          });
                        },
                        child: Center(
                          child: Text(
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                            categories[index],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: selectedbtn == 'Nike' ? 1 : products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  Color bgcolor;
                  index % 2 == 0
                      ? bgcolor = const Color.fromRGBO(216, 240, 253, 1)
                      : bgcolor = const Color.fromRGBO(245, 247, 249, 1);
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return ProductDetails(product: product);
                      }));
                    },
                    child: selectedbtn == 'Nike'
                        ? ProductCard(
                            title: nikeProdcut['title'] as String,
                            imageUrl: nikeProdcut['imageUrl'] as String,
                            sizes: nikeProdcut['sizes'] as List<int>,
                            price: nikeProdcut['price'] as double,
                            bgcolor: bgcolor,
                          )
                        : ProductCard(
                            title: product['title'] as String,
                            imageUrl: product['imageUrl'] as String,
                            sizes: product['sizes'] as List<int>,
                            price: product['price'] as double,
                            bgcolor: bgcolor,
                          ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
