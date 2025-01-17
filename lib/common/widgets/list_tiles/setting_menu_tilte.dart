import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';

class TSettingMenuTile extends StatelessWidget {
  const TSettingMenuTile({super.key, 
  required this.icon,
   required this.title, 
    this.subTitle="", 
    this.trailing,
    this.onTap
    });


    final IconData icon;
    final String title ,subTitle;
    final Widget? trailing;
    final VoidCallback ?onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: TColors.primary, size: 28,),
      title: Text( title,style: Theme.of(context).textTheme.titleMedium,),
      subtitle: Text(subTitle,style :Theme.of(context).textTheme.labelMedium),
      trailing: trailing,
      onTap: onTap,
    );
  }
}