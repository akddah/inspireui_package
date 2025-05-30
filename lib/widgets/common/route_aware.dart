import 'package:flutter/material.dart';

import '../../utils/logs.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class RouteAwareWidget extends StatefulWidget {
  final String name;
  final Widget child;

  const RouteAwareWidget(
    this.name, {
    super.key,
    required this.child,
  });

  @override
  State<RouteAwareWidget> createState() => RouteAwareWidgetState();
}

class RouteAwareWidgetState extends State<RouteAwareWidget> with RouteAware {
  static final log = LoggerDebug(constTitle: 'RouteAwareWidgetState in inspire_ui');

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute<dynamic>);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  // Called when the current route has been pushed.
  void didPush() {
    log.green('didPush ${widget.name}');
  }

  @override
  // Called when the top route has been popped off, and the current route shows up.
  void didPopNext() {
    log.green('didPopNext ${widget.name}');
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
