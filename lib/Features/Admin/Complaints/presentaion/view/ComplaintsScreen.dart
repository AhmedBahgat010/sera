import 'package:flutter/material.dart';
import 'package:sera/Features/Admin/Complaints/presentaion/view/widget/Container_Report.dart';


class ComplaintsScreen extends StatefulWidget {
  ComplaintsScreen({super.key});


  @override
  State<ComplaintsScreen> createState() => _ComplaintsScreenState();
}

class _ComplaintsScreenState extends State<ComplaintsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complaints and responses"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) => ContainerComplaint(),
          ),
        )),
      ),
    );
  }
}
