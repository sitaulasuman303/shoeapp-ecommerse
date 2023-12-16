import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoeapp/cart_provider.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
        ),
        body: ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final cartItem = cart[index];
              return ListTile(
                leading: CircleAvatar(
                    radius: 45,
                    backgroundColor: Theme.of(context).primaryColor,
                    backgroundImage:
                        AssetImage(cartItem['imageUrl'].toString())),
                title: Text(
                  cartItem['title'].toString(),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Size: ${cartItem['size']}"),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog.adaptive(
                            title: const Text("Remove Item"),
                            titleTextStyle: const TextStyle(
                                fontSize: 24, color: Colors.black),
                            content: const Text(
                                "Are you sure you want to delete the item?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Provider.of<CartProvider>(context,
                                          listen: false)
                                      .removeProduct(cartItem);
                                  Navigator.of(context).pop(
                                      MaterialPageRoute(builder: (context) {
                                    return const ShoppingCart();
                                  }));
                                },
                                child: const Text(
                                  "YES",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(
                                        MaterialPageRoute(builder: (context) {
                                      return const ShoppingCart();
                                    }));
                                  },
                                  child: const Text("NO"))
                            ],
                          );
                        });
                  },
                  icon: const Icon(Icons.delete),
                  color: Colors.red,
                ),
              );
            }));
  }
}
