import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:centralogic_assignment/themes/colors.dart';

class CustomCarousel extends StatelessWidget {
  final List<CarouselItem> items;

  const CustomCarousel({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController();
    final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);
    
    return CarouselSlider(
      options: CarouselOptions(
        height: 150,
        viewportFraction: 1.0,
        autoPlay: false,
        enableInfiniteScroll: false,
      ),
      items: items.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: AppColors.greyTwo,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left text section
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                        Text(item.subtitle??''),
                        FilledButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(AppColors.primary),
                          ),
                          child: Text(
                            item.buttonText??'View',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Right image section
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset(
                      item.imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class CarouselItem {
  final String title;
  final String? subtitle;
  final String? buttonText;
  final String imagePath;

  CarouselItem({
    required this.title,
    this.subtitle,
    this.buttonText,
    required this.imagePath,
  });
}