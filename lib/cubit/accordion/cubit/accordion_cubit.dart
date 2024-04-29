import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'accordion_state.dart';

class AccordionCubit extends Cubit<AccordionStatusState> {
  AccordionCubit() : super(AccordionStatusState(status: false));


  void changeAccordionStatus(AnimationController controller){
    bool newState = !state.status;
    if (newState) {
        controller.forward();
      } else {
        controller.reverse();
      }
    emit(state.copyWith(status: newState));
  }




}
