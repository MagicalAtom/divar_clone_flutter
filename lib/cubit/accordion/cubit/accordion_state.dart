part of 'accordion_cubit.dart';
final class AccordionStatusState {
  final bool status;


  AccordionStatusState({this.status = false});

  AccordionStatusState copyWith({bool? status}){
    return AccordionStatusState(status: status ?? this.status);
  }

  @override
  List<Object> get props => [status];
}
