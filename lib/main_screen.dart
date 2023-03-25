import 'package:cached_network_image/cached_network_image.dart';
import 'package:enough_platform_widgets/enough_platform_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        title: PlatformText('Top Trending Gifs'),
        actions: [
          // TODO tool tip? PlatformIconButton
          IconButton(
              tooltip: 'Search gifs',
              icon: Icon(PlatformIcons(context).search),
              onPressed: () {
                // TODO Expand search and filter list
              }),
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem<int>(
                value: 0,
                child: PlatformText('Open Source Licenses'),
              ),
            ];
          }, onSelected: (value) {
            if (value == 0) {
              _showLicensePage(context);
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
          final screenSize = MediaQuery.of(context).size;
          final screenWidth = screenSize.width;
          final screenHeight = screenSize.height;
          final minDimension =
              (screenWidth < screenHeight) ? screenWidth : screenHeight;
          final sideLength = minDimension * 0.5;

          final imageUrl = "https://source.unsplash.com/random?sig=$value";

          return PlatformInkWell(
            onTap: () {
              _showGifDialog(context, sideLength, imageUrl);
            },
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.zero,
              padding: const EdgeInsets.all(1.0),
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                      widthFactor: sideLength / 3,
                      child: PlatformCircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) =>
                        Icon(PlatformIcons(context).error),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Future<void> _showLicensePage(BuildContext context) async {
    showLicensePage(
      context: context,
      applicationName: 'Gif Search',
      applicationVersion: _packageInfo.version,
    );
  }

  Future<void> _showGifDialog(
      BuildContext context, double height, String imageUrl) async {
    showPlatformDialog<void>(
      context: context,
      builder: (BuildContext context) {
        // TODO padding on dialog buttons is weird on Android
        return PlatformAlertDialog(
          actions: <Widget>[
            PlatformDialogAction(
              // TODO update to save to gallery
              onPressed: () => Navigator.pop(context, 'Save Image'),
              child: PlatformText('Save Image'),
            ),
            PlatformDialogAction(
              onPressed: () async {
                Clipboard.setData(ClipboardData(text: imageUrl)).then((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: PlatformText('Image Url copied to clipboard.'),
                    ),
                  );
                });

                Navigator.pop(context, 'Copy Url');
              },
              child: PlatformText('Copy Url'),
            ),
            PlatformDialogAction(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: PlatformText('Cancel'),
            ),
          ],
          content: Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: height,
            margin: EdgeInsets.zero,
            padding: const EdgeInsets.all(1.0),
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(
                    widthFactor: height / 3,
                    child: PlatformCircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) =>
                      Icon(PlatformIcons(context).error),
                ),
              ),
            ),
          ),
        );
      },
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
    for (int i = (pageCount * 15) - 15; i < pageCount * 15; i++) {
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
