import 'package:bellaryapp/services/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScheduleTimeModal extends StatefulWidget {
  @override
  _ScheduleTimeModalState createState() => _ScheduleTimeModalState();
}

class _ScheduleTimeModalState extends State<ScheduleTimeModal> {
  int? _selectedIndex; // Variable to keep track of the selected index
  String _selectedTime = "Today - Till 3:30pm"; // Default selected time

  // Mock data for time slots (replace with your actual data)
  final List<Map<String, String>> timeSlots = [
    {"date": "Today", "from": "Now", "to": "3:30pm"},
    {"date": "Tomorrow", "from": "4:00pm", "to": "4:00pm"},
    {"date": "05/08", "from": "4:30pm", "to": "4:30pm"},
    {"date": "05/08", "from": "4:00pm", "to": "4:00pm"},
    {"date": "05/08", "from": "4:30pm", "to": "4:30pm"},
    {"date": "05/08", "from": "4:00pm", "to": "4:00pm"},
  ];

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
              Text(
                "Schedule your Time",
                style: const TextStyle(
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
          const Divider(), // Divider line

          // Section headers for "Date", "From", and "To"
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Date",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                Text(
                  "From",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                Text(
                  "To",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),

          // List of time slots
          Expanded(
            child: ListView.builder(
              itemCount: timeSlots.length,
              itemBuilder: (BuildContext context, int index) {
                final timeSlot = timeSlots[index];
                final isSelected = _selectedIndex == index; // Check if selected

                return ListTile(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index; // Update selected index
                      _selectedTime =
                          "${timeSlot['date']} - Till ${timeSlot['to']}"; // Update selected time
                    });
                  },
                  // Display the date, from and to times for each item
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        timeSlot["date"]!,
                        style: TextStyle(
                          color: isSelected ? Colors.black : Colors.grey,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.w400,
                        ),
                      ),
                      Text(
                        timeSlot["from"]!,
                        style: TextStyle(
                          color: isSelected ? Colors.black : Colors.grey,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.w400,
                        ),
                      ),
                      Text(
                        timeSlot["to"]!,
                        style: TextStyle(
                          color: isSelected ? Colors.black : Colors.grey,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  tileColor: isSelected
                      ? Colors.lightBlueAccent.withOpacity(0.5)
                      : null, // Highlight the selected item
                );
              },
            ),
          ),

          // Confirmation button at the bottom
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
                      const EdgeInsets.all(12.0), // Padding inside the border
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue, // Border color
                      width: 2.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  ),
                  child: Text(
                    _selectedTime, // Dynamic selected time display
                    style: const TextStyle(
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
