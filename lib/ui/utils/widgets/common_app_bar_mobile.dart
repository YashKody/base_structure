import 'package:base_structure/ui/utils/widgets/common_ink_well.dart';
import 'package:base_structure/ui/utils/widgets/common_text.dart';
import 'package:flutter/material.dart';

class CommonAppBarMobile extends StatelessWidget
    implements PreferredSizeWidget {

  /// string title
  final String? title;
  final Widget? titleWidget;

  final bool centerTitle;

  /// leading buttons
  final bool
  showBackButton; // show leading back button which navigation back to specific page
  final bool showDrawerButton; // show button which opens drawer
  final void Function()? onLeadingTap; // function when leading icon is pressed

  const CommonAppBarMobile({
    super.key,
    this.title,
    this.showBackButton = false,
    this.showDrawerButton = false,
    this.onLeadingTap, 
    this.titleWidget, 
    this.centerTitle = true,
  });

  Widget _getLeadingInkWell(BuildContext context) {
    return CommonInkWell(
      onTap: () {
        onLeadingTap ?? // perform onLeadingTap
          () {
            if (showDrawerButton) {
              // otherwise check if its a drawer icon
              Scaffold.of(context).openDrawer(); // then open drawer
            } else if (showBackButton) {
              Navigator.pop(
                context,
              ); // otherwise its back button hence go to prev page
            } else {
              null;
            }
          };
      },
      // child: showDrawerButton
      //         ? CommonSVG(svgPath: AppConstants.svgDrawerRoute, height: 20,) // show drawer svg
      //         : showBackButton
      //         ? Icon(Icons.arrow_back_ios_new) // show back icon
      //         : showGuestButton
      //         ? TextButton(
      //             // show guest text button
      //             onPressed: () {},
      //             child: CommonText(
      //               text: AppConstants.strGuest,
      //               color: AppColors.clrPinkF048C6,
      //               fontWeight: FontWeight.bold,
      //               decoration: TextDecoration.underline,
      //               decorationColor: AppColors.clrPinkF048C6,
      //             ),
      //           )
      //         : null,
    // )
      child: Placeholder()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: AppBar(
        leading: _getLeadingInkWell(context),

        title: titleWidget ?? (title != null ?
              CommonText(text: title!, fontWeight: FontWeight.bold,)
              : null), // show title otherwise leave empty

        centerTitle: centerTitle,

        actions: [
          
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
