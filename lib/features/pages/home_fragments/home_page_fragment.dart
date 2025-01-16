import 'package:centralogic_assignment/features/blocs/home_page/carousel/carousel_bloc.dart';
import 'package:centralogic_assignment/features/blocs/home_page/carousel/carousel_event.dart';
import 'package:centralogic_assignment/features/blocs/home_page/carousel/carousel_state.dart';
import 'package:centralogic_assignment/features/widgets/author_profile.dart';
import 'package:centralogic_assignment/features/widgets/book_details_sheet.dart';
import 'package:centralogic_assignment/features/widgets/custom_carousel.dart';
import 'package:centralogic_assignment/features/widgets/header_item.dart';
import 'package:centralogic_assignment/features/widgets/vendor_card.dart';
import 'package:centralogic_assignment/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePageFragment extends StatelessWidget {
  const HomePageFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CarouselBloc()..add(FetchCarouselItems()),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          surfaceTintColor: AppColors.white,
          leading: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/search_icon.svg"),
            ),
          ),
          title: Text(
            "Home",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: SvgPicture.asset("assets/notification_icon.svg"),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCarousel(
                  items: [
                    CarouselItem(
                        title: "Special Offer",
                        subtitle: "Discount 25%",
                        buttonText: "Order Now",
                        imagePath: "assets/book_covers/dark-matter.jpg"),
                    CarouselItem(
                        title: "Freshly Added",
                        subtitle: "Read Now",
                        imagePath: "assets/book_covers/the-kite-runner.jpg"),
                    CarouselItem(
                        title: "Most Read",
                        imagePath: "assets/book_covers/the-subtle-art.jpg"),
                  ],
                ),
                // carousel indicator

                HeaderItem(header: "Top of Week"),
                BlocBuilder<CarouselBloc, CarouselState>(
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
                        clipBehavior: Clip.none,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.items.length,
                        itemBuilder: (context, index) {
                          final item = state.items[index];
                          return GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                showDragHandle: true,
                                backgroundColor: AppColors.white,
                                builder: (context) => BottomSheet(
                                  onClosing: () {},
                                  builder: (context) => BookDetailsSheet(
                                    image: item.image,
                                    name: item.name,
                                    description: item.description,
                                    vendorImage: item.vendor_image,
                                    price: item.price,
                                    rating: item.rating,
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
                                  SizedBox(
                                    width: 100,
                                    child: Text(
                                      item.name,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Text(
                                    "\$${item.price.toString()}",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.primary),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                HeaderItem(header: "Best Vendors"),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  child: Row(
                    spacing: 15,
                    children: [
                      VendorCard(vendor: "assets/vendor_covers/one.svg"),
                      VendorCard(vendor: "assets/vendor_covers/two.svg"),
                      VendorCard(vendor: "assets/vendor_covers/three.svg"),
                      VendorCard(vendor: "assets/vendor_covers/four.svg"),
                      VendorCard(vendor: "assets/vendor_covers/one.svg"),
                      VendorCard(vendor: "assets/vendor_covers/two.svg"),
                    ],
                  ),
                ),
                HeaderItem(header: "Authors"),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  child: Row(
                    spacing: 20,
                    children: [
                      AuthorProfile(profileImage: "assets/author_covers/author_one.png", name: "John Freeman", about: "Writer"),
                      AuthorProfile(profileImage: "assets/author_covers/author_two.png", name: "Tess Gunty", about: "Novelist"),
                      AuthorProfile(profileImage: "assets/author_covers/author_three.png", name: "Richard Perston", about: "Writer"),
                    ],
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}