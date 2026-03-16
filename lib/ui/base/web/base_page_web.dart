import 'package:base_structure/ui/utils/widgets/common_app_bar_web.dart';
import 'package:flutter/material.dart';

class BasePageWeb extends StatelessWidget {
  final Widget child;
  final int appBarIndex;
  const BasePageWeb({super.key, this.appBarIndex = 0, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBarWeb(appBarIndex: appBarIndex,),
      body: CustomScrollView(
        slivers: [
          // Body
          SliverList(delegate: SliverChildListDelegate([child])),
          // Footer
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: AlignmentGeometry.bottomCenter,
              child: Placeholder()
            ),
          ),
        ],
      ),
    );
  }
}
