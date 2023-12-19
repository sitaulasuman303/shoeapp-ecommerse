import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoeapp/providers/cart_provider.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const ShoeShop());
}

class ShoeShop extends StatelessWidget {
  const ShoeShop({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: "ShoeShop",
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: "Lato",
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(254, 206, 1, 1),
              primary: const Color.fromRGBO(254, 206, 1, 1)),
          textTheme: const TextTheme(
              titleMedium:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        ),
        home: const home_page(),
      ),
    );
  }
}
