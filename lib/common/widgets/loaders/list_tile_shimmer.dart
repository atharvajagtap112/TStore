import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/loaders/t_shimmerLoader.dart';

class TListTileShimmer extends StatelessWidget {
  const TListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row (children: [ 
          TShimmerEffect(width: 50, height: 50, radius: 50,),
           SizedBox( width: TSizes.spaceBtwItems,),

           Column(
               children: [
                     TShimmerEffect(width: 100, height: 15),
                     SizedBox( width: TSizes.spaceBtwItems,),
                     TShimmerEffect(width: 80, height: 12),])
                     ],)
      ],
    );
  }
}