import 'package:base_structure/framework/controller/base/base_controller.dart';
import 'package:base_structure/ui/utils/themes/app_colors.dart';
import 'package:base_structure/ui/utils/widgets/common_ink_well.dart';
import 'package:base_structure/ui/utils/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommonAppBarWeb extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  final int appBarIndex;
  const CommonAppBarWeb({super.key, this.appBarIndex = 0});

  @override
  ConsumerState<CommonAppBarWeb> createState() => _CommonAppBarWebState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CommonAppBarWebState extends ConsumerState<CommonAppBarWeb> {
  Widget _appBarTitles({
    required String text,
    bool isSelected = false,
    VoidCallback? onTap,
  }) {
    return CommonInkWell(
      onTap: onTap ?? () {},
      child: CommonText(
        text: text,
        color: isSelected ? AppColors.clrBlack000000 : AppColors.clrGreyB5B5B5,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final BaseController baseController = ref.watch(baseControllerProvider);
    return AppBar(
      backgroundColor: AppColors.clrWhiteFFFFFF,
      leading: Padding(
        padding: const EdgeInsets.only(left: 50.0), // padding from the left
        child: Placeholder() // Logo of the app
      ),
      leadingWidth:
          MediaQuery.of(context).size.width *
          0.15, // allows the leading widget to take more width
      title: Row(
        // Center titles  of the app bar
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 30,
        children: List.generate(baseController.screens.length, (index) {
          return _appBarTitles(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                settings: RouteSettings(
                  name: baseController.screens[index].title,
                ),
                builder: (context) => baseController.screens[index].body,
              ),
            ),
            text: baseController.screens[index].title,
            isSelected: index == widget.appBarIndex,
          );
        }),
      ),
      actions: [
        
      ],
    );
  }
}
