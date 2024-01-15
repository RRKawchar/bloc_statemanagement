import 'package:bloc_practice/bloc/switch_slider/swich_slider_bloc.dart';
import 'package:bloc_practice/bloc/switch_slider/switch_slider_events.dart';
import 'package:bloc_practice/bloc/switch_slider/switch_slider_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchSliderScreen extends StatefulWidget {
  const SwitchSliderScreen({super.key});

  @override
  State<SwitchSliderScreen> createState() => _SwitchSliderScreenState();
}

class _SwitchSliderScreenState extends State<SwitchSliderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Switch and Slider"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Notification"),
                BlocBuilder<SwitchSliderBloc, SwitchSliderStates>(
                  buildWhen: (previous,current)=>previous.isSwitch!=current.isSwitch,
                  builder: (context, states) {
                    print("Notification");
                    return Switch(
                      value: states.isSwitch,
                      onChanged: (value) {
                        context
                            .read<SwitchSliderBloc>()
                            .add(EnableOrDisableNotification());
                      },
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            BlocBuilder<SwitchSliderBloc, SwitchSliderStates>(
              buildWhen: (previous,current)=>previous.slider!=current.slider,
              builder: (context, states) {
                print("Slider");
                return Container(
                  height: 200,
                  color: Colors.red.withOpacity(states.slider),
                );
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<SwitchSliderBloc, SwitchSliderStates>(
              builder: (context, states) {
                return Slider(
                  value: states.slider,
                  onChanged: (value) {
                    context
                        .read<SwitchSliderBloc>()
                        .add(SliderEvent(slider: value));
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
