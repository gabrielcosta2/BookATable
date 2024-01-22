import 'package:flutter/material.dart';
import 'package:book_a_table/core/app_export.dart';

// ignore: must_be_immutable
class PginaprincipaleditarItemWidget extends StatelessWidget {
  const PginaprincipaleditarItemWidget({Key? key})
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
          Container(
            height: 89.v,
            width: 161.h,
            margin: EdgeInsets.only(top: 15.v),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Opacity(
                  opacity: 0.5,
                  child: CustomImageView(
                    imagePath: ImageConstant.imgImage8,
                    height: 89.v,
                    width: 161.h,
                    radius: BorderRadius.circular(
                      10.h,
                    ),
                    alignment: Alignment.center,
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgVector,
                  height: 34.v,
                  width: 42.h,
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 18.h,
              bottom: 24.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Menu do Dia",
                  style: CustomTextStyles.titleLargeLightgreen800,
                ),
                SizedBox(height: 23.v),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 118.h,
                      child: Text(
                        "Prato 1:\nPolvo á Lagareiro",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: CustomTextStyles.bodyMediumDeeporange800,
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgVector,
                      height: 16.v,
                      width: 19.h,
                      margin: EdgeInsets.only(
                        left: 8.h,
                        top: 8.v,
                        bottom: 11.v,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
