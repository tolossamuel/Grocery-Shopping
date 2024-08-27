import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_shopping/features/grocery/presentation/bloc/product_bloc.dart';
import 'package:grocery_shopping/features/grocery/presentation/bloc/product_stae.dart';
import 'package:grocery_shopping/features/grocery/presentation/widget/back_idons.dart';
import 'package:grocery_shopping/features/grocery/presentation/widget/text.dart';



class DetailPage extends StatelessWidget {
  const DetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(286),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(data['imageUrl']), fit: BoxFit.fill)),
                
              ),
              const BackIcons(),
            ]
          )
        ),
        body: BlocListener<ProductBloc, ProductState>(
          listener: (context, state) {
            
          },
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(15),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   
                  // short description about the product price, rating and name of brand= ====================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                         
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: TextWidget(
                              text: data['name'], 
                              fontColor: Colors.black, 
                              fontSizes: 20,
                              fontWeight: FontWeight.bold,
                              ),
                          ),
                          
                        ],
                      ),
                      Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 20,
                                  ),
                              TextWidget(
                                text: data['rating'],
                                fontColor: Colors.black,
                                fontSizes: 12,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextWidget(
                              text: '\$${data["price"]}',
                              fontColor: Colors.black,
                              fontSizes: 16)
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  
                  // size of product if avilable
                  const SizedBox(
                    height: 10,
                  ),
                  
                  const SizedBox(
                    height: 10,
                  ),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
