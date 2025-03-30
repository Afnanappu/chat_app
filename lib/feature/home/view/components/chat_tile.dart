import 'package:chat_app/core/theme/app_color.dart';
import 'package:chat_app/core/utils/date_time_format.dart';
import 'package:chat_app/feature/home/models/chat_model.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({
    super.key,
    required this.chat,
    required this.isVisible,
    this.onTap,
  });

  final ChatModel chat;
  final bool isVisible;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      leading: CircleAvatar(
        foregroundImage: AssetImage('assets/icons/person.png'),

        radius: 30,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              chat.chatId,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            AppDateTimeFormat.timeWithTrailing(chat.lastMessageTime),
            style: TextStyle(
              color:
                  isVisible ? AppColor.secondaryDark : AppColor.textPrimaryGrey,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              chat.lastMessage,
              style: TextStyle(
                color: AppColor.textPrimaryGrey,
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          Visibility(
            visible: isVisible,
            child: Badge.count(
              count: 3,
              backgroundColor: AppColor.secondaryDark,
              padding: EdgeInsets.all(1.3),
            ),
          ),
        ],
      ),
    );
  }
}
