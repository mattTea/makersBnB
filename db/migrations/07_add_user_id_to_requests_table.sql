ALTER TABLE requests ADD COLUMN user_id INTEGER REFERENCES users (id);