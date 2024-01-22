import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeOnPrimary => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(1),
        fontSize: 18.fSize,
      );
  static get bodyLargeOnPrimary_1 => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(1),
      );
  static get bodyLargeSecondaryContainer => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.secondaryContainer,
        fontSize: 18.fSize,
      );
  static get bodyMedium13 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 13.fSize,
      );
  static get bodyMedium15 => theme.textTheme.bodyMedium!
      .copyWith(fontSize: 15.fSize, decoration: TextDecoration.underline);

  static get bodyMediumDeeporange800 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.deepOrange800,
      );
  static get bodyMediumLightgreen800 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.lightGreen800,
      );
  static get bodyMediumOrange300 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.orange300,
        fontSize: 15.fSize,
      );
  static get bodyMediumSecondaryContainer =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.secondaryContainer,
        fontSize: 15.fSize,
      );
  static get bodyMediumSecondaryContainer13 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.secondaryContainer,
        fontSize: 13.fSize,
      );
  static get bodyMediumSecondaryContainer15 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.secondaryContainer,
        fontSize: 15.fSize,
      );
  static get bodyMediumSecondaryContainer_1 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.secondaryContainer,
      );
  // Headline text style
  static get headlineSmallSecondaryContainer =>
      theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.secondaryContainer,
        fontSize: 25.fSize,
      );
  // Title text style
  static get titleLargeArchivoBlackOnPrimary =>
      theme.textTheme.titleLarge!.archivoBlack.copyWith(
        color: theme.colorScheme.onPrimary.withOpacity(1),
      );
  static get titleLargeLightgreen800 => theme.textTheme.titleLarge!.copyWith(
        color: appTheme.lightGreen800,
      );
}

extension on TextStyle {
  TextStyle get archivoBlack {
    return copyWith(
      fontFamily: 'Archivo Black',
    );
  }
}
