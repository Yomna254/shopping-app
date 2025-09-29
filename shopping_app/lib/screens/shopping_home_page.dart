import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/models/offers.dart';
import 'package:shopping_app/models/product.dart';
import 'package:shopping_app/widgets.dart/product_card_widget.dart';

class ShoppingHomePage extends StatelessWidget {
  final List<String> featured = const [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
  ];

  List<Offer> offers = [
    Offer(
      title: tr('offer1_title'),
      description: tr('offer1_description'),
      imageUrl: 'assets/images/2.jpg',
    ),
    Offer(
      title: tr('offer2_title'),
      description: tr('offer2_description'),
      imageUrl: 'assets/images/68d6dac0-ba2d-47b7-b2ca-988b3ab5b3a7.jpg',
    ),
    Offer(
      title: tr('offer3_title'),
      description: tr('offer3_description'),
      imageUrl: 'assets/images/mouse.jpg',
    ),
    Offer(
      title: tr('offer4_title'),
      description: tr('offer4_description'),
      imageUrl: 'assets/images/Premium Photo _ Online shipping concept.jpg',
    ),
    Offer(
      title: tr('offer5_title'),
      description: tr('offer5_description'),
      imageUrl: 'assets/images/1.jpg',
    ),
  ];
  List<Product> products = [
    Product(
      id: '1',
      title: tr('product1_title'),
      imageUrl: 'assets/images/mac_book.jpg',
      price: 2399,
    ),
    Product(
      id: '2',
      title: tr('product2_title'),
      imageUrl: 'assets/images/headphone.jpg',
      price: 299,
    ),
    Product(
      id: '3',
      title: tr('product3_title'),
      imageUrl: 'assets/images/smartwatch.jpg',
      price: 399,
    ),
    Product(
      id: '4',
      title: tr('product4_title'),
      imageUrl: 'assets/images/iphone.jpg',
      price: 2000,
    ),
    Product(
      id: '5',
      title: tr('product5_title'),
      imageUrl: 'assets/images/camera.jpg',
      price: 199,
    ),
    Product(
      id: '6',
      title: tr('product6_title'),
      imageUrl: 'assets/images/mouse.jpg',
      price: 79,
    ),
  ];

  ShoppingHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          tr('ourProducts'),
          style: TextStyle(
            color: Color.fromARGB(255, 126, 68, 183),
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 180,
                child: PageView.builder(
                  itemCount: 3,
                  itemBuilder:
                      (context, index) => ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          featured[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                ),
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder:
                    (context, index) => ProductCard(
                      product: products[index],
                      onAdd: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(tr('itemAdded'))),
                        );
                      },
                    ),
              ),
              const SizedBox(height: 20),
              Text(
                tr('hotOffers'),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: offers.length,
                itemBuilder:
                    (context, index) => Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.asset(
                              offers[index].imageUrl,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    offers[index].title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(offers[index].description),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
