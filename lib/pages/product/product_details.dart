import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  static const double IMAGE_HEIGHT = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            height: IMAGE_HEIGHT,
            child: Image.network(
              'https://images.unsplash.com/photo-1482049016688-2d3e1b311543',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16.0),
                  ),
                  color: Colors.white,
                ),
                margin: EdgeInsets.only(top: IMAGE_HEIGHT - 16.0),
                padding: EdgeInsetsDirectional.only(
                  top: 30.0,
                  start: 20.0,
                  end: 20.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Petits pois et carottes',
                      textAlign: TextAlign.left,
                    ),
                    Text('Cassegrain'),

                    /// TODO A remplacer
                    const SizedBox(
                      height: 10000,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
