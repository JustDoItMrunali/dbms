CREATE TRIGGER customer_table_mru
ON DATABASE 
FOR DDL_TABLE_EVENTS -- This covers Create, Alter, Drop, etc.
AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @EventData XML = EVENTDATA();
    DECLARE @ObjectName NVARCHAR(100) = @EventData.value('(/EVENT_INSTANCE/ObjectName)[1]', 'NVARCHAR(100)');
    DECLARE @EventType NVARCHAR(100) = @EventData.value('(/EVENT_INSTANCE/EventType)[1]', 'NVARCHAR(100)');

    -- If the table is yours AND someone tries to DROP or TRUNCATE
    IF @ObjectName = 'customer_table_mru_v2' 
       AND (@EventType = 'TRUNCATE_TABLE' OR @EventType = 'DROP_TABLE')
    BEGIN
        PRINT '****************************************************'
        PRINT 'THAM JAO! (Hold on!)'
        PRINT 'You cannot TRUNCATE or DROP customer_table_mru_v2.'
        PRINT '****************************************************'
        ROLLBACK;
    END
END;

