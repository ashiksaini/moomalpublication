import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moomalpublication/core/components/atoms/custom_progress_indicator.dart';
import 'package:moomalpublication/core/components/atoms/custom_text.dart';
import 'package:moomalpublication/core/theme/custom_text_style.dart';
import 'package:moomalpublication/core/theme/dimen.dart';
import 'package:moomalpublication/core/utils/no_glow_behaviour.dart';

typedef OnLoadMoreCallback = Future<void> Function();
typedef OnItemClickCallback<T> = void Function(T data);

class PaginationDataViewer<T> extends StatefulWidget {
  final List<T> dataList;
  final OnLoadMoreCallback onLoadMore;
  final OnItemClickCallback<T>? onItemClick;
  final Widget Function(T) itemBuilder;
  final bool isLastPage;

  const PaginationDataViewer({
    required this.dataList,
    required this.onLoadMore,
    required this.itemBuilder,
    this.onItemClick,
    this.isLastPage = false,
  });

  @override
  _PaginationDataViewerState<T> createState() => _PaginationDataViewerState<T>();
}

class _PaginationDataViewerState<T> extends State<PaginationDataViewer<T>> {
  bool _isLoadingMore = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _loadMoreData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ScrollConfiguration(
            behavior: NoGlowBehavior(),
            child: _showData(),
          ),
        ),
        if (_isLoadingMore) _buildLoadingIndicator(),
      ],
    );
  }

  Widget _buildLoadingIndicator() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: scaleHeight(5, context)),
      child: customProgressIndicator(),
    );
  }

  Future<void> _loadMoreData() async {
    if (!_isLoadingMore && !widget.isLastPage) {
      setState(() {
        _isLoadingMore = true;
      });

      await Future.delayed(
        const Duration(seconds: 1),
        () => widget.onLoadMore(),
      );

      setState(() {
        _isLoadingMore = false;
      });
    }
  }

  Widget _showData() {
    if (widget.dataList.isNotEmpty) {
      return ListView.builder(
        controller: _scrollController,
        itemCount: widget.dataList.length + (widget.isLastPage ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < widget.dataList.length) {
            final item = widget.dataList[index];
            return GestureDetector(
              onTap: () => (widget.onItemClick != null) ? widget.onItemClick!(item) : null,
              child: widget.itemBuilder(item),
            );
          } else {
            return const SizedBox();
          }
        },
      );
    } else {
      return Center(
        child: CustomText(
          text: "no_result_found".tr,
          textStyle: CustomTextStyle.textStyle10Bold(context),
        ),
      );
    }
  }
}
