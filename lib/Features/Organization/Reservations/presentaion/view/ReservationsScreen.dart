
import 'package:flutter/material.dart';
import 'package:sera/Features/Organization/Reservations/presentaion/view/widgets/DismissibleBackground.dart';
import 'package:sera/Features/Organization/Reservations/presentaion/view/widgets/leave_request.dart';
import '../../../../../Core/Utils/App Colors.dart';
import '../../../../../Core/Utils/Widgets/CustomTabBar/CustomTabBar.dart';
class ReservationsScreen extends StatefulWidget {
  const ReservationsScreen({super.key});

  @override
  State<ReservationsScreen> createState() => _ReservationsScreenState();
}

class _ReservationsScreenState extends State<ReservationsScreen> {
  int _currentTabIdx = 0;

  void _onTabChanged(int index) {
    if (index == _currentTabIdx) return;
    setState(() => _currentTabIdx = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(

          children: [
            CustomTabBar(
              backgroundColor: AppColors.white,
              disableShadow: true,
              tabs: const [
                'Pending',
                'Accepted',
                'Cancelled',
              ],
              selectedIndex: _currentTabIdx,
              onTabChanged: _onTabChanged,
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {

                },
              child: ListView.separated(
                padding: const EdgeInsets.all(24),
                itemCount: 5,

                separatorBuilder: (_, __) => const SizedBox(height: 24),
                itemBuilder: (context, index) {
                  return LeaveRequestCard(
                    state: _currentTabIdx,
                    childName: "Test Name",
                    dateType: DateTime.now(),
                    type: "test@gmail.com",
                    dateTime: DateTime.now(),
                    payIsLoading: false,
                    rejectIsLoading: true,
                  );
                },
              ),
            ))

          ],
        ),
      ),
    );
  }
}
