import 'dart:ui';

import 'package:flutter/material.dart';

abstract class Styles {
  static const lightColorScheme= ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278217312),
      surfaceTint: Color(4278217312),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4288606949),
      onPrimaryContainer: Color(4278198300),
      secondary: Color(4281493825),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4290048445),
      onSecondaryContainer: Color(4278198539),
      tertiary: Color(4287384160),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4294957538),
      onTertiaryContainer: Color(4281992989),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294245368),
      onSurface: Color(4279639324),
      onSurfaceVariant: Color(4282337607),
      outline: Color(4285495671),
      outlineVariant: Color(4290693574),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281020976),
      inversePrimary: Color(4286764489),
      primaryFixed: Color(4288606949),
      onPrimaryFixed: Color(4278198300),
      primaryFixedDim: Color(4286764489),
      onPrimaryFixedVariant: Color(4278210632),
      secondaryFixed: Color(4290048445),
      onSecondaryFixed: Color(4278198539),
      secondaryFixedDim: Color(4288271522),
      onSecondaryFixedVariant: Color(4279783723),
      tertiaryFixed: Color(4294957538),
      onTertiaryFixed: Color(4281992989),
      tertiaryFixedDim: Color(4294947272),
      onTertiaryFixedVariant: Color(4285543240),
      surfaceDim: Color(4292205529),
      surfaceBright: Color(4294245368),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916146),
      surfaceContainer: Color(4293521389),
      surfaceContainerHigh: Color(4293126887),
      surfaceContainerHighest: Color(4292732129),
    );

    static const darkColorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4286764489),
      surfaceTint: Color(4286764489),
      onPrimary: Color(4278204210),
      primaryContainer: Color(4278210632),
      onPrimaryContainer: Color(4288606949),
      secondary: Color(4288271522),
      onSecondary: Color(4278204696),
      secondaryContainer: Color(4279783723),
      onSecondaryContainer: Color(4290048445),
      tertiary: Color(4294947272),
      onTertiary: Color(4283702578),
      tertiaryContainer: Color(4285543240),
      onTertiaryContainer: Color(4294957538),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279112979),
      onSurface: Color(4292732129),
      onSurfaceVariant: Color(4290693574),
      outline: Color(4287206288),
      outlineVariant: Color(4282337607),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292732129),
      inversePrimary: Color(4278217312),
      primaryFixed: Color(4288606949),
      onPrimaryFixed: Color(4278198300),
      primaryFixedDim: Color(4286764489),
      onPrimaryFixedVariant: Color(4278210632),
      secondaryFixed: Color(4290048445),
      onSecondaryFixed: Color(4278198539),
      secondaryFixedDim: Color(4288271522),
      onSecondaryFixedVariant: Color(4279783723),
      tertiaryFixed: Color(4294957538),
      onTertiaryFixed: Color(4281992989),
      tertiaryFixedDim: Color(4294947272),
      onTertiaryFixedVariant: Color(4285543240),
      surfaceDim: Color(4279112979),
      surfaceBright: Color(4281612857),
      surfaceContainerLowest: Color(4278783758),
      surfaceContainerLow: Color(4279639324),
      surfaceContainer: Color(4279902496),
      surfaceContainerHigh: Color(4280625962),
      surfaceContainerHighest: Color(4281349685),
    );

  static const TextStyle productRowItemName=TextStyle(
  color:Color.fromRGBO(0,0,0,0.8),
  fontSize: 18,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal
);
 static const TextStyle productRowTotal=TextStyle(
  color:Color.fromRGBO(0,0,0,0.8),
  fontSize: 18,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.bold
); 
 // TextStyle
  
  static const TextStyle searchText = TextStyle( 
  color: Color.fromRGBO (0, 0, 0,1),
  fontSize: 14,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal,
);

static const TextStyle deliveryTimeLabel= TextStyle(
  color: Color (0xFFC2C2C2),
  fontWeight: FontWeight.w300,
);
static const TextStyle deliveryTime = TextStyle( 
  color:Colors.grey,
  );
}
