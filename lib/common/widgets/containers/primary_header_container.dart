import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/containers/circular_container.dart';
import 'package:t_store/common/widgets/curved_edges/curved_edges_widget.dart';

import 'package:t_store/utils/constants/colors.dart';


class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key, required this.child,
  });
   final Widget child;
  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      
      child: Container(
            color: TColors.primary,
            
            child: Stack(
                        children: [
                    Positioned(
                      top: -150,
                      right: -250,
                      child: TCircularContainer(
                      backgroundColors: TColors.textWhite.withOpacity(0.1),
                       ),
                    ),
            
            
                    Positioned(
                        top: 100,
                      right: -300,
                      child: TCircularContainer(
                        backgroundColors: TColors.textWhite.withOpacity(0.1)
                      ),
                    ),
                    child
                        ],
            ),
          ),
    );
  }
}