import 'package:app_controle_estoque/core/errors/custom_exception.dart';
import 'package:app_controle_estoque/models/audit_model.dart';

import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class AuditService {
  late Box auditBox;

  Future<void> startBox() async {
    auditBox = await Hive.openBox('auditBox');
  }

  Future<Map<dynamic, dynamic>> createAudit(AuditModel audit) async {
    try {
      await startBox();
      final newAudit = AuditModel(
        id: const Uuid().v1(),
        status: audit.status,
        unit: audit.unit,
        date: audit.date,
        userID: audit.userID,
      );

      await auditBox.put(newAudit.id, newAudit.toMap());

      return auditBox.get(newAudit.id);
    } on HiveError catch (error) {
      if (error.message.contains('Box not found')) {
        throw BoxNotFound();
      }
      throw ExceptionRequest();
    }
  }

  Future<Map<dynamic, dynamic>> updateAudit(AuditModel audit) async {
    try {
      await startBox();
      final updateAudit = AuditModel(
        id: audit.id,
        status: audit.status,
        unit: audit.unit,
        date: audit.date,
        userID: audit.userID,
      );

      final getAllAuditkeys = auditBox.keys.toList();

      getAllAuditkeys.forEach((element) {
        if (element == updateAudit.id) {
          final index = getAllAuditkeys.indexOf(element);
          auditBox.putAt(index, updateAudit.toMap());
        }
      });

      return auditBox.get(updateAudit.id);
    } on HiveError catch (error) {
      if (error.message.contains('Box not found')) {
        throw BoxNotFound();
      }
      throw ExceptionRequest();
    }
  }

  Future<bool> deleteAudit(String auditId) async {
    try {
      await startBox();

      bool isDelete = false;

      await auditBox.delete(auditId);

      final auditExists = await auditBox.get(auditId);

      if (auditExists == null) {
        isDelete = true;
      }

      return isDelete;
    } on HiveError catch (error) {
      if (error.message.contains('Box not found')) {
        throw BoxNotFound();
      }
      throw ExceptionRequest();
    }
  }

  Future<AuditModel> getAudit(String auditId) async {
    try {
      await startBox();
      final auditData = await auditBox.get(auditId);

      if (auditData == null) {
        throw AuditNotFound();
      }

      final audit = await AuditModel.fromMap(auditData);
      return audit;
    } on HiveError catch (error) {
      if (error.message.contains('Box not found')) {
        throw BoxNotFound();
      }
      throw ExceptionRequest();
    }
  }

  Future<List<AuditModel>> getAllAudit() async {
    try {
      await startBox();
      List<AuditModel> auditList = [];

      final getAllAuditkeys = auditBox.keys;

      for (var data in getAllAuditkeys) {
        auditList.add(AuditModel.fromMap(await auditBox.get(data)));
      }
      return auditList;
    } on HiveError catch (error) {
      if (error.message.contains('Box not found')) {
        throw BoxNotFound();
      }
      throw ExceptionRequest();
    }
  }
}
