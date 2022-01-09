/// Notifications database
// Table and columns
const String kTableName = 'notes';
const String kIDColumnName = 'id';
const String kDataColumnName = 'data';

// Commands
const String kCreateDBCmd =
    'CREATE TABLE $kTableName ($kIDColumnName INTEGER PRIMARY KEY, $kDataColumnName TEXT)';
