// To parse this JSON data, do
//
//     final deleteTaskModel = deleteTaskModelFromJson(jsonString);

import 'dart:convert';

DeleteTaskModel deleteTaskModelFromJson(String str) =>
    DeleteTaskModel.fromJson(json.decode(str));

String deleteTaskModelToJson(DeleteTaskModel data) =>
    json.encode(data.toJson());

class DeleteTaskModel {
  final int? id;
  final String? todo;
  final bool? completed;
  final int? userId;
  final bool? isDeleted;
  final DateTime? deletedOn;

  DeleteTaskModel({
    this.id,
    this.todo,
    this.completed,
    this.userId,
    this.isDeleted,
    this.deletedOn,
  });

  factory DeleteTaskModel.fromJson(Map<String, dynamic> json) =>
      DeleteTaskModel(
        id: json["id"],
        todo: json["todo"],
        completed: json["completed"],
        userId: json["userId"],
        isDeleted: json["isDeleted"],
        deletedOn: json["deletedOn"] == null
            ? null
            : DateTime.parse(json["deletedOn"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "todo": todo,
        "completed": completed,
        "userId": userId,
        "isDeleted": isDeleted,
        "deletedOn": deletedOn?.toIso8601String(),
      };
}
