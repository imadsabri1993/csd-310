CREATE TABLE student (
  student_id INT NOT NULL,
  student_data int,

  PRIMARY KEY (student_id)
) ENGINE=INNODB;

CREATE TABLE studn1 (
  studn1_id INT,
  studn1_data INT,
  fk_student_id INT,

  INDEX par_ind1 (fk_student_id),

  FOREIGN KEY (fk_student_id)
    REFERENCES student(student_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=INNODB;

CREATE TABLE studn2 (
  studn2_id INT,
  studn2_data INT,
  fk_student_id INT,

  INDEX par_ind2 (fk_student_id),

  FOREIGN KEY (fk_student_id)
    REFERENCES student(student_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
) ENGINE=INNODB;

INSERT INTO student
  (student_id, student_data)
  VALUES
  (1, 11),
  (2, 12);

INSERT INTO studn1
  (studn1_id, studn1_data, fk_student_id)
  VALUES
  (101, 1001, 1),
  (102, 1002, 1),
  (103, 1003, 1),
  (104, 1004, 2),
  (105, 1005, 2);

INSERT INTO studn2
  (studn2_id, studn2_data, fk_student_id)
  VALUES
  (106, 1006, 1),
  (107, 1007, 1),
  (108, 1008, 1),
  (109, 1009, 2),
  (110, 1010, 2);