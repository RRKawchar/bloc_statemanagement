import 'package:equatable/equatable.dart';

class SwitchSliderStates extends Equatable {
   bool isSwitch;
   double slider;

  SwitchSliderStates({
    this.isSwitch = false,
    this.slider=1.0,
  });

  SwitchSliderStates copyWith({bool? isSwitch, double? slider}){
    return SwitchSliderStates(
      isSwitch: isSwitch?? this.isSwitch,
      slider: slider?? this.slider,

    );
  }

  @override
  List<Object?> get props => [isSwitch,slider];
}
