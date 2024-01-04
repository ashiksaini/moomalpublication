class TabBarModel {
  final String? tabName;
  final int? tabId;

  TabBarModel({
    this.tabName,
    this.tabId,
  });

  factory TabBarModel.fromJson(Map<String, dynamic> json) => TabBarModel(
        tabName: json["tabName"] as String?,
        tabId: json["tabId"] as int?,
      );
}
