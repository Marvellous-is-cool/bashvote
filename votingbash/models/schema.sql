-- Create database if it doesn't exist
CREATE DATABASE IF NOT EXISTS bashvote;
USE bashvote;

-- Drop tables if they exist (in correct order due to foreign keys)
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS award_contestants;
DROP TABLE IF EXISTS contestants;
DROP TABLE IF EXISTS awards;
DROP TABLE IF EXISTS admins;
DROP TABLE IF EXISTS sessions;

-- Sessions table (for express-mysql-session)
CREATE TABLE sessions (
    session_id VARCHAR(128) NOT NULL PRIMARY KEY,
    expires INT(11) UNSIGNED NOT NULL,
    data MEDIUMTEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- Awards table
CREATE TABLE awards (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY unique_award_title (title)
) ENGINE=InnoDB;

-- Contestants table
CREATE TABLE contestants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(255) NOT NULL,
    level VARCHAR(100),
    department VARCHAR(255),
    photo_url VARCHAR(255),
    votes INT UNSIGNED DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY unique_nickname (nickname)
) ENGINE=InnoDB;

-- Award Contestants (junction table)
CREATE TABLE award_contestants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    contestant_id INT NOT NULL,
    award_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY unique_contestant_award (contestant_id, award_id),
    FOREIGN KEY (contestant_id) REFERENCES contestants(id) ON DELETE CASCADE,
    FOREIGN KEY (award_id) REFERENCES awards(id) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Admins table
CREATE TABLE admins (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL, -- Consider using a secure hashing algorithm
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    UNIQUE KEY unique_username (username)
) ENGINE=InnoDB;

-- Payments table
CREATE TABLE payments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    contestant_id INT NOT NULL, -- Changed from contestant_nickname to contestant_id for consistency
    award_id INT NOT NULL,
    amount_divided_by_10 DECIMAL(10,2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) NOT NULL DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (contestant_id) REFERENCES contestants(id) ON DELETE CASCADE,
    FOREIGN KEY (award_id) REFERENCES awards(id) ON DELETE CASCADE,
    CHECK (status IN ('pending', 'paid', 'failed'))
) ENGINE=InnoDB;

-- Add indexes for common queries
CREATE INDEX idx_contestants_votes ON contestants(votes);
CREATE INDEX idx_payments_status ON payments(status);
CREATE INDEX idx_payments_date ON payments(payment_date);

-- Insert a default admin (change the password!)
INSERT INTO admins (username, password) VALUES ('admin', 'changeme123');

INSERT INTO awards (title) VALUES 
('Best Performance'),
('Most Popular'),
('Rising Star');

-- Config table for storing key-value pairs (e.g., live votes status)
CREATE TABLE IF NOT EXISTS config (
    `key` VARCHAR(100) PRIMARY KEY,
    `value` VARCHAR(255) NOT NULL
) ENGINE=InnoDB;