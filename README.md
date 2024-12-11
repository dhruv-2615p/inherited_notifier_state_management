# test_inherited_notifier_s_m

A new Flutter project.

- ChangeNotifier holds on to the state and InheritedNotifier listen to it and rebuilds it's child when value of change notifier changess.

- InheritedNotifier differ from InheritedModel like it does not contain any value that changes but only depend upon notifier.

- On changing slider value call ChangeNotifier's notifyListeners it notify all it's dependent by inherited notifier and give changed value by of method of SliderInheritedNotifier that internally set Opacity of color's of Container.
