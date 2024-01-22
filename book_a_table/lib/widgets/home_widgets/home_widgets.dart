import 'package:flutter/material.dart';
import 'package:book_a_table/core/app_export.dart';

// ignore: must_be_immutable
class PGinaprincipalItemWidget extends StatelessWidget {
  const PGinaprincipalItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 1.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgImage8,
            height: 89.v,
            width: 161.h,
            radius: BorderRadius.circular(
              10.h,
            ),
            margin: EdgeInsets.only(top: 14.v),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 18.h,
              bottom: 24.v,
            ),
            child: Column(
              children: [
                Text(
                  "Menu do Dia",
                  style: CustomTextStyles.titleLargeLightgreen800,
                ),
                SizedBox(height: 23.v),
                SizedBox(
                  width: 118.h,
                  child: Text(
                    "Prato 1:\nPolvo á Lagareiro",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.bodyMediumDeeporange800,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
