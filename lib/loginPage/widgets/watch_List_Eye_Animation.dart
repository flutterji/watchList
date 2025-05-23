import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/constants/en.dart';
import 'package:flutter_circular_text/circular_text/model.dart';
import 'package:flutter_circular_text/circular_text/widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';

class WatchListEyeAnimation extends StatefulWidget {
  const WatchListEyeAnimation({super.key});

  @override
  State<WatchListEyeAnimation> createState() => _WatchListEyeAnimationState();
}

class _WatchListEyeAnimationState extends State<WatchListEyeAnimation> {
  Artboard? _eyeArtboard;

  SMIBool? eyeAnimation;

  StateMachineController? stateMachineController;

  @override
  void initState() {
    super.initState();

    rootBundle.load('assets/eye.riv').then((data) async {
      await RiveFile.initialize();
      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;
      stateMachineController = StateMachineController.fromArtboard(
        artboard,
        "State Machine 1",
      );
      if (stateMachineController != null) {
        artboard.addController(stateMachineController!);
        eyeAnimation = stateMachineController!.findSMI('Pressed');
      }
      eyeAnimation?.change(!eyeAnimation!.value);
      setState(() => _eyeArtboard = artboard);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _eyeArtboard == null
        ? const SizedBox()
        : SizedBox(
            height: 250.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                
                CircularText(
                  children: [
                    TextItem(
                      text: Text(
                        watch,
                        style: TextStyle(
                          fontSize: 40.sp,
                          color: whiteColor,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      space: 25,
                      startAngle: -90,
                      startAngleAlignment: StartAngleAlignment.center,
                      direction: CircularTextDirection.clockwise,
                    ),
                    TextItem(
                      text: Text(
                        list,
                        style: TextStyle(
                          fontSize: 40.sp,
                          color: whiteColor,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      space: 25,
                      startAngle: 90,
                      startAngleAlignment: StartAngleAlignment.center,
                      direction: CircularTextDirection.anticlockwise,
                    ),
                  ],
                  radius: 150,
                  position: CircularTextPosition.inside,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30.h),
                  child: Rive(artboard: _eyeArtboard!, fit: BoxFit.cover),
                ),
              ],
            ),
          );
  }
}
