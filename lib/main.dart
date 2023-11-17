import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mooyu/models/record.dart';
import 'package:mooyu/routes/app_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'main.g.dart';

final sharedPreferencesProvider =
    Provider<SharedPreferences>((ref) => throw UnimplementedError());

@riverpod
class RecordList extends _$RecordList {
  @override
  List<RecordItem> build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    final String? recordsString = prefs.getString('records');
    if (recordsString != null) {
      return (jsonDecode(recordsString) as List<dynamic>)
          .map((e) => RecordItem.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  void toggleSelected(int index) {
    state = [
      ...state.sublist(0, index),
      state[index].copyWith(selected: !state[index].selected),
      ...state.sublist(index + 1)
    ];
    updateSharedPreference();
  }

  void addRecord(RecordItem record) {
    state = [...state, record];
    updateSharedPreference();
  }

  void toggleAll() {
    if (state.every((element) => element.selected)) {
      state = state.map((e) => e.copyWith(selected: false)).toList();
    } else {
      state = state.map((e) => e.copyWith(selected: true)).toList();
    }
    updateSharedPreference();
  }

  void deletedSelected() {
    state = state.where((element) => !element.selected).toList();
    updateSharedPreference();
  }

  void updateSharedPreference() {
    final prefs = ref.read(sharedPreferencesProvider);
    prefs.setString('records', jsonEncode(state));
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(ProviderScope(overrides: [
    // Override the unimplemented provider with the value gotten from the plugin
    sharedPreferencesProvider.overrideWithValue(prefs),
  ], child: MyApp()));
  await FlutterDisplayMode.setHighRefreshRate();
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      routerConfig: _appRouter.config(),
    );
  }
}
