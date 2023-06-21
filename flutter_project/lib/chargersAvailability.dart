import 'package:flutter/material.dart';

class ChargerAvailability extends StatefulWidget {
  const ChargerAvailability({Key? key}) : super(key: key);

  @override
  State<ChargerAvailability> createState() => _ChargerAvailabilityState();
}

class _ChargerAvailabilityState extends State<ChargerAvailability> with SingleTickerProviderStateMixin {

  //late AimationController _animationController;
  bool _isRed = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Create an animation controller with 0.5 seconds duration
   // _animationController = AnimationController(duration: const Duration(seconds: 2), vsync: this)
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
