import 'dart:developer';

import 'package:http/http.dart' as https;
import 'package:jobhub/models/response/auth/profile_model.dart';
import 'package:jobhub/models/response/jobs/get_job.dart';
import 'package:jobhub/models/response/jobs/jobs_response.dart';
import 'package:jobhub/services/config.dart';

class JobsHelper {
  static var client = https.Client();
  static Future<List<JobsResponse>> getJobs() async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    log("Request Headers: $requestHeaders");
    var url = Uri.https(Config.apiUrl, Config.jobs);
    log("$url");
    var response = await client.get(url, headers: requestHeaders);
    log("Status: ${response.statusCode}");
    log("Body: ${response.body}");
    if (response.statusCode == 200) {
      log("Dheeraj");
      var jobList = jobsResponseFromJson(response.body);
      log("Jai");
      return jobList;
    } else {
      throw Exception("Failed to get the Jobs");
    }
  }

  static Future<JobsResponse> getRecent() async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    log("Request Headers: $requestHeaders");
    var url = Uri.https(Config.apiUrl, Config.jobs);
    log("$url");
    var response = await client.get(url, headers: requestHeaders);
    log("Status: ${response.statusCode}");
    log("Body: ${response.body}");
    if (response.statusCode == 200) {
      log("Dheeraj");
      var jobList = jobsResponseFromJson(response.body);
      var recent = jobList.first;
      log("Jai");
      return recent;
    } else {
      throw Exception("Failed to get the Jobs");
    }
  }

  static Future<GetJobRes> getJob(String jobId) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
    log("Request Headers: $requestHeaders");
    var url = Uri.https(Config.apiUrl, "${Config.jobs}/$jobId");
    log("$url");
    var response = await client.get(url, headers: requestHeaders);
    log("Status: ${response.statusCode}");
    log("Body: ${response.body}");
    if (response.statusCode == 200) {
      log("Dheeraj");
      var job = getJobResFromJson(response.body);
      log("Jai");
      return job;
    } else {
      throw Exception("Failed to get a Job");
    }
  }
}
