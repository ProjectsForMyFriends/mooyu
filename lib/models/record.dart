import 'package:freezed_annotation/freezed_annotation.dart';

part 'record.freezed.dart';
part 'record.g.dart';

@freezed
class RecordItem with _$RecordItem {
  factory RecordItem({
    required String department,
    required String brand,
    required String type,
    required String serialNumber,
    required String date,
    String? remark,
    required bool selected,
  }) = _RecordItem;

  factory RecordItem.fromJson(Map<String, dynamic> json) =>
      _$RecordItemFromJson(json);
}
