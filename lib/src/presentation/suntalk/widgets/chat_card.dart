import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';

class ChatCard extends StatelessWidget {
  final String message;
  final bool isImage;
  final int userId;
  final int timestamp;
  final bool isSender;

  const ChatCard({
    super.key,
    required this.message,
    required this.isImage,
    required this.userId,
    required this.timestamp,
    required this.isSender,
  });

  @override
  Widget build(BuildContext context) {
    final formattedTimestamp =
        DateTime.fromMillisecondsSinceEpoch(timestamp * 1000).toLocal();

    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: FractionallySizedBox(
          alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
          widthFactor: 0.8,
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            color: isSender ? AppColors.primary : Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(12.0),
                topRight: const Radius.circular(12.0),
                bottomLeft: Radius.circular(isSender ? 12.0 : 0),
                bottomRight: Radius.circular(isSender ? 0 : 12.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Pesan dan waktu
                  Expanded(
                    child: Column(
                      crossAxisAlignment: isSender
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        if (!isSender)
                          Text(
                            'User $userId',
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),

                        const SizedBox(height: 5),
                        // Isi pesan
                        if (isImage)
                          Image.network(message)
                        else
                          Text(message,
                              style: TextStyle(
                                color: isSender
                                    ? AppColors.lightBlue
                                    : AppColors.black,
                              )),
                        const SizedBox(height: 8),
                        // Timestamp
                        Text(
                          'Sent at ${formattedTimestamp.hour}:${formattedTimestamp.minute}',
                          style: TextStyle(
                              color: isSender
                                  ? AppColors.lightBlue
                                  : Colors.grey.shade600,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
