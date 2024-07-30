import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kltn_mobile/blocs/theme_setting_cubit/theme_setting_cubit.dart';
import 'package:kltn_mobile/components/Style/backbutton.dart';
import 'package:kltn_mobile/components/constant/color_constant.dart';
import 'package:kltn_mobile/components/functions/circle_avatarimg.dart';
import 'package:kltn_mobile/components/style/montserrat.dart';
import 'package:kltn_mobile/models/notifications.dart';
import 'package:kltn_mobile/screens/home/base_lang.dart';

class NotificationDetailPage extends BasePage {
  const NotificationDetailPage({super.key, required this.notification});
  final Notifications notification;

  @override
  State<NotificationDetailPage> createState() => _NotificationDetailPageState();
}

@override
class _NotificationDetailPageState
    extends BasePageState<NotificationDetailPage> {
  @override
  Widget build(BuildContext context) {
    final userAuth = this.userAuth;
    final isDarkMode = context.select(
        (ThemeSettingCubit cubit) => cubit.state.brightness == Brightness.dark);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04, vertical: screenHeight * 0.01),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackButtonCircle(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                CirleAvatarImage(
                    avatarImgUrl: userAuth?.student.school.logo != null
                        ? userAuth!.student.school.logo
                        : null,
                    avatarImgPath: 'assets/logo/logo_red.png',
                    width: 60,
                    height: 60),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                  color: isDarkMode ? const Color(0xff3F3F46) : Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * 0.05),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CirleAvatarImage(
                                avatarImgUrl:
                                    userAuth?.student.school.logo != null
                                        ? userAuth!.student.school.logo
                                        : null,
                                avatarImgPath: 'assets/logo/logo_red.png',
                                width: 60,
                                height: 60),
                            SizedBox(
                              width: screenWidth * 0.05,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextMonserats(
                                  widget.notification.schoolName ?? '',
                                  color: isDarkMode
                                      ? Colors.white
                                      : AppColor.redButton,
                                  fontSize: screenWidth * 0.04,
                                  fontWeight: FontWeight.w600,
                                ),
                                TextMonserats(
                                  widget.notification.createdAt
                                          .toIso8601String() ??
                                      '',
                                  color:
                                      isDarkMode ? Colors.white : Colors.black,
                                  fontSize: screenWidth * 0.03,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: screenHeight * 0.02,
                              ),
                              TextMonserats(
                                widget.notification.title ?? '',
                                color: isDarkMode ? Colors.white : Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(
                                height: screenHeight * 0.01,
                              ),
                              TextMonserats(
                                widget.notification.body ?? '',
                                color: isDarkMode ? Colors.white : Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
