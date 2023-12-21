import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../Core/Utils/App Colors.dart';
import '../../../../../../Core/Utils/App Textstyle.dart';

class ListTileProfile extends StatelessWidget {
  const ListTileProfile({Key? key, this.ontap, required this.color,  this.colorarrow=Colors.black, required this.title, required this.icon}) : super(key: key);
final Function()? ontap;
final String title;
final Color color;
final Color colorarrow;
final IconData icon;
  @override
  Widget build(BuildContext context) {
    return     Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        onTap: ontap,
        leading: CircleAvatar(
            backgroundColor: color,
            radius: 21,
            child: Icon(
              icon,
              color: AppColors.white,
              size: 25,
            )),
        title: Text(
          title,
          style: AppTextStyles.lrTitles.copyWith(fontSize: 24),
        ),
        trailing:  Icon(Iconsax.arrow_right_3,color: colorarrow,),
      ),
    );
  }
}
