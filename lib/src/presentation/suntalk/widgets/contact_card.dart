import 'package:flutter/material.dart';
import 'package:flutter_sunmate/src/core/constants/colors.dart';

class ContactCard extends StatefulWidget {
  final dynamic imageUrl;
  final String userName;
  final String lastMessage;
  final VoidCallback onTap;
  const ContactCard({
    super.key,
    required this.imageUrl,
    required this.userName,
    required this.lastMessage,
    required this.onTap,
  });

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: const BoxDecoration(
            color: AppColors.white,
            border: Border(
                bottom: BorderSide(width: 1.5, color: AppColors.lightBlue))),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: widget.imageUrl != null &&
                        widget.imageUrl!.toString().isNotEmpty
                    ? Image.network(
                        widget.imageUrl,
                        width: 44,
                        height: 44,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/images/avatar-place-holder.png',
                        width: 44,
                        height: 44,
                        fit: BoxFit.cover,
                      )),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.userName,
                    maxLines: 1,
                    style: const TextStyle(
                      color: AppColors.darkBlue,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    widget.lastMessage,
                    maxLines: 1,
                    style: const TextStyle(
                      color: AppColors.grey,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
