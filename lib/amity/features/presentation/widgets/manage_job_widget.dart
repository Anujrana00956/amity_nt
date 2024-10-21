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
      height: 32,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFFC7C7C8),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Client',
                  style: TextStyle(
                    color: Color(0xFF988363),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  width: 14,
                ),
                Expanded(
                  child: Text(
                    client,
                    style: const TextStyle(
                      color: Color(0xFF1E2964),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 1.5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Job Name',
                  style: TextStyle(
                    color: Color(0xFF988363),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                Expanded(
                  child: Text(
                    jobname,
                    style: const TextStyle(
                      color: Color(0xFF1E2964),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 1.5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Status',
                  style: TextStyle(
                    color: Color(0xFF988363),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  width: 13,
                ),
                Text(
                  status,
                  style: const TextStyle(
                    color: Color(0xFFA3CA3E),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            GestureDetector(
              onTap: onTap,
              child: Container(
                height: 5,
                decoration: BoxDecoration(
                    color: const Color(0xFFA3CA3E),
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text(
                    'View Job Details',
                    style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 10,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 1.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: attendanceTap,
                  child: Container(
                    height: 5,
                    width: 36,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color(0xFFC7C7C8),
                        width: 1,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Daily Attendance',
                        style: TextStyle(
                            color: Color(0xFF7A7A7A),
                            fontSize: 10,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: attendanceHistory,
                  child: Container(
                    height: 5,
                    width: 36,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color(0xFFC7C7C8),
                        width: 1,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Attendance History',
                        style: TextStyle(
                            color: Color(0xFF7A7A7A),
                            fontSize: 10,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
