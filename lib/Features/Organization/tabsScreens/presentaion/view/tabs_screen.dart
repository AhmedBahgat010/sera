
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_lazy_indexed_stack/src/flutter_lazy_indexed_stack.dart';
import 'package:sera/Features/Organization/Profile/presentaion/view/ProfileScreen.dart';
import 'package:sera/Features/Organization/Reservations/presentaion/view/ReservationsScreen.dart';
import 'package:sera/Features/Organization/home/presentaion/view/HomeOrganizationScreen.dart';
import 'package:sera/Features/Organization/tabsScreens/presentaion/view/widgets/custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';

import '../manger/tabs_cubit.dart';
import 'widgets/custom_bottom_navigation_bar/custom_bottom_navigation_bar_item.dart';

class TabsScreen extends StatelessWidget {
  static const routeName = '/main';

  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TabsCubit()),

      ],
      child: BlocBuilder<TabsCubit, TabsState>(
        builder: (context, state) {
          return Scaffold(
            body: LazyIndexedStack(

              index: state.index,
              children:  const [
                HomeOrganizationScreen(),
                ReservationsScreen(),
                ProfileScreen(),

              ],
            ),
            extendBody: true,
            bottomNavigationBar: CustomBottomNavigationBar(

              selectedIndex: state.index,
              onTap: (index) {
                context.read<TabsCubit>().changeTab(index);
              },
              items: [
                CustomBottomNavigationBarItem(
                  selected: state.index == 0,
                  label: 'Home',
                  icon: Iconsax.home,
                  coloredIcon: Iconsax.home1,
                ),
                CustomBottomNavigationBarItem(
                  selected: state.index == 1,
                  label: 'Reservations',
                  icon: Iconsax.timer4,
                  coloredIcon: Iconsax.graph5,
                ),
      CustomBottomNavigationBarItem(
                  selected: state.index == 2,
                  label: 'Profile',
                  icon: Iconsax.user,
                  coloredIcon: Iconsax.graph5,
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}
