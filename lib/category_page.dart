import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  final String name;

  const Category({super.key, required this.name});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  late String btnfilter;
  @override
  void initState() {
    super.initState();
    btnfilter = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      margin: const EdgeInsets.symmetric(horizontal: 6.0),
      elevation: 2,
      child: SizedBox(
        width: 90,
        height: 35,
        child: TextButton(
          style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Color.fromRGBO(245, 247, 249, 1))),
          onPressed: () {
            print(widget.name);
          },
          child: Center(
            child: Text(
              style: const TextStyle(fontSize: 16),
              widget.name,
            ),
          ),
        ),
      ),
    );
  }
}
