
abstract class SwitchSliderEvents{
   SwitchSliderEvents();

  @override
  List<Object> get props=> [];
}


class EnableOrDisableNotification extends SwitchSliderEvents{}


class SliderEvent extends SwitchSliderEvents{
  double slider;

  SliderEvent({required this.slider});


  @override
  List<Object> get props => [slider];


}
