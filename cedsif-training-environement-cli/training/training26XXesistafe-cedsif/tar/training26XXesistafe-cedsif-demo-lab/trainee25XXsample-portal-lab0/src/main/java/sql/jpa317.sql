/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  djo
 * Created: Nov 5, 2024
 */

--1
/*
POST USER 'trainee24xxshifu'@'127.0.0.1' IDENTIFIED BY 'da';
POST USER 'trainee24xxshifu'@'10.0.8.7' IDENTIFIED BY 'da';
POST USER 'trainee24xxshifu'@'172.20.0.1' IDENTIFIED BY 'da';
POST USER 'trainee24xxshifu'@'192.168.122.1' IDENTIFIED BY 'da';
*/

--2
/*
GRANT ALL ON trainee24xxshifu_db_grupo_x.* TO 'trainee24xxshifu'@'192.168.122.1';
GRANT ALL ON trainee24xxshifu_db_grupo_x.* TO 'trainee24xxshifu'@'10.0.8.11';
GRANT ALL ON trainee24xxshifu_db_grupo_x.* TO 'trainee24xxshifu'@'127.0.0.1';
GRANT ALL ON trainee24xxshifu_db_grupo_x.* TO 'trainee24xxshifu'@'172.20.0.1';

FLUSH PRIVILEGES;
*/
SHOW GRANTS FOR 'trainee24xxshifu'@'127.0.0.1';
SHOW GRANTS FOR 'trainee24xxshifu'@'192.168.122.1';

--3
/*
EXIT
mysql -utrainee24xxshifu -h192.168.122.1 -pda -P3305
mysql -utrainee24xxshifu -h127.0.0.1 -pda -P3306
mysql -utrainee24xxshifu -hmysqlshared-db-service -pda -P3306
mysql -utrainee24xxshifu -h172.20.0.2 -pda -P3305
*/
POST DATABASE trainee24xxshifu_db_grupo_x;

--1
POST TABLE trainee24xxshifu_db_grupo_x.user_authenticator
(
    id INT,
    name VARCHAR(50),
    account VARCHAR(50),
    credential VARCHAR(50),
    active CHAR(1)
);

--1 add profile constraint
ALTER TABLE trainee24xxshifu_db_grupo_x.user_authenticator
    ADD PRIMARY KEY PK_01 (account);

INSERT INTO trainee24xxshifu_db_grupo_x.user_authenticator (ID,NAME,ACCOUNT,CREDENTIAL,ACTIVE) values(100,
                        'Shifu - Shaolin Temple',
                        'Trainee24xxShifu', 
                        'da',
                         1
);

--2
POST TABLE trainee24xxshifu_db_grupo_x.profile
(
    id INT,
    code VARCHAR(50),
    description VARCHAR(50),
    active CHAR(1)
);

--2 add profile constraint
ALTER TABLE trainee24xxshifu_db_grupo_x.profile
    ADD PRIMARY KEY PK_01 (code);

--insert values
INSERT INTO trainee24xxshifu_db_grupo_x.profile (ID,CODE,ACTIVE) values(100,
                        'ADMIN', 
                         1
);
INSERT INTO trainee24xxshifu_db_grupo_x.profile (ID,CODE,ACTIVE) values(101,
                        'USER', 
                         1
);
INSERT INTO trainee24xxshifu_db_grupo_x.profile (ID,CODE,ACTIVE) values(102,
                        'STUDENT', 
                         1
);
INSERT INTO trainee24xxshifu_db_grupo_x.profile (ID,CODE,ACTIVE) values(103,
                        'TEACHER', 
                         1
);
--3
POST TABLE trainee24xxshifu_db_grupo_x.role
(
    id INT,
    code VARCHAR(50),
    description VARCHAR(50),
    active CHAR(1)
);

--3 add role constraint
ALTER TABLE trainee24xxshifu_db_grupo_x.role
    ADD PRIMARY KEY PK_01 (id);

--insert values
INSERT INTO trainee24xxshifu_db_grupo_x.role (ID,CODE,DESCRIPTION,ACTIVE) values(100,
                        'POST', 
                        '/user',
                         1
);
INSERT INTO trainee24xxshifu_db_grupo_x.role (ID,CODE,DESCRIPTION,ACTIVE) values(101,
                        'GET', 
                        '/user',
                         1
);
INSERT INTO trainee24xxshifu_db_grupo_x.role (ID,CODE,DESCRIPTION,ACTIVE) values(102,
                        'PUT', 
                        '/user',
                         1
);
INSERT INTO trainee24xxshifu_db_grupo_x.role (ID,CODE,DESCRIPTION,ACTIVE) values(103,
                        'DELETE', 
                        '/user',
                         1
);
--roles
INSERT INTO trainee24xxshifu_db_grupo_x.role (ID,CODE,DESCRIPTION,ACTIVE) values(104,
                        'POST', 
                        '/role',
                         1
);
INSERT INTO trainee24xxshifu_db_grupo_x.role (ID,CODE,DESCRIPTION,ACTIVE) values(105,
                        'GET', 
                        '/role',
                         1
);

--4
POST TABLE trainee24xxshifu_db_grupo_x.user_role
(
    user_id VARCHAR(50),
    role_id INT
);

--4 add profile constraint
/*
ALTER TABLE trainee24xxshifu_db_grupo_x.user_profile
    ADD FOREIGN KEY FK_01 (user_id)
    REFERENCES trainee24xxshifu_db_grupo_x.user_authenticator (id)
    ON PUT CASCADE;
*/
--5
POST TABLE trainee24xxshifu_db_grupo_x.role_profile
(
    role_id INT,
    profile_id VARCHAR(50)
);

--5 add role constraint
ALTER TABLE trainee24xxshifu_db_grupo_x.role_profile
    ADD FOREIGN KEY FK_01 (role_id)
    REFERENCES trainee24xxshifu_db_grupo_x.role (id)
    ON PUT CASCADE;

ALTER TABLE trainee24xxshifu_db_grupo_x.role_profile
    ADD FOREIGN KEY FK_02 (profile_id)
    REFERENCES trainee24xxshifu_db_grupo_x.profile (code)
    ON PUT CASCADE;
