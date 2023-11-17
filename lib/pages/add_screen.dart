import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mooyu/main.dart';
import 'package:mooyu/models/record.dart';

@RoutePage()
class AddPage extends HookConsumerWidget {
  AddPage({super.key});

  final departmentList = [
    '急诊科',
    '三甲办',
    '设备科',
    '门诊神经外科',
    '门诊皮肤外科',
    '彩超室',
    '张院办公室',
    '院办',
    '门诊药房',
    '门诊推拿科',
  ];

  final brandList = [
    '联想',
    '华为',
    '小米',
    '三星',
    '爱普生',
  ];

  final typeList = [
    '显示器',
    '主机',
    '打印机',
  ];

  final RegExp serialNumberRegExp = RegExp(r'[A-Z0-9]{9,21}');

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final departmentController = useTextEditingController(text: '');
    final brandController = useTextEditingController(text: '');
    final typeController = useTextEditingController(text: '');
    final serialNumberController = useTextEditingController(text: '');
    final dateController = useTextEditingController(text: '');
    final remarkController = useTextEditingController(text: '');

    void resetAll() {
      departmentController.clear();
      brandController.clear();
      typeController.clear();
      serialNumberController.clear();
      dateController.clear();
      remarkController.clear();
    }

    void addRecord() {
      var record = RecordItem(
          department: departmentController.text,
          brand: brandController.text,
          type: typeController.text,
          serialNumber: serialNumberController.text,
          date: dateController.text,
          selected: true);
      ref.read(recordListProvider.notifier).addRecord(record);
      context.router.pop();
    }

    void ocrSerialNumber() async {
      final ImagePicker picker = ImagePicker();
      final XFile? file = await picker.pickImage(source: ImageSource.gallery);
      if (file == null) return;
      final InputImage inputImage = InputImage.fromFilePath(file.path);
      final textRecognizer =
          TextRecognizer(script: TextRecognitionScript.latin);
      final RecognizedText recognizedText =
          await textRecognizer.processImage(inputImage);
      final text = recognizedText.text.replaceAll('\n', ' ');
      final serialNumber = serialNumberRegExp.firstMatch(text)?.group(0);
      if (serialNumber != null) {
        serialNumberController.value = TextEditingValue(text: serialNumber);
      }
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 100,
          title: const Text('新增'),
          actions: [
            IconButton(
                onPressed: () {
                  resetAll();
                },
                icon: const Icon(Icons.refresh)),
            IconButton(
                onPressed: () {
                  addRecord();
                },
                icon: const Icon(Icons.save)),
          ],
        ),
        body: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.badge_outlined,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                      child: TextField(
                    controller: departmentController,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: '科室'),
                  ))
                ],
              ),
            ),
            Divider(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.card_membership,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                      child: TextField(
                    controller: brandController,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: '品牌'),
                  ))
                ],
              ),
            ),
            Divider(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.computer,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                      child: TextField(
                    controller: typeController,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: '类型'),
                  ))
                ],
              ),
            ),
            Divider(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      ocrSerialNumber();
                    },
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                      child: TextField(
                    controller: serialNumberController,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: '序列号'),
                  ))
                ],
              ),
            ),
            Divider(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2010),
                              lastDate: DateTime(2050))
                          .then((value) {
                        if (value != null) {
                          dateController.value = TextEditingValue(
                              text: value.toString().split(' ')[0]);
                        }
                      });
                    },
                    child: Icon(
                      Icons.date_range,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                      child: TextField(
                    controller: dateController,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: '日期'),
                  ))
                ],
              ),
            ),
            Divider(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.info_outline,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                      child: TextField(
                    controller: remarkController,
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: '备注'),
                  ))
                ],
              ),
            ),
            Divider(),
          ],
        )));
  }
}
