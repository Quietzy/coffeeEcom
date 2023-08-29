import 'package:flutter/material.dart';
import 'package:grocery/misc/item.dart';
import 'package:grocery/pages/detail_page.dart';
import 'package:grocery/widgets/app_large_text.dart';
import 'package:grocery/widgets/des_text.dart';
import 'package:grocery/widgets/item_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List CoffeeMenu = [
    Item(
        name: 'Latte',
        price: '9.89',
        imagepath: 'lib/images/ttwo.png',
        rating: '4.5'),
    Item(
        name: 'Cappuccino',
        price: '7.09',
        imagepath: 'lib/images/coffeecup.png',
        rating: '4.7'),
    Item(
        name: 'Frappe',
        price: '10.99',
        imagepath: 'lib/images/tfour.png',
        rating: '4.8')
  ];
  List DessertMenu = [
    Item(
        name: 'Red Velvet Cake',
        price: '12.88',
        imagepath: 'lib/images/revelvetcake.png',
        rating: '4.4'),
    Item(
        name: 'Choco Truffle Cake',
        price: '12.88',
        imagepath: 'lib/images/chocotr.png',
        rating: '4.6'),
    Item(
        name: 'Chicken Sandwich',
        price: '12.88',
        imagepath: 'lib/images/chicksand.png',
        rating: '4.0')
  ];
  List SoftDrink = [
    Item(
        name: 'Coca Cola',
        price: '12.88',
        imagepath: 'lib/images/coca.png',
        rating: '4.4'),
    Item(
        name: 'Sprite',
        price: '12.88',
        imagepath: 'lib/images/sprite.jpeg',
        rating: '4.6'),
    Item(
        name: 'Fanta',
        price: '12.88',
        imagepath: 'lib/images/fanta.jpeg',
        rating: '4.0')
  ];
  List IceCream = [
    Item(
        name: 'Strawberry Mint',
        price: '12.88',
        imagepath: 'lib/images/strawmint.png',
        rating: '4.4'),
    Item(
        name: 'Matcha Mint',
        price: '12.88',
        imagepath: 'lib/images/matchamint.png',
        rating: '4.0'),
    Item(
        name: 'Oreo Icecream Cake',
        price: '12.88',
        imagepath: 'lib/images/oreoice.png',
        rating: '4.6'),
  ];
  void NavigateDetails(int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: ((context) => FoodDetailPage(
                  food: CoffeeMenu[index],
                ))));
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 4, vsync: this);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AppBar
            Container(
              padding: const EdgeInsets.only(top: 70, left: 20),
              child: Row(
                children: [
                  const Icon(
                    Icons.menu,
                    size: 30,
                    color: Colors.black54,
                  ),
                  Expanded(
                      child: Container(
                    margin: const EdgeInsets.only(left: 100),
                    child: AppLargeText(text: 'Coffee'),
                  )),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.withOpacity(0.5)),
                    child: Image.asset(
                      'lib/images/perosn.jpg',
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            // Tab Bar
            Container(
              child: Align(
                alignment: Alignment.center,
                child: TabBar(
                  labelPadding: const EdgeInsets.only(left: 30, right: 30),
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  indicator: CircleTabIndicator(
                      color: Colors.deepOrangeAccent, radius: 4),
                  tabs: const [
                    Tab(
                      text: 'Coffee',
                    ),
                    Tab(
                      text: 'Desserts',
                    ),
                    Tab(
                      text: 'Soft Drink',
                    ),
                    Tab(
                      text: 'IceCream',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: AppLargeText(
                      text: 'Best Seller',
                      size: 24,
                    )),
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: DescriptionText(
                    color: Colors.grey,
                    text: 'See all',
                    size: 18,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            // FoodTile
            Container(
              height: 300,
              width: double.maxFinite,
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                      itemCount: CoffeeMenu.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, int index) => ItemTile(
                          onTap: () => NavigateDetails(index),
                          item: CoffeeMenu[index])),
                  ListView.builder(
                      itemCount: CoffeeMenu.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, int index) => ItemTile(
                            item: DessertMenu[index],
                            onTap: () => NavigateDetails(index),
                          )),
                  ListView.builder(
                      itemCount: SoftDrink.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, int index) => ItemTile(
                            item: SoftDrink[index],
                            onTap: () => NavigateDetails(index),
                          )),
                  ListView.builder(
                      itemCount: IceCream.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, int index) => ItemTile(
                            item: IceCream[index],
                            onTap: () => NavigateDetails(index),
                          )),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                margin: const EdgeInsets.only(left: 20),
                child: AppLargeText(
                  text: 'Our Menu',
                  size: 24,
                )),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'lib/images/tthree.png',
                        height: 70,
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLargeText(
                            text: 'Cappucinno',
                            size: 18,
                            color: Colors.black.withOpacity(0.7),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DescriptionText(
                            text: '\$12.79',
                            color: Colors.black.withOpacity(0.6),
                            size: 18,
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 111,
                      ),
                      const Icon(
                        Icons.favorite_outline,
                        color: Colors.grey,
                        size: 28,
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'lib/images/oreocoffee.png',
                        height: 70,
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLargeText(
                            text: 'Oreo Frappe',
                            size: 18,
                            color: Colors.black.withOpacity(0.7),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DescriptionText(
                            text: '\$9.99',
                            color: Colors.black.withOpacity(0.6),
                            size: 18,
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 112,
                      ),
                      const Icon(
                        Icons.favorite_outline,
                        color: Colors.grey,
                        size: 28,
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20)),
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'lib/images/tsix.png',
                        height: 70,
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLargeText(
                            text: 'Singature Coffee',
                            size: 18,
                            color: Colors.black.withOpacity(0.7),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DescriptionText(
                            text: '\$9.99',
                            color: Colors.black.withOpacity(0.6),
                            size: 18,
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 76,
                      ),
                      const Icon(
                        Icons.favorite_outline,
                        color: Colors.grey,
                        size: 28,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _circlePainter(color: color, radius: radius);
  }
}

class _circlePainter extends BoxPainter {
  final Color color;
  double radius;
  _circlePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
