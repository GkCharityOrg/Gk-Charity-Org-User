class Notifications {
  String id;
  String assignedTo;
  String createdby;
  DateTime createdDate;
  String modifiedBy;
  DateTime modifiedDate;
  String name;
  DateTime natificationDate;

  // Constructor
  Notifications({
    required this.id,
    required this.assignedTo,
    required this.createdDate,
    required this.createdby,
    required this.modifiedBy,
    required this.modifiedDate,
    required this.name,
    required this.natificationDate,
  });
}
