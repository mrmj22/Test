import 'package:flutter/material.dart';
import 'package:test_project/model/product.dart';

class ProductCard extends StatelessWidget {
  Product? product;
  Function? onCardClick;

  ProductCard({ this.product, this.onCardClick });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.onCardClick!();
      },
      child: Container(
          margin: EdgeInsets.all(20),
          height: 170,
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                      this.product!.imgName!,
                      fit: BoxFit.cover),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.7),
                              Colors.transparent
                            ]))),
              ),
              Positioned(
                bottom: 0,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Text(this.product!.name!,
                          style: TextStyle(color: Colors.white, fontSize: 25))
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}