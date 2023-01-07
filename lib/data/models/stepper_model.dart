import '../enums/stepper.dart';

class StepperModel {
  StepperState state;
  int num;

  StepperModel({required this.num, required this.state});
}

List<StepperModel> steps = [
  StepperModel(num: 1, state: StepperState.current),
  StepperModel(num: 2, state: StepperState.notReached),
  StepperModel(num: 3, state: StepperState.notReached),
  StepperModel(num: 4, state: StepperState.notReached),
];
