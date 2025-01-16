import 'package:centralogic_assignment/features/blocs/home_page/carousel/carousel_state.dart';
import 'package:centralogic_assignment/features/blocs/home_page/carousel/carousel_bloc.dart';
import 'package:centralogic_assignment/features/blocs/home_page/carousel/carousel_event.dart';
import 'package:centralogic_assignment/features/widgets/custom_carousel.dart';
import 'package:centralogic_assignment/features/widgets/custom_outline_button.dart';
import 'package:centralogic_assignment/features/widgets/header_item.dart';
import 'package:centralogic_assignment/features/widgets/rounded_button.dart';
import 'package:centralogic_assignment/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CarouselBloc()..add(FetchCarouselItems()),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/search_icon.svg")),
          ),

          title: Text("Home", style: TextStyle(fontWeight: FontWeight.bold),),
          centerTitle: true,

          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: SvgPicture.asset("assets/notification_icon.svg"),
            )
          ],
          ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              CustomCarousel(items: [
                CarouselItem(title: "Special Offer", subtitle: "Discount 25%", buttonText: "Order Now", imagePath: "assets/book_covers/dark-matter.jpg"),
                CarouselItem(title: "Freshly Added", subtitle: "Read Now", imagePath: "assets/book_covers/the-kite-runner.jpg"),
                CarouselItem(title: "Most Read", imagePath: "assets/book_covers/the-subtle-art.jpg")
              ]),

              HeaderItem(header: "Top of Week"),

              Flexible(
                child: BlocBuilder<CarouselBloc, CarouselState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (state.hasError) {
                      return Center(child: Text("Failed to load carousel items."));
                    }

                    return SizedBox(
                      height: 220,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.items.length,
                        itemBuilder: (context, index) {
                          final item = state.items[index];
                          return GestureDetector(
                            onTap: (){
                              final int ratingStars = item.rating;
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                showDragHandle: true,
                                backgroundColor: AppColors.white,
                                builder: (context) => BottomSheet(
                                  onClosing: () {},
                                  builder: (context) =>
                                      Container(
                                        height: 600,
                                        color: Colors.white,
                                        child: Center(
                                          child:
                                          SingleChildScrollView(
                                            child: Column(
                                              spacing: 20,
                                              children: [
                                                ClipRRect(
                                                  borderRadius: BorderRadius.circular(10),
                                                  child: Image.asset(
                                                    width: 200,
                                                      item.image
                                                  ),
                                                ),

                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Flexible(child: Text(item.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),
                                                      SvgPicture.asset("assets/heart_icon.svg"),
                                                    ],
                                                  ),
                                                ),

                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                                  child: Row(
                                                    children: [
                                                      SvgPicture.asset(item.vendor_image),
                                                    ],
                                                  ),
                                                ),

                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                                  child: Text(item.description, style: TextStyle(color: AppColors.greyOne),),
                                                ),

                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                                  child: Row(
                                                    children: [
                                                      Text("Review", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                                                    ],
                                                  ),
                                                ),

                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    spacing: 10,
                                                    children: [
                                                      Row(
                                                        children: List.generate(
                                                          5, (index) => Icon(
                                                            Icons.star_rounded,
                                                            color: (
                                                                index < ratingStars.floor()) ? Colors.amber : AppColors.greyOne,
                                                            size: 34,
                                                        ),
                                                        ),
                                                      ),
                                                      Text("(${ratingStars.toStringAsFixed(1)})", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),)
                                                    ],
                                                  ),
                                                ),

                                                Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    IconButton(
                                                        onPressed: (){},
                                                        icon: Icon(Icons.remove_circle)
                                                    ),
                                                    Text("1"),
                                                    IconButton(
                                                        onPressed: (){},
                                                        icon: Icon(Icons.add_circle)
                                                    ),

                                                    Text("\$${item.price}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.primary),),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                                                  child: Row(
                                                    spacing: 20,
                                                    children: [
                                                      Flexible(
                                                          flex: 2,
                                                          child: RoundedButton(bgColor: AppColors.primary, textColor: AppColors.white, text: "Add to bag", onPressed: (){})
                                                      ),
                                                      Flexible(
                                                          flex: 1,
                                                          child: CustomOutlineButton(borderColor: AppColors.primary, textColor: AppColors.primary, text: "Buy Now", onPressed: (){})
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(height: 15,)
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Card(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                          item.image,
                                          height: 150,
                                          fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 100,
                                    child: Text(
                                      item.name,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600))),
                                  Text("\$${item.price.toString()}", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.primary))
                                ],
                              )
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              
              HeaderItem(header: "Best Vendors"),
              
              HeaderItem(header: "Authors")
            ],
          ),
        ),
      ),
    );
  }
}
