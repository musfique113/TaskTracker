
import 'package:get/get.dart';
import 'package:taskmanager_ostad/data/models/network_response.dart';
import 'package:taskmanager_ostad/data/models/summary_count_model.dart';
import 'package:taskmanager_ostad/data/services/network_caller.dart';
import 'package:taskmanager_ostad/data/utils/urls.dart';

class SummaryCountController extends GetxController {
  bool _getCountSummaryInProgress = false;

  String message = '';

  bool get getCountSummaryInProgress => _getCountSummaryInProgress;

  SummaryCountModel _summaryCountModel = SummaryCountModel();
  SummaryCountModel get summaryCountModel => _summaryCountModel;

  Future<bool> getCountSummary() async {
    _getCountSummaryInProgress = true;
    update();
    final NetworkResponse response =
    await NetworkCaller().getRequest(Urls.taskStatusCount);
    _getCountSummaryInProgress = false;
    if (response.isSuccess) {
      _summaryCountModel = SummaryCountModel.fromJson(response.body!);
      update();
      return true;
    } else {
      message = 'Count summary get failed! Try again.';
      update();
      return false;
    }
  }
}