import 'package:get/get.dart';
import 'package:howlongdidido_app/model/record_model.dart';

class RecordListViewController extends GetxController {
  final recordModel = RecordModel().obs; //observable

  void updateRecordInfo(String recordDate, String duration, String quickNote) {
    recordModel.update((val) {
      val?.recordDate = recordDate;
      val?.duration = duration;
      val?.quickNotes = quickNote;
    });
  }
}
