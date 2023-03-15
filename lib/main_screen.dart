import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  MyHomeScreenState createState() => MyHomeScreenState();
}

class MyHomeScreenState extends State<MyHomeScreen> {
  final List _dataList = <int>[];
  final ScrollController _scrollController =
      ScrollController(initialScrollOffset: 5.0);
  bool _isLoading = false;
  int _pageCount = 1;
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();

    _addImageToList(1);

    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Trending Gifs'),
        actions: [
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                // TODO
              }),
          PopupMenuButton(itemBuilder: (context) {
            return [
              const PopupMenuItem<int>(
                value: 0,
                child: Text("Open Source Licenses"),
              ),
            ];
          }, onSelected: (value) {
            if (value == 0) {
              showLicensePage(
                context: context,
                applicationName: 'Gif Search',
                applicationVersion: _packageInfo.version,
              );
            }
          }),
        ],
      ),
      body: GridView.count(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        crossAxisCount: 3,
        mainAxisSpacing: 1.0,
        physics: const AlwaysScrollableScrollPhysics(),
        children: _dataList.map((value) {
          // TODO optimize the border decoration
          return Container(
            alignment: Alignment.center,
            height: 135.0,
            margin: EdgeInsets.zero,
            decoration: const BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(width: 0.5, color: Colors.white),
                horizontal: BorderSide(width: 0.5, color: Colors.white),
              ),
            ),
            child: CachedNetworkImage(
              // 'https://source.unsplash.com/1600x900/?happy',
              // "https://source.unsplash.com/random?sig=${0 + random.nextInt(dataList.length - 0)}",
              imageUrl: "https://source.unsplash.com/random?sig=$value",
              height: 135.0,
              fit: BoxFit.fill,
            ),
          );
        }).toList(),
      ),
    );
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        _isLoading = true;

        if (_isLoading) {
          _pageCount = _pageCount + 1;

          _addImageToList(_pageCount);
        }
      });
    }
  }

  void _addImageToList(int pageCount) {
    for (int i = (pageCount * 20) - 20; i < pageCount * 20; i++) {
      _dataList.add(i);
    }

    _isLoading = false;
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }
}
