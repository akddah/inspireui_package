import 'package:event_bus/event_bus.dart';

final EventBus eventBus = EventBus();

class EventDrawerSettings {
  const EventDrawerSettings();
}

/// Event for tab of tabbar
class EventNavigatorTabbar {
  int index;
  bool isMenu;

  EventNavigatorTabbar(this.index, {this.isMenu = false});
}

class EventDetailSettings {
  final bool isListing;
  const EventDetailSettings({this.isListing = false});
}

class EventBlogDetailSettings {
  const EventBlogDetailSettings();
}

class EventAppInfo {
  const EventAppInfo();
}

class EventOpenToggle {
  const EventOpenToggle();
}

class EventPreviewWidget {
  final int previewIndex;
  final bool isPreviewing;

  const EventPreviewWidget(this.previewIndex, this.isPreviewing);
}

class EventReloadConfigs {
  String? key;
  Map<String, dynamic> configs;

  EventReloadConfigs(this.configs, {this.key});
}

class EventNavigatorToDesign {
  const EventNavigatorToDesign();
}

class EventNavigatorToBuild {
  const EventNavigatorToBuild();
}

class EventNavigatorToFeature {
  const EventNavigatorToFeature();
}

class EventNavigatorToLicense {
  const EventNavigatorToLicense();
}

class EventEditHomeConfig {
  int index;

  EventEditHomeConfig(this.index);
}

/// Take the screenshot on home screen
class EventHomeScreenShoot {
  EventHomeScreenShoot();
}

class EventHomeScreenShootAtIndex {
  int index;
  bool takeScreenshot = true;
  int? tabIndex;
  String? name;

  EventHomeScreenShootAtIndex(
    this.index, {
    this.takeScreenshot = true,
    this.tabIndex,
    this.name,
  });
}

class EventAddNewTabBar {
  const EventAddNewTabBar();
}

class EventAppbarSetting {
  const EventAppbarSetting();
}

/// Event for Tabber Setting
class EventTabbarSetting {
  const EventTabbarSetting();
}
