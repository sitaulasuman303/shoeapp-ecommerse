import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final List<int> sizes;
  final String imageUrl;
  const ProductCard(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.price,
      required this.sizes});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 26),
          color: const Color.fromRGBO(216, 240, 253, 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text('\$$price',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 10,
              ),
              Center(child: Image(image: AssetImage(imageUrl))),
            ],
          ),
        ),
      ],
    );
  }
}
