import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:jobhub/models/response/jobs/jobs_response.dart';
import 'package:jobhub/services/helpers/jobs_helper.dart';
import 'package:jobhub/views/common/exports.dart';
import 'package:jobhub/views/ui/jobs/widgets/job_tile.dart';
import 'package:jobhub/views/ui/search/widgets/custom_field.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController search = TextEditingController();
  Future<List<JobsResponse>>? searchFuture;

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  void startSearch() {
    if (search.text.isNotEmpty) {
      setState(() {
        searchFuture = JobsHelper.searchJobs(search.text.trim());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(kOrange.value),
        iconTheme: IconThemeData(color: Color(kLight.value)),
        title: CustomField(
          hintText: "Search for a Job",
          controller: search,
          onEditingComplete: startSearch,
          suffixIcon: GestureDetector(
            onTap: startSearch,
            child: Icon(AntDesign.search1),
          ),
        ),
        elevation: 0,
      ),
      body: searchFuture == null
          ? SearchLoading(text: "Start Searching for Job")
          : FutureBuilder<List<JobsResponse>>(
              future: searchFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else if (snapshot.data!.isEmpty) {
                  return SearchLoading(text: "Job Not Found");
                } else {
                  final jobs = snapshot.data!;
                  return ListView.builder(
                    itemCount: jobs.length,
                    itemBuilder: (context, index) {
                      final job = jobs[index];
                      return VerticalTileWidget(job: job);
                    },
                  );
                }
              },
            ),
    );
  }
}

class SearchLoading extends StatelessWidget {
  const SearchLoading({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/optimized_search.png"),
            ReusableText(
              text: text,
              style: appstyle(24, Color(kDark.value), FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
