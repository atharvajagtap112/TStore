import 'package:flutter/widgets.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/loaders/t_shimmerLoader.dart';

class TCategoryLoader extends StatelessWidget {
  const TCategoryLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
     height: 80,
      child: ListView.builder(
       shrinkWrap: true,
       scrollDirection: Axis.horizontal,
       itemCount: 6,
       itemBuilder: (_, index) {
         return const Padding(
           padding: EdgeInsets.only(right: TSizes.sm),
           child: Column(
            children: [
               TShimmerEffect(width: 55, height: 55, radius: 55,),
                 SizedBox(height:TSizes.spaceBtwItems ,),
                 TShimmerEffect(width: 55, height: 8)
            ],
           ),
         );
           
       },
      ),
    );
  }
}