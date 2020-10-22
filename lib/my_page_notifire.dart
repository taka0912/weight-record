import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'my_page_notifire.freezed.dart';

@freezed
abstract class MyPageState with _$MyPageState {
  const factory MyPageState({
    @Default(0) int count,
}) = _MyPageState;
}

class MyPageNotifier extends StateNotifier<MyPageState> with LocatorMixin {
  MyPageNotifier({
    @required this.context,
}) : super(const MyPageState());

  final BuildContext context;

  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  @override
  void initstate() {}

  void pushButton() {
    state = state.copyWith(count: state.count + 1);
    print(state.count);
  }
}

