import 'package:flutter/material.dart';
import 'package:kltn_mobile/components/style/backbutton.dart';
import 'package:kltn_mobile/components/style/montserrat.dart';
import 'package:kltn_mobile/components/style/simplebutton.dart';
import 'package:kltn_mobile/screens/home/base_lang.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LogoutPage extends BasePage {
  const LogoutPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LogoutPageState createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final logout1 =
        localizations != null ? localizations.logout_1 : 'Default Text';
    final logout2 =
        localizations != null ? localizations.logout_2 : 'Default Text';
    final logout3 =
        localizations != null ? localizations.logout_3_signup : 'Default Text';
    final logout4 =
        localizations != null ? localizations.logout_4_signin : 'Default Text';
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bckgr_logout_blur.png"),
                fit: BoxFit.cover)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BackButtonCircle(onPressed: () {
                            Navigator.pop(context);
                          }),
                          //Logo
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.20),
                          Image.asset(
                            "assets/LOGO_RED.png",
                            height: 80,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.20),
                          Container(width: 35)
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.2),
                      TextMonserats(
                        logout1,
                        fontSize: 38,
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      TextMonserats(logout2, fontSize: 14),
                      SizedBox(height: screenHeight * 0.15),
                      SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: SimpleButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/register');
                            },
                            child: TextMonserats(
                              logout3,
                              color: Colors.white,
                            ),
                          )),
                      SizedBox(height: screenHeight * 0.02),
                      SizedBox(
                          width: double.infinity,
                          child: SimpleButton(
                            backgroundColor: Colors.transparent,
                            borderColor: Colors.white,
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: TextMonserats(
                              logout4,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                    ]),
              ),
            )));
  }
}
