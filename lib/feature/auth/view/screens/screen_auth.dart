import 'package:chat_app/core/theme/app_color.dart';
import 'package:chat_app/feature/auth/view/widgets/sign_in_widget.dart';
import 'package:chat_app/feature/auth/view/widgets/sign_up_widget.dart';
import 'package:flutter/material.dart';

class ScreenAuth extends StatelessWidget {
  const ScreenAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
            child: Column(
              children: [
                TabBar(
                  labelColor: AppColor.secondaryDark,
                  unselectedLabelColor: AppColor.textPrimaryGrey,
                  indicatorColor: AppColor.primaryDark,
                  dividerColor: AppColor.textPrimaryGrey,
                  indicatorWeight: 3,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: const [Tab(text: "Sign In"), Tab(text: "Sign Up")],
                ),

                Expanded(
                  child: TabBarView(children: [SignInWidget(), SignUpWidget()]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


  // height: 600,
  //         width: 350,
  //         decoration: BoxDecoration(
  //           color: AppColor.surfaceDark,
  //           border: Border.all(color: AppColor.secondaryDark),
  //           borderRadius: BorderRadius.circular(12),
  //           boxShadow: [
  //             BoxShadow(
  //               color: AppColor.secondaryDark.withValues(alpha: 0.5),
  //               blurRadius: 10,
  //               spreadRadius: 1,
  //               offset: const Offset(0, 1),
  //             ),
  //           ],
  //         ),