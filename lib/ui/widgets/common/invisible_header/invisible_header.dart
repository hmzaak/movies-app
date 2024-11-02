import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InvisibleExpandedHeader extends StatefulWidget {
  final Widget child;
  final Widget? replacement;

  /// The minimum height of the header when it is collapsed. The default value 0 means the minimum height is the minHeight of AppBar.
  /// Anything greater than 0 will mean minHeight of Appbar + the given value.
  final double minHeight;
  const InvisibleExpandedHeader({
    Key? key,
    required this.child,
    this.replacement,
    this.minHeight = 0,
  }) : super(key: key);
  @override
  State<InvisibleExpandedHeader> createState() =>
      _InvisibleExpandedHeaderState();
}

class _InvisibleExpandedHeaderState extends State<InvisibleExpandedHeader> {
  ScrollPosition? _position;
  bool? _visible;

  @override
  void dispose() {
    _removeListener();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _removeListener();
    _addListener();
  }

  void _addListener() {
    _position = Scrollable.of(context).position;
    _position?.addListener(_positionListener);
    _positionListener();
  }

  void _removeListener() {
    _position?.removeListener(_positionListener);
  }

  void _positionListener() {
    final FlexibleSpaceBarSettings? settings =
        context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
    bool visible = settings == null ||
        settings.currentExtent <= settings.minExtent + widget.minHeight.h;
    if (_visible != visible) {
      setState(() {
        _visible = visible;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 200),
      firstChild: widget.child,
      secondChild: widget.replacement ?? const SizedBox.shrink(),
      crossFadeState: (_visible ?? false)
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
    );
  }
}
