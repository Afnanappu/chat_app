import 'dart:developer';

import 'package:chat_app/core/theme/app_color.dart';
import 'package:flutter/material.dart';

class SearchBarForHome extends StatelessWidget {
  SearchBarForHome({super.key});
  final focusNode = FocusNode();
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SearchBar(
        hintText: 'Search...',
        focusNode: focusNode,
        controller: searchController,
        textInputAction: TextInputAction.search,
        onTapOutside: (_) {
          log('tap outside and field unfocus');
          focusNode.unfocus();
        },
        hintStyle: WidgetStateTextStyle.resolveWith(
          (_) => TextStyle(color: AppColor.textPrimaryGrey),
        ),
        leading: Icon(Icons.search, color: AppColor.textPrimaryGrey),
      ),
    );
  }
}
