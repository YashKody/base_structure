import 'package:base_structure/framework/controller/base/base_controller.dart';
import 'package:base_structure/ui/home/home_page.dart';
import 'package:base_structure/ui/utils/themes/app_colors.dart';
import 'package:base_structure/ui/utils/widgets/common_app_bar_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class BasePageMobile extends ConsumerWidget {
  final Widget bodyWidget;
  final bool showAppBar;
  final bool showBottomNavBar;
  final int? bottomBarIndex;
  final bool canPop;
  final String? title;
  final bool showBackButton;
  final bool showDrawerButton;
  final void Function()? onLeadingTap;
  final Widget? centerTitleWidget;
  const BasePageMobile({
    super.key,
    this.title,
    this.showAppBar = true,
    this.showBackButton = false,
    this.showDrawerButton = false,
    this.onLeadingTap,
    required this.bodyWidget,
    this.bottomBarIndex,
    this.canPop = true,
    this.showBottomNavBar = false,
    this.centerTitleWidget,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final BaseController baseController = ref.watch(baseControllerProvider);
    return PopScope(
      canPop: canPop,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (bottomBarIndex == 0) {
          SystemNavigator.pop();
        }
        if (bottomBarIndex! > 0) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
            (route) => false,
          );
        }
      },
      child: Container(
        color: AppColors.clrWhiteFFFFFF,
        child: SafeArea(
          child: Scaffold(
            drawer: Drawer(),
            appBar: showAppBar
                ? CommonAppBarMobile(
                    title: title,
                    showBackButton: showBackButton,
                    showDrawerButton: showDrawerButton,
                    onLeadingTap: onLeadingTap,
                    // showSkip: showSkip,
                    // showClearAll: showClearAll,
                    // showChangeLanguage: showChangeLanguage,
                    // showNotifications: showNotifications,
                    // showFavorite: showFavorite,
                    // showFilters: showFilters,
                    // showGuestButton: showGuestButton,
                    // onSkipTap: onSkipTap,
                    // onChangeLanguage: onChangeLanguage,
                    titleWidget: centerTitleWidget,
                  )
                : null,

            body: bodyWidget,

            bottomNavigationBar: Visibility(
              visible: showBottomNavBar,
              child: BottomNavigationBar(
                elevation: 0,
                selectedItemColor: AppColors.clrBlack000000,
                selectedLabelStyle: TextStyle(color: AppColors.clrBlack000000),
                unselectedItemColor: AppColors.clrGreyB5B5B5,
                unselectedLabelStyle: TextStyle(color: AppColors.clrGreyB5B5B5),
                showUnselectedLabels: true,
                items: baseController.screens
                    .map(
                      (screen) => BottomNavigationBarItem(
                        icon: screen.icon,
                        label: screen.title,
                        backgroundColor: AppColors.clrWhiteFFFFFF,
                      ),
                    )
                    .toList(),
                currentIndex: bottomBarIndex ?? 0,
                onTap: (value) {
                  if (value == bottomBarIndex) return;
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          baseController.screens[value].body,
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
