import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

class TRatingProgressIndicator extends StatelessWidget {
  const TRatingProgressIndicator({
    super.key, required this.text, required this.value,
  });
  final String text;
  final double value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,//lets assume overall is 12 you can take any
          child: Text(text, style: Theme.of(context).textTheme
          .bodyMedium,),
        ),
                      
        Expanded(
          flex:11 ,
          child: SizedBox(
            width: THelperFunctions.screenWidth()*0.8,
            child: LinearProgressIndicator(// these will required infinite width
              minHeight: 11,
              value: value,
              backgroundColor: TColors.grey,
              borderRadius: BorderRadius.circular(7),
              valueColor:const AlwaysStoppedAnimation( TColors.primary),
            ),
          ),
        )
      ],
    );
  }
}