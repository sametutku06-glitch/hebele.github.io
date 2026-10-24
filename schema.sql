CREATE TABLE IF NOT EXISTS exams (
  id TEXT PRIMARY KEY,
  title TEXT NOT NULL,
  category TEXT NOT NULL,
  grade TEXT NOT NULL,
  description TEXT NOT NULL DEFAULT '',
  pdf_key TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  published INTEGER NOT NULL DEFAULT 1
);
CREATE INDEX IF NOT EXISTS exams_filter ON exams(category, grade, published, created_at);
CREATE TABLE IF NOT EXISTS settings (
  key TEXT PRIMARY KEY,
  value TEXT NOT NULL
);
INSERT OR IGNORE INTO settings(key, value) VALUES
 ('portal_title', 'Cam Sınav Arşivi'),
 ('portal_subtitle', 'Hazırlıklarını seç, odaklan, ilerle.'),
 ('music_enabled', 'true'),
 ('music_key', '');
