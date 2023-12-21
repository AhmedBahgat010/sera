
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../Core/Utils/App Colors.dart';
import '../../../../../../Core/Utils/App Textstyle.dart';

Widget DismissibleBackground() {
  return Container(
    padding: EdgeInsets.only(right: 10),
    decoration: BoxDecoration( color: AppColors.red,borderRadius: BorderRadius.circular(15)),

    child: Align(
      alignment: Alignment.centerRight,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Icon(
            Icons.delete,
            color: AppColors.white,
          ),
          Text(
            " Delete",
            style: AppTextStyles.bold.copyWith(color: AppColors.white),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    ),
  );
}
