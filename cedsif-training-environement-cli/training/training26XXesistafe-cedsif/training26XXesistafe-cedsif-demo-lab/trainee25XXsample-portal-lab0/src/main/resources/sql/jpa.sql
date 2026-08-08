
/**
 * Author:  Danilo Jo
 * Created: 17/abr/2022
 */
--tomcat-docker-process


--jdbcUrl-configuration
--jdbc:mysql://0.0.0.0:3305/cloud?zeroDateTimeBehavior=convertToNull
--mysqld --early-plugin-load="myplug1=myplug1.so;myplug2=myplug2.so"
--mysql --help | grep /my.cnf
--/usr/bin/mysqlcheck


--with root set
GRANT ALL ON sfw.* TO 'ce23XXnomeapelido'@'localhost' identified by 'da'; --local access
--
--GRANT ALL ON web.* TO 'ce007jamesbond'@'%' identified by 'da'; --local access
--Mysql8


--https://dev.mysql.com/doc/refman/8.4/en/alter-user.html|caching_sha2_password2
--
SELECT user,host
    FROM mysql.user;

--
DROP user trainee24shifu@'';

--root grants
SHOW GRANTS FOR 'root'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;


--distributedsystem
CREATE USER 'trainee24xxdakara'@'%' IDENTIFIED BY 'ds';
GRANT ALL ON dsystem.* TO 'trainee24xxdakara'@'%';

--softwaredevelopment
CREATE USER 'trainee24xxshifu'@'training24xxsoftwaredevelopment-node61' IDENTIFIED BY 'da';
GRANT ALL PRIVILEGES ON `training24XXsoftwaredevelopment_db_grupo_x`.* TO `trainee24xxshifu`@`training24xxsoftwaredevelopment-node61` WITH GRANT OPTION; 

--https://www.jetbrains.com/help/datagrip/how-to-connect-to-mysql-with-unix-sockets.html#step-4-configure-the-mysql-driver-in-ide
mysql -utrainee24xxshifu -pda -hmysqldb-laba2e2.net -P3306
mysql -utrainee24xxshifu -pda -hmysqldb-laba2e2.net -e "select @@socket"

ALTER mysql.user 'trainee24xxshifu'@'%' IDENTIFIED WITH caching_sha2_password BY 'da';
ALTER mysql.user 'trainee24xxshifu'@'%' IDENTIFIED WITH mysql_native_password BY 'da'; 
sudo ufw allow 3305
mysql -utrainee24xxshifu -pda -h10.10.11.1 -P3305
  --PASSWORD EXPIRE INTERVAL 180 DAY
  --FAILED_LOGIN_ATTEMPTS 3 PASSWORD_LOCK_TIME 2;

SHOW GRANTS FOR 'trainee24xxshifu'@'172.26.0.1';
SHOW GRANTS FOR 'trainee24xxshifu'@'%';



--0|https://confluence.atlassian.com/jirakb/configuring-database-connection-results-in-error-host-xxxxxxx-is-not-allowed-to-connect-to-this-mysql-server-358908249.html
--GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER,INDEX on <JIRADB>.* TO '<USERNAME>'@'<JIRA_SERVER_HOSTNAME>' IDENTIFIED BY '<PASSWORD>';
--flush privileges;
mysql -uroot -pxxxx
DROP user trainee24xxshifu;
--1 remote
CREATE USER 'trainee24xxshifu'@'opensource' IDENTIFIED BY 'da';
CREATE USER 'root'@'192.168.122.1' IDENTIFIED BY 'root';
CREATE USER 'root'@'172.18.0.3' IDENTIFIED BY 'root';
CREATE USER 'root'@'training24xxsoftwaredevelopment-node61' IDENTIFIED BY 'root';
--2 local only
CREATE USER trainee24xxshifu IDENTIFIED BY 'da';
--3 
----3.1 Grants Usage on
--GRANT ALL PRIVILEGES ON training24XXsoftwaredevelopment_db_grupo_x.* TO 'trainee24xxshifu'@'opensource' WITH GRANT OPTION;
--REVOKE ALL PRIVILEGES ON training24XXsoftwaredevelopment_db.* FROM 'trainee24xxshifu'@'%' WITH GRANT OPTION;

----3.2 Grants operations
GRANT ALL ON training24XXsoftwaredevelopment_db_grupo_x.* TO 'trainee24xxshifu'@'%';
GRANT INSERT,UPDATE,DELETE ON *.* TO 'trainee24xxshifu'@'%';

GRANT ALL ON training24XXsoftwaredevelopment_db_grupo_x.* TO 'trainee24xxshifu'@'172.18.0.1' WITH GRANT OPTION;
GRANT ALL ON training24XXsoftwaredevelopment_db_grupo_x.* TO 'root'@'172.18.0.1' WITH GRANT OPTION;
GRANT ALL ON training24XXsoftwaredevelopment_db_grupo_x.* TO 'root'@'192.168.122.1' WITH GRANT OPTION;

