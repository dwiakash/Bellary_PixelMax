import 'package:bellaryapp/services/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScheduleTimeModal extends StatefulWidget {
  const ScheduleTimeModal({super.key});

  @override
  State<ScheduleTimeModal> createState() => _ScheduleTimeModalState();
}

class _ScheduleTimeModalState extends State<ScheduleTimeModal> {
  int? _selectedIndex; // Variable to keep track of the selected index

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with title and close button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Schedule your Time", // Title
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),

          // Divider to separate the header from the content
          const Divider(),

          // Labels for Date, From, To
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 8.0), // Space around the labels
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Transform.translate(
                        offset: Offset(8, -3),
                        child: Text("Date",
                            textAlign: TextAlign.left))), // Date label
                Expanded(
                    child: Text("From",
                        textAlign: TextAlign.center)), // From label

                // Apply a slight shift to "To"
                Expanded(
                  child: Transform.translate(
                    offset: Offset(-30, -3), // Move left by 10px, up by 5px
                    child: Text("To", textAlign: TextAlign.right), // To label
                  ),
                ),
              ],
            ),
          ),

          // Divider to separate the labels from the list
          const Divider(),

          // Expanded ListView for the time slots
          Expanded(
            child: ListView.builder(
              itemCount: 10, // The number of time slots to show
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index; // Update selected index
                    });
                  },
                  leading: const Text("Today"), // Date

                  title: Row(
                    children: [
                      // This makes "Now" centered
                      const Expanded(
                        child: Center(
                          child: Text("Now"), // Start time centered
                        ),
                      ),
                      // This aligns "3:30pm" to the right
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text("3:30pm"), // End time aligned right
                      ),
                    ],
                  ),

                  // Highlight the selected item with a background color
                  tileColor: _selectedIndex == index
                      ? Colors.lightBlueAccent.withOpacity(0.5)
                      : null,
                );
              },
            ),
          ),

          // Bottom Button with a bordered design
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  // Navigate to the reschedule confirmation page
                  context.push(Routes.bookingreschdule);
                },
                child: Container(
                  padding:
                      const EdgeInsets.all(8.0), // Padding inside the border
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue, // Border color
                      width: 2.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(4.0), // Rounded corners
                  ),
                  child: const Text(
                    "Today - Till 3:30pm",
                    style: TextStyle(
                      color: Colors.lightBlueAccent, // Text color
                      fontWeight: FontWeight.bold, // Text bold
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
