import 'package:flutter/material.dart';
import 'package:kltn_mobile/components/Style/backbutton.dart';
import 'package:kltn_mobile/components/Style/montserrat.dart';
import 'package:kltn_mobile/components/circle_avatarimg.dart';
import '../../Model/user_login.dart';
import '../../components/profile_userdetailbox.dart';

class UserDetailsPage extends StatelessWidget {
  final UserAuthLogin userAuth;

  const UserDetailsPage({super.key, required this.userAuth});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        color: const Color(0xffF2F2F2),
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.15),
                child: Center( 
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const TextMonserats('Profile', fontSize: 22, fontWeight: FontWeight.bold),
                        const SizedBox(height: 20),
                        const CirleAvatarImage(avatarImgPath: 'assets/backgr-01.jpg', width: 120, height: 120),
                        const SizedBox(height: 20),
                        LegendBox(title: 'Full name', value: userAuth.name ?? 'N/A'),
                        const SizedBox(height: 20),
                        LegendBox(title: 'Email', value: userAuth.email ?? 'N/A'),
                        const SizedBox(height: 20),
                        LegendBox(title: 'ID Student', value: userAuth.student?.studentCode ?? 'N/A'),
                        const SizedBox(height: 20),
                        LegendBox(title: 'Status', value: userAuth.student?.status ?? 'N/A'),
                      ],
                    ),
                  ),
                ),
              Positioned(
                top: 10.0,
                left: 10.0,
                child: BackButtonCircle(onPressed: () {
                  Navigator.pop(context);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}