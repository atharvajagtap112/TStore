import 'package:flutter/material.dart';

class TProductTitleText extends StatelessWidget {
  const TProductTitleText({
    super.key, 
    required this.text, 
    this.textAlign=TextAlign.left, 
     this.maxLines=2, 
     this.smallSize=false,
  });
  final String text;
  final TextAlign? textAlign;
  final int? maxLines;
  final bool smallSize;
  @override
  Widget build(BuildContext context) {
    return Text(
       text, style: smallSize? Theme.of(context).textTheme.labelSmall: Theme.of(context).textTheme.titleSmall ,
       textAlign: textAlign, 
       maxLines: maxLines,
       overflow: TextOverflow.ellipsis,
    );
  }
}

