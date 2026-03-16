import 'package:base_structure/ui/utils/app_constants.dart';
import 'package:base_structure/ui/utils/widgets/common_image.dart';
import 'package:base_structure/ui/utils/widgets/common_text.dart';
import 'package:flutter/material.dart';
class CommonEmptyState extends StatelessWidget {
  final String? text;
  const CommonEmptyState({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonImage.asset(
            imageURL: AppConstants.imgEmptyState,
            width: MediaQuery.heightOf(context) * 0.5,
            height: MediaQuery.heightOf(context) * 0.5,
            boxFit: BoxFit.fill,
          ),
          CommonText(text: text ?? AppConstants.strEmptyContents, fontSize: 20,),
        ],
      ),
    );
  }
}
