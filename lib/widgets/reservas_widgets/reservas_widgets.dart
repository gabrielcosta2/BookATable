import 'package:flutter/material.dart';
import 'package:book_a_table/core/app_export.dart';

// ignore: must_be_immutable
class EightyoneItemWidget extends StatelessWidget {
  const EightyoneItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 30.h,
        vertical: 6.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        "12:00",
        style: TextStyle(
          color: theme.colorScheme.onPrimary.withOpacity(1),
          fontSize: 14.fSize,
          fontFamily: 'Arial Rounded MT Bold',
          fontWeight: FontWeight.w400,
        ),
      ),
      selected: false,
      backgroundColor: theme.colorScheme.secondaryContainer,
      selectedColor: theme.colorScheme.secondaryContainer,
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(
          15.h,
        ),
      ),
      onSelected: (value) {},
    );
  }
}