CREATE USER 'trainee24xx'@'%' IDENTIFIED BY 'da';
CREATE USER 'trainee24xxshifu'@'172.18.0.3' IDENTIFIED BY 'da';
GRANT ALL ON training24XXsoftwaredevelopment_db_grupo_x.* TO 'trainee24xx'@'opensource';
GRANT ALL ON training24XXsoftwaredevelopment_db_grupo_x.* TO 'trainee24xxshifu'@'opensource';
GRANT INSERT,UPDATE,DELETE ON *.* TO 'trainee24xxshifu'@'172.18.0.1';

FLUSH PRIVILEGES;
SHOW GRANTS FOR 'trainee24xxshifu'@'172.18.0.1';
--4
EXIT
--5
mysql -utrainee24xxshifu -pda -h10.10.11.1 -P3305 --GW_LXD
mysql -utrainee24xxshifu -pda -h172.18.0.1 -P3305 --GW_DOCKER
mysql -utrainee24xxshifu -pda -hmysqldbshared-db-service -P3305
--6
CREATE database training24XXsoftwaredevelopment_db_grupo_x;
SHOW USE databases;
--7
GRANT INSERT ON *.* TO 'trainee24xxshifu'@'%';
INSERT INTO user_authentication (ID,NAME,ACCOUNT,CREDENTIAL,ACTIVE) values(100,
                        'Trainee24XXShifu',
                        'trainee24xxshifu', 
                        'da',
                         1
);

--revoke grants

REVOKE ALL PRIVILEGES ON *.* FROM 'trainee24xxshifu';
REVOKE ALL PRIVILEGES ON *.* FROM 'trainee24xxshifu'@'172.18.0.1';

REVOKE ALL PRIVILEGES ON *.* FROM 'trainee24xxshifu'@'10.10.11.1';
REVOKE ALL PRIVILEGES ON training24XXsoftwaredevelopment_db.* FROM 'trainee24xxshifu'@'10.10.11.1' WITH GRANT OPTION;

--setting roles
ALTER USER 'trainee24xxshifu'@'%' DEFAULT ROLE trainee, traineer;

--reassing host of user
RENAME USER 'trainee24xxshifu'@'10.10.11.1' TO 'trainee24xxshifu'@'%';
RENAME USER 'trainee24xxshifu'@'172.18.0.1' TO 'trainee24xxshifu'@'0.0.0.0';
RENAME USER 'trainee24xxshifu'@'%' TO 'trainee24xxshifu'@'172.18.0.1';


--granting access only to one-container and one-user
ALTER USER 'trainee24xxshifu'@'172.24.0.1' IDENTIFIED BY 'da';
CREATE USER 'trainee24xxshifu'@'10.10.11.1' IDENTIFIED BY 'da';
GRANT ALL ON training24XXsoftwaredevelopment_db_grupo_x.* TO 'trainee24xxshifu'@'%';
SHOW GRANTS FOR 'trainee24xxshifu'@'172.18.0.1';

--cloudcomputing
CREATE USER 'trainee24xxwufeign'@'%' IDENTIFIED BY 'cloud';
GRANT ALL ON cloud.* TO 'trainee24xxwufeign'@'%';
-------------------------------------------------------------------------------
--mysql-docker-process-cloud students

mysql -utrainee24xxshifu -pda -h10.10.11.1 -P3305
mysql -utrainee24xxshifu -pda -h10.10.11.1 --protocol=tcp
----Error:
--mysql: [Warning] Using a password on the command line interface can be insecure.
--ERROR 1045 (28000): Access denied for user 'trainee24xxshifu'@'172.24.0.1' (using password: YES)

----Fix:-https://dba.stackexchange.com/questions/38803/mysql-error-1045-28000-access-denied-for-user|https://www.sysinfotools.com/blog/recover-mysql-database-from-ibdata1/
--1-mysql -u repl -p123 -h127.0.0.1 --protocol=tcp
--2-GRANT USAGE ON *.* TO 'repl'@'localhost' IDENTIFIED BY '123';

mysql -utrainee24xxshifu -pda -htraining.dmj-it.net -P3305 --protocol=tcp

--step1:database creatio
create schema sfw;

--8_create schema mobile;
set autocommit=0; --controls the commit

--create tables
--t1.1 - credential --must change every time user requests a log in.
create table training24XXsoftwaredevelopment_db_grupo_x.user_authentication(
    id      integer(3),
    name    varchar(50),
    account varchar(50),
    credential  varchar(50), 
    active char(1)
);

ALTER TABLE training24XXsoftwaredevelopment_db_grupo_x.user_authentication 
    ADD PRIMARY KEY pk01 (account);
    
