import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kltn_mobile/blocs/theme_setting_cubit/theme_setting_cubit.dart';
import 'package:kltn_mobile/components/Style/montserrat.dart';
import 'package:kltn_mobile/models/schools.dart';
import 'package:kltn_mobile/screens/schools/major_detail.dart';

class MajorBox extends StatefulWidget {
  final List<Program> programs; // Thay đổi từ Program sang List<Program>
  const MajorBox({super.key, required this.programs});

  @override
  MajorBoxState createState() => MajorBoxState();
}

class MajorBoxState extends State<MajorBox> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.select(
        (ThemeSettingCubit cubit) => cubit.state.brightness == Brightness.dark);
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final boxColor = isDarkMode ? const Color(0xff3F3F46) : Colors.white;
    return ListView.builder(
      itemCount: widget.programs.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MajorDetailPage(program: widget.programs[index])),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: boxColor,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: isDarkMode ? Colors.white : Colors.black ),
              ),
              child: TextMonserats(widget.programs[index].name, fontSize: 16, fontWeight: FontWeight.w400, color: textColor,),
            ),
          );
      },
    );
  }
}