import 'package:flutter/material.dart';
import 'package:grocery_shopping/features/grocery/presentation/widget/image_cart.dart';
import 'package:grocery_shopping/features/grocery/presentation/widget/text.dart';

class ProductImage extends StatelessWidget {
  final String imageUrl;
  final double price;
  final double rating;
  final String title;
  final String id;
  final String desc;

  const ProductImage({
    super.key,
    required this.imageUrl,
    required this.price,
    required this.title,
    required this.id,
    required this.rating,
    required this.desc
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.5, // Adjust height based on image width
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.5,
         // Adjust width based on parent constraints
      ),
      child: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GestureDetector(
                onTap: () => {
                  Navigator.pushNamed(
                context, '/detail',
                arguments: {'rating':rating.toString(),'disc':desc,'imageUrl':imageUrl,'price':price.toString(),'name':title,'id':id}
            )
                },
              child: Container(
                color: const Color.fromARGB(255, 226, 225, 225),
                height: MediaQuery.of(context).size.width * 0.5, // Adjust height based on image width
                width: double.infinity, // Ensure image covers the full width
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: TextWidget(
                      text: title,
                      fontColor: const Color.fromARGB(255, 0, 0, 0),
                      fontSizes: 12,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: TextWidget(
                      text: '$price',
                      fontColor: const Color.fromARGB(255, 0, 0, 0),
                      fontSizes: 12,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow, size: 15),
                        SizedBox(width: 4.0), // Add spacing between icon and text
                        TextWidget(
                          text: '$rating',
                          fontColor: const Color.fromARGB(255, 0, 0, 0),
                          fontSizes: 12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.favorite_border,
                color: Colors.red,
              ),
            ),
          ),
        ],
        
      ),
    );
  }
}
