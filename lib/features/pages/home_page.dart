import 'package:centralogic_assignment/features/blocs/home_page/bottom_nav_bar/navigation_bloc.dart';
import 'package:centralogic_assignment/features/blocs/home_page/bottom_nav_bar/navigation_event.dart';
import 'package:centralogic_assignment/features/blocs/home_page/bottom_nav_bar/navigation_state.dart';
import 'package:centralogic_assignment/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'home_fragments/cart_page_fragment.dart';
import 'home_fragments/category_page_fragment.dart';
import 'home_fragments/home_page_fragment.dart';
import 'home_fragments/profile_page_fragment.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => NavigationBloc(),
        child: BlocBuilder<NavigationBloc, NavigationState>(
            builder: (context, state){
              final pages = [
                HomePageFragment(),
                CategoryPageFragment(),
                CartPageFragment(),
                ProfilePageFragment()
              ];
              return Scaffold(
                body: pages[state.selectedIndex],
                bottomNavigationBar: BottomNavigationBar(
                  backgroundColor: AppColors.white,
                  elevation: 0,
                  enableFeedback: false,
                  selectedItemColor: AppColors.primary,
                  unselectedItemColor: AppColors.greyOne,
                  selectedFontSize: 16,
                  selectedLabelStyle: TextStyle(fontWeight: FontWeight.w700),
                  unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w700),
                  showUnselectedLabels: true,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: state.selectedIndex,
                  onTap: (index){
                    context.read<NavigationBloc>().add(SelectPage(index));
                  },
                  items: [
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset("assets/nav_bar_icons/home_icon.svg"),
                        activeIcon: SvgPicture.asset("assets/nav_bar_icons/home_icon_filled.svg"),
                        label: "Home"
                    ),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset("assets/nav_bar_icons/category_icon.svg"),
                        activeIcon: SvgPicture.asset("assets/nav_bar_icons/category_icon_filled.svg"),
                        label: "Category"
                    ),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset("assets/nav_bar_icons/cart_icon.svg"),
                        activeIcon: SvgPicture.asset("assets/nav_bar_icons/cart_icon_filled.svg"),
                        label: "Cart"
                    ),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset("assets/nav_bar_icons/profile_icon.svg"),
                        activeIcon: SvgPicture.asset("assets/nav_bar_icons/profile_icon_filled.svg"),
                        label: "Profile"
                    ),
                  ],
                ),
              );
            }
        ),
    );
  }
}
