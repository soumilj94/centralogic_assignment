import 'package:centralogic_assignment/features/blocs/book_details_sheet/book_quantity_bloc.dart';
import 'package:centralogic_assignment/features/blocs/book_details_sheet/book_quantity_event.dart';
import 'package:centralogic_assignment/features/blocs/book_details_sheet/book_quantity_state.dart';
import 'package:centralogic_assignment/features/widgets/custom_outline_button.dart';
import 'package:centralogic_assignment/features/widgets/rounded_button.dart';
import 'package:centralogic_assignment/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookDetailsSheet extends StatelessWidget {
  final String image;
  final String name;
  final String description;
  final String vendorImage;
  final double price;
  final int rating;

  const BookDetailsSheet({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.vendorImage,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookQuantityBloc(),
      child: SingleChildScrollView(
        child: Container(
          color: AppColors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      image,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        name,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                    SvgPicture.asset("assets/heart_icon.svg"),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SvgPicture.asset(vendorImage),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  description,
                  style: TextStyle(color: AppColors.greyOne),
                ),
                SizedBox(height: 20),
                Text(
                  "Review",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: List.generate(
                      5,
                      (index) => Icon(
                        Icons.star_rounded,
                        color: (index < rating) ? Colors.amber : AppColors.black,
                        size: 34,
                      ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "(${rating.toString()})",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // book quantity counter
                BlocBuilder<BookQuantityBloc, BookQuantityState>(
                  builder: (context, state){
                    final totalPrice = price * state.quantity;

                    return Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: AppColors.greyTwo),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  context.read<BookQuantityBloc>().add(DecrementQuantity());
                                },
                                icon: Icon(Icons.remove_circle_rounded, size: 40, color: AppColors.greyOne,),
                              ),
                              Text("${state.quantity}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                              IconButton(
                                onPressed: () {
                                  context.read<BookQuantityBloc>().add(IncrementQuantity());
                                },
                                icon: Icon(Icons.add_circle_rounded, size: 40, color: AppColors.primary,),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 20),
                        Text(
                          "\$${totalPrice.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: RoundedButton(
                        bgColor: AppColors.primary,
                        textColor: AppColors.white,
                        text: "Add to Bag",
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      flex: 1,
                      child: CustomOutlineButton(
                        borderColor: AppColors.primary,
                        textColor: AppColors.primary,
                        text: "Buy Now",
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}