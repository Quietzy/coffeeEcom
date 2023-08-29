import 'package:flutter/material.dart';
import 'package:grocery/misc/color.dart';
import 'package:grocery/widgets/app_large_text.dart';
import 'package:grocery/widgets/button.dart';
import 'package:grocery/widgets/des_text.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  List images = [
    "zero.jpg",
    "one.jpg",
    "two.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('lib/images/' + images[index]),
                    fit: BoxFit.cover),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 100, left: 25, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(
                          text: 'Drinks',
                          color: primaryColor,
                          size: 37,
                        ),
                        AppLargeText(
                          text: 'COFFEE',
                          color: Colors.white.withOpacity(0.8),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 260,
                          child: DescriptionText(
                            color: Colors.white54,
                            text:
                                'Drinks Coffee and wastes most of your time with more energy UwU',
                            size: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        MyButton(
                            text: 'Order Now',
                            onTap: () {
                              Navigator.pushNamed(context, '/menupage');
                            }),
                      ],
                    ),
                    Column(
                      children: List.generate(
                          3,
                          (indexDots) => Container(
                                margin: EdgeInsets.only(bottom: 4),
                                width: 8,
                                height: index == indexDots ? 25 : 8,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: index == indexDots
                                        ? Colors.brown
                                        : Colors.grey),
                              )),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
