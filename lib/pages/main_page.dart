import 'package:flutter/material.dart';
import 'package:flutter_movie_app/util/coffee_type.dart';
import 'package:google_fonts/google_fonts.dart';
import '../util/coffee_tile.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List coffeeType = [
    ['Cuppuccino', true],
    ['Latte', false],
    ['Black', false],
    ['Tea', false],
  ];
  // user tapped on coffee type
  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: const Icon(Icons.menu),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.person),
            )
          ],
        ),
        bottomNavigationBar:
            BottomNavigationBar(selectedItemColor: Colors.orange, items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
        ]),
        body: Column(
          children: [
            // Find the best coffee for you
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text('စိတ်ကြိုက်သောက်မည် မိုင်ကော်ဖီ',
                    style: GoogleFonts.bebasNeue(
                      textStyle: const TextStyle(
                        fontSize: 25,
                      ),
                    ))),
            // const SizedBox(height: 8),
            //search bar
            const Padding(
              padding: EdgeInsets.all(25.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Find your coffee',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
            ),

            const SizedBox(
              height: 8.0,
            ),
            //horizontal listView of coffee title
            Container(
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: coffeeType.length,
                    itemBuilder: (context, index) {
                      return CoffeeType(
                          coffeeType: coffeeType[index][0],
                          isSelected: coffeeType[index][1],
                          onTap: () {
                            coffeeTypeSelected(index);
                          });
                    })),
            //horizontal listView of coffee title
            Expanded(
                child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeTile(
                    coffeeImagePath: 'assets/images/latte.jpg',
                    coffeeName: 'Latte',
                    coffeePrice: '\$4.20'),
                CoffeeTile(
                    coffeeImagePath: 'assets/images/cuppacino.jpg',
                    coffeeName: 'Cuppuccino',
                    coffeePrice: '\$4.10'),
                CoffeeTile(
                    coffeeImagePath: 'assets/images/milkcoffee.jpg',
                    coffeeName: 'Milk Coffee',
                    coffeePrice: '\$4.16')
              ],
            ))
          ],
        ));
  }
}