--t1.1.constraint
ALTER TABLE sfw.user_authentication 
    ADD PRIMARY KEY pk01 (account);

ALTER TABLE sfw.user_authentication 
    ADD COLUMN creation_date timestamp DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE sfw.user_authentication 
    ADD COLUMN   update_date timestamp DEFAULT CURRENT_TIMESTAMP;

--insert values
GRANT INSERT ON *.* TO 'trainee24xxshifu'@'%';
INSERT INTO sfw.user_authentication (ID,NAME,ACCOUNT,CREDENTIAL,ACTIVE) values(100,
                        'Trainee24XXShifu',
                        'trainee24xxshifu', 
                        'da',
                         1
);

--insercao na table profile
--no-profile|trainee|traineer

insert into user_authenticator (ID,NAME,ACCOUNT,CREDENTIAL,PROFILE_CODE,ACTIVE)
values(1,"Trainee24xxShifu","trainee24xxshifu","da","trainee",1);


insert into profile (ID,CODE,DESCRIPTION) values (1,"no-profile", "Sem perfil definido");
update table  profile p set p.active=1 where p.active=0;
 
insert into profile (ID,CODE,DESCRIPTION) values (2,"trainee"   , "Estadante em Treino");
insert into profile (ID,CODE,DESCRIPTION) values (3,"traineer"  , "Mentor");
--t1.2-===========================================================
create table sfw.roles(
    id   integer(3),
    code enum('admin','user','no-role'),
    description  varchar(100),
    active char(1)
);

--t1.2.association.1
create table sfw.user_roles(
    fk_user_account varchar(15),
    fk_role_code    enum('admin','user','no-role')
);

--t1.2.constraint
--pk01
ALTER TABLE sfw.roles ADD PRIMARY KEY pk01 (code);
--ALTER TABLE sfw.roles ADD COLUMN code enum('admin','user','no-role');
ALTER TABLE sfw.roles ADD COLUMN creation_date timestamp DEFAULT CURRENT_TIMESTAMP;

--insertions
INSERT INTO sfw.roles(id,code,description,active) values(100,
                        'admin',
                        'Administrator', 
                         1
);

INSERT INTO sfw.roles values(101,
                        'no-role',
                        'Unknown', 
                         1
);

INSERT INTO sfw.user_roles values('ce23XXshifu','admin');

--fk01ADD CONSTRAINT fk01_user_account 
ALTER TABLE sfw.user_roles ADD CONSTRAINT fk01_user_account 
    FOREIGN KEY (fk_user_account) REFERENCES sfw.user_authentication(account)   
        ON UPDATE CASCADE

--fk02
ALTER TABLE sfw.user_roles ADD CONSTRAINT fk02_role_code 
    FOREIGN KEY (fk_role_code) REFERENCES sfw.roles(code) 
        ON UPDATE CASCADE;

--t1.3-==========================================================
create table sfw.profile(
    id   integer(3),
    code varchar(15), --admin|administrator, --user|User
    description  varchar(50),
    active char(1) default true
);

--t1.3.association.3
create table sfw.user_profile(
    fk_user_account varchar(15),
    fk_profile_code varchar(15)
);

--t1.3.constraint
--pk01
ALTER TABLE sfw.profile ADD PRIMARY KEY pk01 (code);

--fk01
ALTER TABLE sfw.user_profile ADD CONSTRAINT fk01_user_account 
    FOREIGN KEY (account) REFERENCES sfw.user_authentication(fk_user_account) 
        --ON DELETE CASCADE  
        ON UPDATE CASCADE;
--fk02
ALTER TABLE sfw.user_profile ADD CONSTRAINT fk02_profile_code 
    FOREIGN KEY (code) REFERENCES sfw.roles(fk_profile_code) 
        --ON DELETE CASCADE  
        ON UPDATE CASCADE;

--===============================================================
--t1.4-==========================================================
create table sfw.modules(
    code varchar(15), -- admin|Administrator, --user|User
    description  varchar(50),
    active char(1)
);

--t1.4.association.4
create table sfw.user_modules(
    fk_user_account varchar(15),
    fk_module_code varchar(15)
);

--t1.4.constraint
--pk01
ALTER TABLE sfw.modules ADD PRIMARY KEY pk01 (code);

--fk01
ALTER TABLE sfw.user_modules ADD CONSTRAINT fk01_user_account 
    FOREIGN KEY (account) REFERENCES sfw.user_authentication(fk_user_account) 
        --ON DELETE CASCADE  
        ON UPDATE CASCADE;
--fk02
ALTER TABLE sfw.user_modules ADD CONSTRAINT fk02_module_code 
    FOREIGN KEY (code) REFERENCES sfw.roles(fk_module_code) 
        --ON DELETE CASCADE  
        ON UPDATE CASCADE;
--===============================================================


