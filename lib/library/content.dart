import 'package:flutter/material.dart';
import 'package:gp_app_dev/baricon.dart';
import 'package:gp_app_dev/consist/NavigationBar.dart';
import 'package:gp_app_dev/library/firebase_api.dart';
import 'package:gp_app_dev/library/firebase_file.dart';
import 'package:gp_app_dev/library/video_page.dart';
//import 'package:gp_app_dev/startpages/homepage.dart';
import 'package:gp_app_dev/utils.dart';

class Content extends StatefulWidget {
  const Content({Key? key}) : super(key: key);

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  late Future<List<FirebaseFile>> futureFiles;
  late List<FirebaseFile> allFiles = [];

  @override
  void initState() {
    super.initState();
    futureFiles = FirebaseApi.listAll('/video');
    futureFiles.then((files) {
      setState(() {
        allFiles = files;
      });
    });
  }

  void filterSearchResults(String query) {
    List<FirebaseFile> searchResults = [];
    if (query.isNotEmpty) {
      allFiles.forEach((file) {
        if (file.name.toLowerCase().contains(query.toLowerCase())) {
          searchResults.add(file);
        }
      });
      setState(() {
        futureFiles = Future.value(searchResults);
      });
    } else {
      setState(() {
        futureFiles = FirebaseApi.listAll('/video');
      });
    }
  }

  void _executeSearch() async {
    await showSearch(
      context: context,
      delegate: DataSearch(searchList: allFiles),
    );
  }

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / 393;
    double ffem = MediaQuery.of(context).size.width / 375;
    return Scaffold(
      endDrawer: const Baricon(),
      appBar: AppBar(
        title: Text(
          'Coach Bot',
          style: SafeGoogleFont(
            'Zen Dots',
            fontSize: 16 * ffem,
            fontWeight: FontWeight.w400,
            height: 1.2999999523 * ffem / fem,
            letterSpacing: -0.16 * fem,
            color: const Color(0xff000000),
          ),
        ),
        leading: InkWell(
          onTap: () {
            //Navigator.pop(context);
            //Navigator.pushReplacementNamed(context, "NavigationBarApp");
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const NavigationBarApp()));
          },
          child: Padding(
            padding: EdgeInsets.all(12 * fem),
            child: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(12 * fem),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 9.0),
                      child: TextField(
                        onChanged: filterSearchResults,
                        decoration: const InputDecoration(
                          hintText: 'Search...',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 9.0,
                              horizontal: 5.0), // Adjust the content padding
                          suffixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: FutureBuilder<List<FirebaseFile>>(
                future: futureFiles,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const Center(child: CircularProgressIndicator());
                    default:
                      if (snapshot.hasError) {
                        return const Center(
                            child: Text('Some error occurred!'));
                      } else {
                        final files = snapshot.data!;

                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: files.length,
                                itemBuilder: (context, index) {
                                  final file = files[index];
                                  return buildFile(context, file);
                                },
                              ),
                            ],
                          ),
                        );
                      }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFile(BuildContext context, FirebaseFile file) => ListTile(
        leading: const Icon(Icons.video_library),
        title: Text(
          file.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
            color: Colors.black,
          ),
        ),
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => VideoPage(file: file),
        )),
      );
}

class DataSearch extends SearchDelegate<String> {
  final List<FirebaseFile> searchList;

  DataSearch({required this.searchList});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<FirebaseFile> searchResults = searchList
        .where((file) => file.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final file = searchResults[index];
        return ListTile(
          title: Text(file.name),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => VideoPage(file: file),
            ));
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<FirebaseFile> suggestionList = query.isEmpty
        ? searchList
        : searchList
            .where(
                (file) => file.name.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        final file = suggestionList[index];
        return ListTile(
          title: Text(file.name),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => VideoPage(file: file),
            ));
          },
        );
      },
    );
  }
}
