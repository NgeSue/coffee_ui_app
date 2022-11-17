import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final String coffeeImagePath;
  final String coffeeName;
  final String coffeePrice;

  CoffeeTile(
      {required this.coffeeImagePath,
      required this.coffeeName,
      required this.coffeePrice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
            padding: const EdgeInsets.all(8),
            width: 200,
            color: Colors.black54,
            //decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // coffee image
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    coffeeImagePath,
                  ),
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        coffeeName,
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        'With Almond Milk',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(coffeePrice),
                      Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Icon(Icons.add)),
                    ],
                  ),
                )
              ],
              //coffee name
            )),
      ),
    );
  }
}
