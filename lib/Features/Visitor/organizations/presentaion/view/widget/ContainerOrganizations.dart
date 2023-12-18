import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sera/Core/Utils/App%20Colors.dart';
import 'package:sera/Core/Utils/App%20Textstyle.dart';
import 'package:sera/Core/Utils/Responsive.dart';

class ContainerOrganizations extends StatelessWidget {
  final String title;
  final String description;
  final Function()? ontap;
  final String image;

  const ContainerOrganizations({
    required this.title,
    required this.image,
    this.ontap,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQueryHelper.sizeFromHeight(context, 4),
      margin: const EdgeInsets.symmetric(vertical: 7),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryColor, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: AppColors.white),
      child: InkWell(
        onTap: ontap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
          child: Row(
              children: [
            Hero(
              tag: 'heroimage',
              child: SizedBox(
                width: MediaQueryHelper.sizeFromWidth(context, 3.5),
                height:MediaQueryHelper.sizeFromHeight(context, 1),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,

                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.w800
                        .copyWith(color: AppColors.black, fontSize: 20),
                  ),

                  Text(
                    description,
                    maxLines: 4,
                    style: AppTextStyles.lrTitles.copyWith(
                        color: AppColors.black,
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis),
                  ),

                  Row(
                    children: [
                      Icon(Iconsax.location5),
                      Text(
                        "Medina, Saudi Arabia",
                        maxLines: 4,
                        style: AppTextStyles.w800.copyWith(
                            color: AppColors.primaryColor,
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  )
                  
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
