import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mooyu/main.dart';
import 'package:mooyu/models/record.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

Future<void> createExcel(List<RecordItem> recordList) async {
  final Directory? downloadsDir = await getDownloadsDirectory();
  var excel = Excel.createExcel();
  Sheet sheetObject = excel['Sheet1'];
  sheetObject.appendRow(['科室', '品牌', '类型', '序列号', '日期', '备注']);
  for (var record in recordList) {
    sheetObject.appendRow([
      record.department,
      record.brand,
      record.type,
      record.serialNumber,
      record.date
    ]);
  }
  List<int>? fileBytes = excel.save();
  File('${downloadsDir!.path}/test.xlsx')
    ..createSync(recursive: true)
    ..writeAsBytesSync(fileBytes!);
  await Share.shareXFiles([XFile('${downloadsDir.path}/test.xlsx')],
      text: 'xlsx file');
}

@RoutePage()
class MainPage extends HookConsumerWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<RecordItem> records = ref.watch(recordListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mooyu'),
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () => {
              createExcel(records),
            },
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.done_all),
              onPressed: () => {
                ref.read(recordListProvider.notifier).toggleAll(),
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => {
                ref.read(recordListProvider.notifier).deletedSelected(),
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => {},
            ),
          ],
        ),
      ),
      body: Center(
        child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  ref.read(recordListProvider.notifier).toggleSelected(index);
                },
                selected: records[index].selected,
                leading: Checkbox(
                  onChanged: (value) {
                    ref.read(recordListProvider.notifier).toggleSelected(index);
                  },
                  value: records[index].selected,
                ),
                title: Text(records[index].type),
                subtitle: Text(records[index].date),
                trailing: Text(records[index].department),
              );
            },
            itemCount: records.length),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          context.router.pushNamed('/add'),
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
    );
  }
}
