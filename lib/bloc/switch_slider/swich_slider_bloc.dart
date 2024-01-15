import 'package:bloc/bloc.dart';
import 'package:bloc_practice/bloc/switch_slider/switch_slider_events.dart';
import 'package:bloc_practice/bloc/switch_slider/switch_slider_states.dart';

class SwitchSliderBloc extends Bloc<SwitchSliderEvents,SwitchSliderStates>{

  SwitchSliderBloc():super(SwitchSliderStates()){

    on<EnableOrDisableNotification>(_enableOrDisableNotification);
    on<SliderEvent>(_slider);
  }

  void _enableOrDisableNotification(EnableOrDisableNotification event, Emitter<SwitchSliderStates> emit){

    emit(state.copyWith(isSwitch: !state.isSwitch),);
  }


  void _slider(SliderEvent event,Emitter<SwitchSliderStates> emit){
    emit(state.copyWith(slider: event.slider));
  }



}