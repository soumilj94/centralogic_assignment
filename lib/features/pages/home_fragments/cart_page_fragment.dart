import 'package:centralogic_assignment/features/blocs/cart_page/cart_bloc.dart';
import 'package:centralogic_assignment/features/blocs/cart_page/cart_event.dart';
import 'package:centralogic_assignment/features/blocs/cart_page/cart_state.dart';
import 'package:centralogic_assignment/features/widgets/custom_cart_texts.dart';
import 'package:centralogic_assignment/features/widgets/rounded_button.dart';
import 'package:centralogic_assignment/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPageFragment extends StatelessWidget {
  const CartPageFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("My Bag"),
        centerTitle: true,
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.items.isEmpty) {
            return const Center(child: Text("Your cart is empty!"));
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.items.length,
                    itemBuilder: (context, index) {
                      final item = state.items[index];
                      return Column(
                        children: [
                          SizedBox(
                                width: double.infinity,
                                child: Row(
                                  spacing: 15,
                                  children: [
                                    Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          image: DecorationImage(image: AssetImage(item.image),
                                          fit: BoxFit.cover,
                                          ),
                                          borderRadius: BorderRadius.circular(8)
                                        ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      //spacing: 5,
                                      children: [
                                        SizedBox(
                                          width: 200,
                                            child: Text(
                                              item.name,
                                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            )
                                        ),
                                        Container(
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: AppColors.secondary),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  //context.read<CartBloc>().add(DecrementQuantity(itemName: item.name));
                                                },
                                                icon: Icon(Icons.remove_circle_rounded, size: 30, color: AppColors.primary,),
                                              ),
                                              Text("1", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                                              IconButton(
                                                onPressed: () {
                                                  //context.read<CartBloc>().add(IncrementQuantity(itemName: item.name));
                                                },
                                                icon: Icon(Icons.add_circle_rounded, size: 30, color: AppColors.primary,),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text("\$ ${item.price.toString()}", style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700, fontSize: 16),),
                                        SizedBox(height: 20),
                                        InkWell(
                                            onTap: (){
                                              context.read<CartBloc>().add(RemoveFromCart(itemName: item.name));
                                            },
                                            child: Text("Remove", style: TextStyle(color: Colors.red),))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                          Divider(color: AppColors.greyOne),
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 250,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...state.items.map((item) => Text(item.name, maxLines: 1, overflow: TextOverflow.ellipsis,)),
                            ],
                          ),
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ...state.items.map((item) => Text("\$ ${item.price.toString()}")),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Divider(color: AppColors.greyOne),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CartText(text: "Subtotal"),
                      CartText(text: "\$${state.items.fold(0, (total, item) => total + item.price.toInt())}"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Divider(color: AppColors.greyOne),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CartText(text: "Shipping"),
                      CartText(text: "\$2"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Divider(color: AppColors.greyOne),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CartText(text: "Total Payment"),
                      CartText(text: "\$${state.items.fold(0, (total, item) => total + item.price.toInt() + 2)}")
                    ],
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: RoundedButton(bgColor: AppColors.primary, textColor: AppColors.white, text: "Pay Now", onPressed: (){}),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}