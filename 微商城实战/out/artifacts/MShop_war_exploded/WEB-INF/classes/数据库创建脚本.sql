-- 删除数据库
DROP DATABASE IF EXISTS mshop ;
-- 创建数据库
CREATE DATABASE mshop CHARACTER SET UTF8 ;
--使用mshop数据库
USE mshop ;
-- 删除数据表
DROP TABLE IF EXISTS shopcar ;
DROP TABLE IF EXISTS details ;
DROP TABLE IF EXISTS orders ;
DROP TABLE IF EXISTS member ;
DROP TABLE IF EXISTS goods ;
DROP TABLE IF EXISTS item ;
DROP TABLE IF EXISTS admin ;

-- 创建数据表
-- 1、创建商品类型表
CREATE TABLE item
(
   iid         INT    AUTO_INCREMENT ,
   title       VARCHAR(200) NOT NULL ,
   CONSTRAINT pk_iid PRIMARY KEY(iid)
) type=innodb ;

-- 2、创建管理员信息表
CREATE TABLE admin
(
  aid          VARCHAR(50) ,
  password     VARCHAR(32) ,
  lastdate     DATETIME ,
  CONSTRAINT pk_aid PRIMARY KEY(aid)
) type=innodb ;

-- 3、创建用户信息表
CREATE TABLE member
(
  mid             VARCHAR(20) ,
  password        VARCHAR(32) NOT NULL ,
  name            VARCHAR(50) ,
  phone           VARCHAR(50) ,
  address         VARCHAR(100) ,
  code            VARCHAR(100) ,
  status          INT ,
  regdate         DATETIME    NOT NULL ,
  photo           VARCHAR(50) DEFAULT 'nophoto.jpg',
  CONSTRAINT pk_mid PRIMARY KEY(mid)
) type=innodb ;

-- 4、创建商品信息表
CREATE TABLE goods
(
  gid             INT   AUTO_INCREMENT ,
  iid             INT ,
  aid             VARCHAR(50) ,
  title           VARCHAR(50) ,
  pubdate         DATETIME ,
  price           FLOAT ,
  amount          INT ,
  bow             INT ,
  note            TEXT ,
  photo           VARCHAR(100) ,
  status          INT ,
  CONSTRAINT pk_gid PRIMARY KEY(gid) ,
  CONSTRAINT fk_iid FOREIGN KEY(iid) REFERENCES item(iid) ON DELETE SET NULL ,
  CONSTRAINT fi_aid FOREIGN KEY(aid) REFERENCES admin(aid) ON DELETE SET NULL
) type=innodb ;

-- 5、创建订单信息表
CREATE TABLE orders
(
  oid             INT   AUTO_INCREMENT ,
  mid             VARCHAR(50) ,
  name            VARCHAR(50) ,
  phone           VARCHAR(50) ,
  address         VARCHAR(100) ,
  credate         DATETIME ,
  pay             FLOAT ,
  CONSTRAINT pk_oid PRIMARY KEY(oid) ,
  CONSTRAINT fk_mid FOREIGN KEY(mid) REFERENCES member(mid) ON DELETE CASCADE -- 如果用户被删除，订单没有必要被保存.
) type=innodb ;

-- 6、创建订单详情表
CREATE TABLE details
(
  odid             INT   AUTO_INCREMENT ,
  oid              INT   NOT NULL ,
  gid              INT ,
  title            VARCHAR(50)    NOT NULL ,
  price            FLOAT NOT NULL ,
  amount           INT   NOT NULL ,
  CONSTRAINT pk_odid PRIMARY KEY (odid) ,
  CONSTRAINT fk_oid FOREIGN KEY(oid) REFERENCES orders(oid) ON DELETE CASCADE ,
  CONSTRAINT fk_gid FOREIGN KEY(gid) REFERENCES goods(gid) ON DELETE SET NULL
) type=innodb ;

-- 7、购物车信息表
CREATE TABLE shopcar(
  gid              INT    ,
  mid              VARCHAR (50) ,
  amount           INT    ,
  CONSTRAINT fk_gid3 FOREIGN KEY(gid) REFERENCES goods(gid) ON DELETE CASCADE ,
  CONSTRAINT fk_mid3 FOREIGN KEY(mid) REFERENCES member(mid) ON DELETE CASCADE 
) ;

-- 编写测试数据
-- 增加商品分类信息
INSERT INTO item(title) VALUES('厨房用品') ;
INSERT INTO item(title) VALUES('儿童玩具') ;
INSERT INTO item(title) VALUES('医疗器械') ;
INSERT INTO item(title) VALUES('运动健身') ;
INSERT INTO item(title) VALUES('办公用品') ;

-- 增加管理员信息: admin / admin
INSERT INTO admin(aid,password) VALUES ('admin','21232F297A57A5A743894A0E4A801FC3') ;

-- 增加普通用户信息：root / 123456
INSERT INTO member(mid,password,regdate) VALUES ('root','E10ADC3949BA59ABBE56E057F20F883E','2018-04-05') ;

-- 提交事务
COMMIT