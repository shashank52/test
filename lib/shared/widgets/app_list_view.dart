import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';

class AppListView extends StatefulWidget {
  const AppListView({super.key, this.direction = Axis.vertical, this.onLoad, required this.itemBuilder, required this.itemCount, this.onRefresh});

  final Axis direction;
  final Function()? onLoad;
  final Function()? onRefresh;
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;


  @override
  State<AppListView> createState() => _AppListViewState();
}

class _AppListViewState extends State<AppListView> {
  late final ScrollController _scrollController;

  void _onScroll() {
    if (_scrollController.position.extentAfter < 100) {
      widget.onLoad?.call();
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.addListener(_onScroll);
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      onRefresh:() =>  widget.onRefresh?.call(),
      child: ListView.builder(
          controller: _scrollController,
          scrollDirection: widget.direction,
          itemCount: widget.itemCount,
          itemBuilder: widget.itemBuilder),
    );
  }
}
