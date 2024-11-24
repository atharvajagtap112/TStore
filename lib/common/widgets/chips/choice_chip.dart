import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/containers/circular_container.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/helpers/helper_function.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key, 
    required this.text,
    required this.selected,
    this.onSelected,
  });
   final String text;
   final bool selected;
   final void Function(bool)? onSelected;
  @override
  Widget build(BuildContext context) {
    final isColor=THelperFunctions.getColor(text)!=null;
    return Theme(
      data: Theme.of(context).copyWith( canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor? const SizedBox(): Text(text),
        selected: selected,
        onSelected: (value) => onSelected,
        labelStyle:TextStyle(color:selected?TColors.white:null ),
        //add icon or any widget below the tick
        avatar:isColor? TCircularContainer(width: 50,height: 50,backgroundColors:THelperFunctions.getColor(text)!) :null,
        //Make the icon in the center
        labelPadding: isColor? const EdgeInsets.all(0):null,
        padding:isColor?  const EdgeInsets.all(0):null,
        shape: isColor?const CircleBorder():null,
        backgroundColor: isColor?THelperFunctions.getColor(text):null,
        ),
    );
       
      
  }
}