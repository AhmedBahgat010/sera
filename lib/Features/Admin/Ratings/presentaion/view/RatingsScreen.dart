import 'package:flutter/material.dart';
import 'package:sera/Features/Admin/Complaints/presentaion/view/widget/Container_Report.dart';
import 'package:sera/Features/Admin/Ratings/presentaion/view/widget/Container_Report.dart';


class RatingsScreen extends StatefulWidget {
  RatingsScreen({super.key});


  @override
  State<RatingsScreen> createState() => _RatingsScreenState();
}

class _RatingsScreenState extends State<RatingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User ratings and comments"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) => ContainerRatings(),
          ),
        )),
      ),
    );
  }
}
