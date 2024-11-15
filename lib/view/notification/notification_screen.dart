import 'package:bellaryapp/common/widgets/custom_scaffold.dart';
import 'package:bellaryapp/providers/notification_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../common/widgets/appbars/appbar_common.dart';
import '../../common/widgets/text.dart';
import '../../theme/palette.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const AppBarCommon(
        title: "Notifications",
        backgroundColor: Palette.primary,
      ),
      body: Consumer<NotificationProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.notifications.length,
            itemBuilder: (context, index) {
              final notification = provider.notifications[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.grey.shade300,
                  child: const Icon(Icons.store, color: Colors.black),
                ),
                title: TextCustomtranslate(notification.shopName),
                subtitle: TextCustomtranslate(notification.message),
                trailing:
                    //ButtonMini(onPressed: () {}, child: child),
                    OutlinedButton.icon(
                  onPressed: () {
                    // Handle chat button press
                  },
                  icon: const Icon(Icons.chat_bubble_outline_rounded,
                      size: 16, color: Palette.primary),
                  label: const TextCustomtranslate(
                    'Chat',
                    color: Palette.primary,
                  ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                        Colors.white), // Background color for the button
                    padding: WidgetStateProperty.all(const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4)), // Adjust padding
                    side: WidgetStateProperty.all(const BorderSide(
                        color: Colors.blue,
                        width: 1)), // Border color and width
                    shape: WidgetStateProperty.all(const RoundedRectangleBorder(
                      borderRadius: BorderRadius
                          .zero, // Rectangular shape with no rounding
                    )),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
