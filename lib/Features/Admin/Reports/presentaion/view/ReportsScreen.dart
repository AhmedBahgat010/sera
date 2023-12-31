import 'package:flutter/material.dart';
import 'package:sera/Features/Admin/Reports/presentaion/view/widget/Container_Report.dart';


class ReportsScreen extends StatefulWidget {
  ReportsScreen({super.key});


  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reports"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) => ContainerReport(),
          ),
        )),
      ),
    );
  }
}
