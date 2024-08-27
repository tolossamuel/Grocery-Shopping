import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_shopping/features/grocery/presentation/UI/homeScreen/loadingPage.dart';
import 'package:grocery_shopping/features/grocery/presentation/bloc/product_bloc.dart';
import 'package:grocery_shopping/features/grocery/presentation/bloc/product_event.dart';
import 'package:grocery_shopping/features/grocery/presentation/bloc/product_stae.dart';
import 'package:grocery_shopping/features/grocery/presentation/widget/image_cart.dart';
import 'package:grocery_shopping/features/grocery/presentation/widget/productContainer.dart';
import 'package:grocery_shopping/features/grocery/presentation/widget/text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    super.initState();
    context.read<ProductBloc>().add(const LoadAllProductEvent());
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<ProductBloc>().add(const LoadAllProductEvent());
      },
      child: Scaffold(
        appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    child: Image.asset(
                      'assets/images/burger.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                  TextWidget(
                    text: 'Burger',
                    fontColor: Colors.black,
                    fontSizes: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            centerTitle: true),
        body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.filter_list),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusColor: Colors.grey,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                      if (state is LoadingState) {
                        return LoadingPage();
                      } else if (state is LoadedAllProductState) {
                        return GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: (MediaQuery.of(context).size.width * 0.5) / (MediaQuery.of(context).size.height * 0.4), // Adjust the aspect ratio
                          ),
                          itemCount: state.products.length,
                          itemBuilder: (context, index) {
                            final current = state.products[index];
                            return ProductImage(
                              imageUrl: current.imageUrl,
                              price: current.price,
                              title: current.title,
                              id: current.id,
                              rating: current.rating,
                            );
                          },
                        );
                      } else {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Try again'),
                              ElevatedButton(
                                onPressed: () => context.read<ProductBloc>().add(const LoadAllProductEvent()),
                                child: const Icon(Icons.refresh),
                              )
                            ],
                          ),
                        );
                      }
                    },
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
