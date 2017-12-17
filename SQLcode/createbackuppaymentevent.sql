CREATE EVENT IF NOT EXISTS `backup_payments_event`
ON SCHEDULE
  EVERY 23 DAY_HOUR
  COMMENT 'Clean up sessions at 23:00 daily!'
  DO
    CALL `comp353`.`backupAllPayments`();
