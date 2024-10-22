import 'package:flutter/material.dart';

class ManageJobsWidget extends StatelessWidget {
  final String jobname;
  final String client;
  final String status;
  final GestureTapCallback onTap;
  final GestureTapCallback attendanceTap;
  final GestureTapCallback attendanceHistory;

  const ManageJobsWidget({
    super.key,
    required this.jobname,
    required this.client,
    required this.status,
    required this.onTap,
    required this.attendanceTap,
    required this.attendanceHistory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFC7C7C8),
          width: 1.4,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Client',
                  style: TextStyle(
                    color: Color(0xFF988363),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  width: 58,
                ),
                Expanded(
                  child: Text(
                    client,
                    style: const TextStyle(
                      color: Color(0xFF1E2964),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Job Name',
                  style: TextStyle(
                    color: Color(0xFF988363),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                Expanded(
                  child: Text(
                    jobname,
                    style: const TextStyle(
                      color: Color(0xFF1E2964),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Status',
                  style: TextStyle(
                    color: Color(0xFF988363),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  width: 55,
                ),
                Text(
                  status,
                  style: const TextStyle(
                    color: Color(0xFFA3CA3E),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: onTap,
              child: Container(
                height: 42,
                decoration: BoxDecoration(
                    color: const Color(0xFFA3CA3E),
                    borderRadius: BorderRadius.circular(12)),
                child: const Center(
                  child: Text(
                    'View Job Details',
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: attendanceTap,
                  child: const FittedBox(
                    child: DailyAttendaceAndHistory(
                      text: 'Daily Attendance',
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: attendanceHistory,
                    child: const DailyAttendaceAndHistory(
                        text: "Attendance History")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DailyAttendaceAndHistory extends StatelessWidget {
  const DailyAttendaceAndHistory({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 42,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFC7C7C8),
          width: 1.5,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              color: Color(0xFF7A7A7A),
              fontSize: 12,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
