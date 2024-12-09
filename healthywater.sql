CREATE TABLE role
(
    id   INT(11)      NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    PRIMARY KEY (id) USING BTREE
)
    COLLATE = 'utf8mb4_general_ci'
    ENGINE = InnoDB
    AUTO_INCREMENT = 3
;

CREATE TABLE users
(
    id               INT(11)      NOT NULL AUTO_INCREMENT,
    role_id          INT(11)      NULL DEFAULT NULL,
    username         VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    fullname         VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    email            VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    phone_number     VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    sex              VARCHAR(50)  NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    address          VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    password         VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    created_at       DATETIME     NULL DEFAULT NULL,
    updated_at       DATETIME     NULL DEFAULT NULL,
    status           INT(11)      NULL DEFAULT NULL,
    active           INT(11)      NULL DEFAULT NULL,
    provider         VARCHAR(50)  NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    provider_user_id VARCHAR(500) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    PRIMARY KEY (id) USING BTREE,
    INDEX role_id (role_id) USING BTREE,
    CONSTRAINT users_ibfk_1 FOREIGN KEY (role_id) REFERENCES role (id) ON UPDATE RESTRICT ON DELETE RESTRICT
)
    COLLATE = 'utf8mb4_general_ci'
    ENGINE = InnoDB
    AUTO_INCREMENT = 19
;

CREATE TABLE brands
(
    id   INT(11)      NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    PRIMARY KEY (id) USING BTREE
)
    COLLATE = 'utf8mb4_general_ci'
    ENGINE = InnoDB
    AUTO_INCREMENT = 6
;

CREATE TABLE categorys
(
    id   INT(11)      NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    PRIMARY KEY (id) USING BTREE
)
    COLLATE = 'utf8mb4_general_ci'
    ENGINE = InnoDB
    AUTO_INCREMENT = 6
;

CREATE TABLE type_machines
(
    id        INT(11)      NOT NULL AUTO_INCREMENT,
    type_name VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    PRIMARY KEY (id) USING BTREE
)
    COLLATE = 'utf8mb4_general_ci'
    ENGINE = InnoDB
    AUTO_INCREMENT = 6
;

CREATE TABLE products
(
    id              INT(11)      NOT NULL AUTO_INCREMENT,
    category_id     INT(11)      NULL DEFAULT NULL,
    type_machine_id INT(11)      NULL DEFAULT NULL,
    brand_id        INT(11)      NULL DEFAULT NULL,
    title           VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    price           INT(11)      NULL DEFAULT NULL,
    img             VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    discount_price  INT(11)      NULL DEFAULT NULL,
    available       INT(11)      NULL DEFAULT NULL,
    descriptions    LONGTEXT     NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    created_at      DATE         NULL DEFAULT NULL,
    updated_at      DATE         NULL DEFAULT NULL,
    status          BIT(1)       NULL DEFAULT NULL,
    PRIMARY KEY (id) USING BTREE,
    INDEX category_id (category_id) USING BTREE,
    INDEX type_machine_id (type_machine_id) USING BTREE,
    INDEX brand_id (brand_id) USING BTREE,
    CONSTRAINT products_ibfk_1 FOREIGN KEY (category_id) REFERENCES categorys (id) ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT products_ibfk_2 FOREIGN KEY (type_machine_id) REFERENCES type_machines (id) ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT products_ibfk_3 FOREIGN KEY (brand_id) REFERENCES brands (id) ON UPDATE RESTRICT ON DELETE RESTRICT
)
    COLLATE = 'utf8mb4_general_ci'
    ENGINE = InnoDB
    AUTO_INCREMENT = 39
;

CREATE TABLE address
(
    id           INT(11)      NOT NULL AUTO_INCREMENT,
    user_id      INT(11)      NULL DEFAULT NULL,
    address      VARCHAR(500) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    receiver     VARCHAR(500) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    phone_number VARCHAR(50)  NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    PRIMARY KEY (id) USING BTREE,
    INDEX user_id (user_id) USING BTREE,
    CONSTRAINT FK__users FOREIGN KEY (user_id) REFERENCES users (id) ON UPDATE NO ACTION ON DELETE NO ACTION
)
    COLLATE = 'utf8mb4_general_ci'
    ENGINE = InnoDB
    AUTO_INCREMENT = 19
;

CREATE TABLE vouchers
(
    id               INT(11)      NOT NULL AUTO_INCREMENT,
    voucher_name     VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    type             VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    start_date       DATETIME     NULL DEFAULT NULL,
    end_date         DATETIME     NULL DEFAULT NULL,
    note             VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    percent_decrease FLOAT        NULL DEFAULT NULL,
    price_decrease   FLOAT        NULL DEFAULT NULL,
    PRIMARY KEY (id) USING BTREE
)
    COLLATE = 'utf8mb4_general_ci'
    ENGINE = InnoDB
    AUTO_INCREMENT = 23
;

CREATE TABLE orders
(
    id            INT(11)      NOT NULL AUTO_INCREMENT,
    user_id       INT(11)      NULL DEFAULT NULL,
    address       VARCHAR(50)  NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    phone         VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    order_date    DATETIME     NULL DEFAULT NULL,
    status        VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    received_date DATE         NULL DEFAULT NULL,
    total_money   INT(11)      NULL DEFAULT NULL,
    voucher_id    INT(11)      NOT NULL,
    name          VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    PRIMARY KEY (id) USING BTREE,
    INDEX user_id (user_id) USING BTREE,
    INDEX voucher_id (voucher_id) USING BTREE,
    CONSTRAINT orders_ibfk_1 FOREIGN KEY (user_id) REFERENCES users (id) ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT orders_ibfk_2 FOREIGN KEY (voucher_id) REFERENCES vouchers (id) ON UPDATE RESTRICT ON DELETE RESTRICT
)
    COLLATE = 'utf8mb4_general_ci'
    ENGINE = InnoDB
    AUTO_INCREMENT = 158
;

CREATE TABLE order_details
(
    id          INT(11) NOT NULL AUTO_INCREMENT,
    order_id    INT(11) NULL DEFAULT NULL,
    product_id  INT(11) NULL DEFAULT NULL,
    price       INT(11) NULL DEFAULT NULL,
    quantity    INT(11) NULL DEFAULT NULL,
    total_money INT(11) NULL DEFAULT NULL,
    PRIMARY KEY (id) USING BTREE,
    INDEX product_id (product_id) USING BTREE,
    INDEX order_id (order_id) USING BTREE,
    CONSTRAINT order_details_ibfk_1 FOREIGN KEY (product_id) REFERENCES products (id) ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT order_details_ibfk_2 FOREIGN KEY (order_id) REFERENCES orders (id) ON UPDATE RESTRICT ON DELETE RESTRICT
)
    COLLATE = 'utf8mb4_general_ci'
    ENGINE = InnoDB
    AUTO_INCREMENT = 97
;

CREATE TABLE payments
(
    id           INT(11)      NOT NULL AUTO_INCREMENT,
    order_id     INT(11)      NULL DEFAULT NULL,
    payment_type VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    payment_date DATETIME     NULL DEFAULT NULL,
    total        INT(11)      NULL DEFAULT NULL,
    PRIMARY KEY (id) USING BTREE,
    INDEX order_id (order_id) USING BTREE,
    CONSTRAINT payments_ibfk_1 FOREIGN KEY (order_id) REFERENCES orders (id) ON UPDATE RESTRICT ON DELETE RESTRICT
)
    COLLATE = 'utf8mb4_general_ci'
    ENGINE = InnoDB
    AUTO_INCREMENT = 25
;

CREATE TABLE gallerys
(
    id         INT(11)      NOT NULL AUTO_INCREMENT,
    product_id INT(11)      NULL DEFAULT NULL,
    img        VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    PRIMARY KEY (id) USING BTREE,
    INDEX product_id (product_id) USING BTREE,
    CONSTRAINT gallerys_ibfk_1 FOREIGN KEY (product_id) REFERENCES products (id) ON UPDATE RESTRICT ON DELETE RESTRICT
)
    COLLATE = 'utf8mb4_general_ci'
    ENGINE = InnoDB
    AUTO_INCREMENT = 133
;

CREATE TABLE comments
(
    id          INT(11)     NOT NULL AUTO_INCREMENT,
    user_id     INT(11)     NULL DEFAULT NULL,
    product_id  INT(11)     NULL DEFAULT NULL,
    contents    VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    star        VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    display     INT(11)     NULL DEFAULT NULL,
    create_date DATETIME    NULL DEFAULT NULL,
    PRIMARY KEY (id) USING BTREE
)
    COLLATE = 'utf8mb4_general_ci'
    ENGINE = InnoDB
    AUTO_INCREMENT = 4
;

CREATE TABLE contacts
(
    id           INT(11)      NOT NULL AUTO_INCREMENT,
    name         VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    email        VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    phone_number VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    content      VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    PRIMARY KEY (id) USING BTREE
)
    COLLATE = 'utf8mb4_general_ci'
    ENGINE = InnoDB
    AUTO_INCREMENT = 21
;

CREATE TABLE import_product
(
    id          INT(11)  NOT NULL AUTO_INCREMENT,
    import_date DATETIME NULL DEFAULT NULL,
    suplier     TEXT     NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    total_price INT(11)  NULL DEFAULT NULL,
    PRIMARY KEY (id) USING BTREE
)
    COLLATE = 'utf8mb4_general_ci'
    ENGINE = InnoDB
    AUTO_INCREMENT = 15
;

CREATE TABLE import_detail
(
    id                INT(11) NOT NULL AUTO_INCREMENT,
    id_import_product INT(11) NULL DEFAULT NULL,
    id_product        INT(11) NULL DEFAULT NULL,
    quantity          INT(11) NULL DEFAULT NULL,
    price             INT(11) NULL DEFAULT NULL,
    PRIMARY KEY (id) USING BTREE,
    INDEX FK_id_product (id_product) USING BTREE,
    INDEX FK2_id_import_product (id_import_product) USING BTREE,
    CONSTRAINT FK2_id_import_product FOREIGN KEY (id_import_product) REFERENCES import_product (id) ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT FK_id_product FOREIGN KEY (id_product) REFERENCES products (id) ON UPDATE NO ACTION ON DELETE NO ACTION
)
    COLLATE = 'utf8mb4_general_ci'
    ENGINE = InnoDB
    AUTO_INCREMENT = 8
;

CREATE TABLE logs
(
    id         INT(11)      NOT NULL AUTO_INCREMENT,
    action     VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
    table_name VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
    level      VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
    beforeData VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
    afterData  VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
    user_id    INT(11)      NOT NULL,
    time       TIMESTAMP    NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    PRIMARY KEY (id) USING BTREE
)
    COLLATE = 'utf8mb4_general_ci'
    ENGINE = InnoDB
    AUTO_INCREMENT = 2
;

CREATE TABLE posts
(
    id         INT(11)      NOT NULL AUTO_INCREMENT,
    title      VARCHAR(200) NOT NULL COLLATE 'utf8mb4_general_ci',
    content    TEXT         NULL     DEFAULT NULL COLLATE 'utf8mb4_general_ci',
    author     VARCHAR(50)  NOT NULL COLLATE 'utf8mb4_general_ci',
    created_at TIMESTAMP    NOT NULL DEFAULT current_timestamp(),
    PRIMARY KEY (id) USING BTREE
)
    COLLATE = 'utf8mb4_general_ci'
    ENGINE = InnoDB
    AUTO_INCREMENT = 21
;

CREATE TABLE categories_use_voucher
(
    id          INT(11) NOT NULL AUTO_INCREMENT,
    category_id INT(11) NOT NULL,
    voucher_id  INT(11) NOT NULL,
    PRIMARY KEY (id) USING BTREE,
    INDEX FK__categorys (category_id) USING BTREE,
    INDEX FK__vouchers_categories (voucher_id) USING BTREE,
    CONSTRAINT FK__categorys FOREIGN KEY (category_id) REFERENCES categorys (id) ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT FK__vouchers_categories FOREIGN KEY (voucher_id) REFERENCES vouchers (id) ON UPDATE NO ACTION ON DELETE NO ACTION
)
    COLLATE = 'utf8mb4_general_ci'
    ENGINE = InnoDB
    AUTO_INCREMENT = 6
;

CREATE TABLE product_use_voucher
(
    id         INT(11) NOT NULL AUTO_INCREMENT,
    product_id INT(11) NOT NULL,
    voucher_id INT(11) NOT NULL,
    PRIMARY KEY (id) USING BTREE,
    INDEX FK1 (product_id) USING BTREE,
    INDEX FK__vouchers_product (voucher_id) USING BTREE,
    CONSTRAINT FK1 FOREIGN KEY (product_id) REFERENCES products (id) ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT FK__vouchers_product FOREIGN KEY (voucher_id) REFERENCES vouchers (id) ON UPDATE NO ACTION ON DELETE NO ACTION
)
    COLLATE = 'utf8mb4_general_ci'
    ENGINE = InnoDB
    AUTO_INCREMENT = 2
;


INSERT INTO `brands` (`id`, `name`)
VALUES (1, 'Karofi'),
       (2, 'Kangaroo'),
       (3, 'Sunhouse'),
       (4, 'Mutosi'),
       (5, 'Hòa Phát');


INSERT INTO `categorys` (`id`, `name`)
VALUES (1, 'Lọc nước RO'),
       (2, 'Có nóng lạnh'),
       (3, 'Âm tủ để bàn'),
       (4, 'Lọc nước Nano, UF, MF'),
       (5, 'Lọc nước không điện');
INSERT INTO `contacts` (`id`, `name`, `email`, `phone_number`, `content`)
VALUES (1, 'Huy Đoàn Quốc', 'anhlapro090@gmail.com', '0586485990', 'hahds'),
       (2, 'Huy Đoàn Quốc', 'anhlapro090@gmail.com', '0586485990', 'asdasff'),
       (3, 'Huy Đoàn Quốc', 'anhlapro090@gmail.com', '0586485990', 'sadasd'),
       (4, 'Huy Đoàn Quốc', 'anhlapro090@gmail.com', '0586485990', 'sÃ gfasd'),
       (5, 'Huy Đoàn Quốc', 'anhlapro090@gmail.com', '0586485990', 'dfsf'),
       (6, 'Huy Đoàn Quốc', 'anhlapro090@gmail.com', '0586485990', 'sáº§gfsdg'),
       (7, 'Huy Đoàn Quốc', 'anhlapro090@gmail.com', '0586485990', 'ádasdf'),
       (8, 'Huy Đoàn Quốc', 'anhlapro090@gmail.com', '0586485990', 'sadsaf');
INSERT INTO `gallerys` (`id`, `product_id`, `img`)
VALUES (1, 1, 'img/may-loc-nuoc-ro-karofi-kaq-x16-10-loi-130223-054043-600x600.jpg'),
       (2, 1, 'img/small3.jpg'),
       (3, 1, 'img/small2.jpg'),
       (4, 1, 'img/small1.jpg'),
       (5, 2, 'img/p2.1.jpg'),
       (6, 2, 'img/p2.2.jpg'),
       (7, 2, 'img/p2.3.jpg'),
       (8, 2, 'img/p2.4.jpg'),
       (9, 3, 'img/p3.1.jpg'),
       (10, 3, 'img/p3.2.jpg'),
       (11, 3, 'img/p3.3.jpg'),
       (12, 3, 'img/p3.4.jpg'),
       (13, 4, 'img/p4.1.jpg'),
       (14, 4, 'img/p4.2.jpg'),
       (15, 4, 'img/p4.3.jpg'),
       (16, 4, 'img/p4.4.jpg'),
       (17, 5, 'img/p5.1.jpg'),
       (18, 5, 'img/p5.2.jpg'),
       (19, 5, 'img/p5.3.jpg'),
       (20, 5, 'img/p5.4.jpg'),
       (21, 6, 'img/p6.1.jpg'),
       (22, 6, 'img/p6.2.jpg'),
       (23, 6, 'img/p6.3.jpg'),
       (24, 6, 'img/p6.4.jpg'),
       (25, 7, 'img/p7.1.jpg'),
       (26, 7, 'img/p7.2.jpg'),
       (27, 7, 'img/p7.3.jpg'),
       (28, 7, 'img/p7.4.jpg'),
       (29, 8, 'img/p8.1.jpg'),
       (30, 8, 'img/p8.2.jpg'),
       (31, 8, 'img/p8.3.jpg'),
       (32, 8, 'img/p8.4.jpg'),
       (33, 9, 'img/p9.1.jpg'),
       (34, 9, 'img/p9.2.jpg'),
       (35, 9, 'img/p9.3.jpg'),
       (36, 9, 'img/p9.4.jpg'),
       (37, 10, 'img/p10.1.jpg'),
       (38, 10, 'img/p10.2.jpg'),
       (39, 10, 'img/p10.3.jpg'),
       (40, 10, 'img/p10.4.jpg'),
       (41, 11, 'img/p11.1.jpg'),
       (42, 11, 'img/p11.2.jpg'),
       (43, 11, 'img/p11.3.jpg'),
       (44, 11, 'img/p11.4.jpg'),
       (45, 12, 'img/p12.1.jpg'),
       (46, 12, 'img/p12.2.jpg'),
       (47, 12, 'img/p12.3.jpg'),
       (48, 12, 'img/p12.4.jpg'),
       (49, 13, 'img/p13.1.jpg'),
       (50, 13, 'img/p13.2.jpg'),
       (51, 13, 'img/p13.3.jpg'),
       (52, 13, 'img/p13.4.jpg'),
       (53, 14, 'img/p14.1.jpg'),
       (54, 14, 'img/p14.2.jpg'),
       (55, 14, 'img/p14.3.jpg'),
       (56, 14, 'img/p14.4.jpg'),
       (57, 15, 'img/p15.1.jpg'),
       (58, 15, 'img/p15.2.jpg'),
       (59, 15, 'img/p15.3.jpg'),
       (60, 15, 'img/p15.4.jpg'),
       (61, 16, 'img/p16.1.jpg'),
       (62, 16, 'img/p16.2.jpg'),
       (63, 16, 'img/p16.3.jpg'),
       (64, 16, 'img/p16.4.jpg'),
       (65, 17, 'img/p17.1.jpg'),
       (66, 17, 'img/p17.2.jpg'),
       (67, 17, 'img/p17.3.jpg'),
       (68, 17, 'img/p17.4.jpg'),
       (69, 18, 'img/p18.1.jpg'),
       (70, 18, 'img/p18.2.jpg'),
       (71, 18, 'img/p18.3.jpg'),
       (72, 18, 'img/p18.4.jpg'),
       (73, 19, 'img/p19.1.jpg'),
       (74, 19, 'img/p19.2.jpg'),
       (75, 19, 'img/p19.3.jpg'),
       (76, 19, 'img/p19.4.jpg'),
       (77, 20, 'img/p20.1.jpg'),
       (78, 20, 'img/p20.2.jpg'),
       (79, 20, 'img/p20.3.jpg'),
       (80, 20, 'img/p20.4.jpg'),
       (81, 21, 'img/p21.1.jpg'),
       (82, 21, 'img/p21.2.jpg'),
       (83, 21, 'img/p21.3.jpg'),
       (84, 21, 'img/p21.4.jpg');
INSERT INTO `orders` (`id`, `user_id`, `address`, `phone`, `order_date`, `status`, `received_date`, `total_money`,
                      `voucher_id`)
VALUES (109, 1, '126 Phuoc Long', '0586485990', '2024-01-22 21:08:12', 'Đang đặt hàng', NULL, 7984000, 2),
       (110, 1, '126 Phuoc Long', '0586485990', '2024-01-23 00:17:49', 'Đã thanh toán', '2024-01-23', 22360000, 2),
       (111, 1, '126 Phuoc Long', '0586485990', '2024-01-23 00:21:07', 'Đã thanh toán', '2024-01-23', 42320000, 2),
       (112, 1, '126 Phuoc Long', '0586485990', '2024-01-23 00:23:22', 'Đã thanh toán', '2024-01-23', 23648000, 2),
       (113, 1, '126 Phuoc Long', '0586485990', '2024-01-23 00:27:53', 'Đã thanh toán', '2024-01-23', 9744000, 2),
       (114, 1, '126 Phuoc Long', '0586485990', '2024-01-23 00:29:56', 'Đã thanh toán', '2024-01-23', 12144000, 2),
       (115, 1, '126 Phuoc Long', '0586485990', '2024-01-23 00:32:05', 'Đã thanh toán', '2024-01-23', 13960000, 2),
       (116, 1, '126 Phuoc Long', '0586485990', '2024-01-23 00:40:09', 'Đã thanh toán', '2024-01-23', 7590000, 3);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `price`, `quantity`, `total_money`)
VALUES (11, 109, 2, 3490000, 1, 3490000),
       (12, 109, 4, 6490000, 1, 6490000),
       (13, 110, 2, 3490000, 2, 6980000),
       (14, 110, 5, 6990000, 3, 20970000),
       (15, 111, 2, 3490000, 4, 13960000),
       (16, 111, 4, 6490000, 6, 38940000),
       (17, 112, 2, 3490000, 1, 3490000),
       (18, 112, 3, 8690000, 3, 26070000),
       (19, 113, 2, 3490000, 1, 3490000),
       (20, 113, 3, 8690000, 1, 8690000),
       (21, 114, 3, 8690000, 1, 8690000),
       (22, 114, 4, 6490000, 1, 6490000),
       (23, 115, 2, 3490000, 5, 17450000),
       (24, 116, 3, 8690000, 1, 8690000),
       (25, 116, 4, 6490000, 1, 6490000);
INSERT INTO `payments` (`id`, `order_id`, `payment_type`, `payment_date`, `total`)
VALUES (1, 115, 'Thanh toán bằng thẻ ngân hàng', '2024-01-23 00:32:08', 13960000),
       (2, 116, 'Thanh toán bằng tiền mặt', '2024-01-23 00:40:12', 7590000);
INSERT INTO `products` (`id`, `category_id`, `type_machine_id`, `brand_id`, `title`, `price`, `img`, `discount_price`,
                        `descriptions`, `available`, `created_at`, `updated_at`)
VALUES (1, 1, 4, 1, 'Máy lọc nước RO nóng nguội lạnh Karofi KAD-X39 10 lõi', 10490000,
        'img/ro-nong-lanh-karofi-kad-x39-10-loi-140223-034144-600x600.jpg', 6190000, 'Máy lọc nước', 100, '2023-12-18',
        '2023-12-18'),
       (2, 1, 1, 4, 'Máy lọc nước RO Mutosi MP-290SK 9 lõi', 6670000,
        'img/ro-mutosi-mp-290sk-9-loi-140223-054510-600x600-1-600x600.jpg', 3490000, 'Máy lọc nước', 100, '2023-12-10',
        '2023-12-10'),
       (3, 1, 2, 1, 'Máy lọc nước RO nóng nguội lạnh Karofi KAD-X58 11 lõi', 12660000,
        'img/may-loc-nuoc-ro-nong-nguoi-lanh-karofi-kad-x58-11-loi-0-600x600.jpg', 8690000, 'Máy lọc nước', 50,
        '2023-12-11', '2023-12-11'),
       (4, 1, 2, 5, 'Máy lọc nước RO nóng nguội lạnh Hòa Phát HWBS3A 1021 10 lõi', 10670000,
        'img/may-loc-nuoc-ro-nong-nguoi-lanh-hoa-phat-hwbs3a-1021-10-loi-210623-023624-600x600.jpg', 6490000,
        'Máy lọc nước', 2002, '2023-12-16', '2023-12-16'),
       (5, 1, 1, 2, 'Máy lọc nước RO nóng nguội lạnh Kangaroo KG10A12 10 lõi', 10790000,
        'img/may-loc-nuoc-ro-nong-nguoi-lanh-kangaroo-kg10a12-10-loi-050723-040500-600x600.jpg', 6990000,
        'Máy lọc nước', 5, '2023-12-16', '2023-12-16'),
       (6, 4, 1, 2, 'Máy lọc nước RO nóng nguội Karofi KAH-X29 11 lõi', 11790000, 'img/p6.jpg', 6990000,
        'Máy lọc nước RO nóng nguội Karofi KAH-X29 trang bị 11 lõi, màng lọc RO Purifim 100 GPD sản xuất tại Mỹ đảm bảo chất lượng, công nghệ kháng khuẩn Nano Silver cùng nhiều tiện ích như: ngừng hoạt động khi nước đầy bình, tự động xả nước thải,... là một thiết bị lọc nước hữu ích cho gia đình bạn.',
        10, '2023-12-16', '2023-12-16'),
       (7, 3, 3, 5, 'Máy lọc nước RO nóng nguội lạnh Hòa Phát HWBS3A 1021 10 lõi', 10670000, 'img/p7.jpg', 6490000,
        'Máy lọc nước RO nóng nguội lạnh Hòa Phát HWBS3A 1021 10 lõi thiết kế dạng tủ đứng kết hợp màu sắc sang trọng, dễ bố trí ở nhiều không gian như phòng khách, phòng bếp,... ngoài ra máy còn trang bị màng lọc RO Dupont Filmtec sản xuất tại Mỹ đảm bảo chất lượng và hiệu suất lọc, 3 chế độ nước nóng - nguội - lạnh đáp ứng nhiều nhu cầu,...',
        2002, '2023-12-16', '2023-12-16'),
       (8, 4, 2, 4, 'Máy lọc nước RO Karofi KAQ-X16 10 lõi', 10670000, 'img/p8.jpg', 6590000,
        'Máy lọc nước RO Karofi KAQ-X16 với 10, máy được trang bị màng lọc RO 100 GPD sản xuất tại Hàn Quốc đảm bảo chất lượng, thu hồi đến 50% nước tinh khiết cùng nhiều tiện ích như ngừng hoạt động khi áp lực nước thấp, tự động xả nước thải,... ',
        2002, '2023-12-16', '2023-12-16'),
       (9, 2, 3, 2, 'Máy lọc nước RO nóng lạnh Mutosi MP-6100HCE 10 lõi', 10670000, 'img/p9.jpg', 6290000,
        ' Máy lọc nóng lạnh Mutosi MP-6100HCE 10 lõi thiết kế dạng tủ đứng sang trọng, trang bị 3 chế độ nước nóng - nguội - lạnh, bình chứa nước lớn đảm bảo luôn có nước sạch cho gia đình sử dụng, cùng nhiều tiện ích khác như tự ngừng hoạt động khi nước đầy bình hoặc áp lực nước thấp,...',
        2002, '2023-12-16', '2023-12-16'),
       (10, 1, 4, 5, 'Máy lọc nước RO Sunhouse UltraPURE SHA8810K 10 lõi', 11670000, 'img/p10.jpg', 6290000,
        ' Máy lọc nước RO Sunhouse UltraPURE SHA8810K với 10 lõi lọc, màng lọc RO TFC 75 GPD sản xuất tại Hàn Quốc giúp đảm bảo chất lượng nước đầu ra, tổng dung tích 8 lít lọc được 10 -15 lít/giờ, giúp cung cấp đủ nguồn nước sạch đạt chuẩn Bộ Y tế cho gia đình sử dụng',
        2002, '2023-12-16', '2023-12-16'),
       (11, 1, 4, 5, 'Máy lọc nước RO Sunhouse UltraPURE SHA8810K 10 lõi', 11970000, 'img/p11.jpg', 6290000,
        ' Máy lọc nước RO Sunhouse UltraPURE SHA8810K với 10 lõi lọc, màng lọc RO TFC 75 GPD sản xuất tại Hàn Quốc giúp đảm bảo chất lượng nước đầu ra, tổng dung tích 8 lít lọc được 10 -15 lít/giờ, giúp cung cấp đủ nguồn nước sạch đạt chuẩn Bộ Y tế cho gia đình sử dụng',
        2002, '2023-12-16', '2023-12-16'),
       (12, 1, 1, 4, 'Máy lọc nước RO Karofi KAQ-X26 10 lõi', 18670000, 'img/p12.jpg', 6290000,
        'Máy lọc nước RO Karofi KAQ-X26 với 10 lõi lọc, máy được trang bị màng lọc RO Purifim 100 GPD sản xuất tại Mỹ đảm bảo chất lượng, thu hồi đến 50% nước tinh khiết, công suất lọc 20 lít/giờ mạnh mẽ cùng nhiều tiện ích như ngừng hoạt động khi áp lực nước thấp, tự động xả nước thải,...',
        2002, '2023-12-16', '2023-12-16'),
       (13, 2, 3, 4, 'Máy lọc nước RO nóng nguội lạnh Mutosi MP-S1011 10 lõi', 17670000, 'img/p13.jpg', 6290000,
        ' Máy lọc nước RO nóng nguội lạnh Mutosi MP-S1011 10 lõi thiết kế dạng tủ đứng kết hợp màu sắc sang trọng, dễ bố trí ở nhiều không gian như phòng khách, phòng bếp,... ngoài ra máy còn trang bị màng lọc RO 100 GPD sản xuất tại Hàn Quốc đảm bảo chất lượng và nguồn gốc, 3 chế độ nước nóng - nguội - lạnh đáp ứng nhiều nhu cầu,...',
        2002, '2023-12-16', '2023-12-16'),
       (14, 1, 3, 4, 'Máy lọc nước RO nóng nguội lạnh Kangaroo KG10A18 10 lõi', 12670000, 'img/p14.jpg', 6290000,
        ' Máy lọc nước RO nóng nguội lạnh Kangaroo KG10A18 10 lõi thiết kế dạng tủ đứng, phù hợp với nhiều không gian nhà ở, văn phòng,... trang bị màng lọc RO Vortex 100 GPD sản xuất tại Hàn Quốc đảm bảo chất lượng nước sạch đầu ra, 2 vòi riêng biệt tùy chỉnh 3 chế độ nước nóng - nguội - lạnh đáp ứng tốt các nhu cầu của người dùng.',
        2002, '2023-12-16', '2023-12-16'),
       (15, 3, 2, 4, 'Máy lọc nước RO Sanaky VH101HP 11 lõi', 11670000, 'img/p15.jpg', 6290000,
        ' Máy lọc nước RO nóng nguội lạnh Kangaroo KG10A18 10 lõi thiết kế dạng tủ đứng, phù hợp với nhiều không gian nhà ở, văn phòng,... trang bị màng lọc RO Vortex 100 GPD sản xuất tại Hàn Quốc đảm bảo chất lượng nước sạch đầu ra, 2 vòi riêng biệt tùy chỉnh 3 chế độ nước nóng - nguội - lạnh đáp ứng tốt các nhu cầu của người dùng.',
        2002, '2023-12-16', '2023-12-16'),
       (16, 4, 1, 4, 'Máy lọc nước RO nóng nguội lạnh Kangaroo KG10A3 10 lõi', 12670000, 'img/p16.jpg', 6990000,
        ' Máy lọc nước RO Kangaroo VH101HP với 10 lõi lọc, màng lọc RO Filmtec 75 GPD sản xuất tại Hàn Quốc giúp thu hồi 50% nước tinh khiết, với tổng dung tích 6 lít lọc được 10 - 15 lít/giờ, máy đảm bảo gia đình bạn luôn có nước sạch đạt chuẩn nước sạch của Bộ Y tế để sử dụng,...',
        2003, '2023-12-16', '2023-12-16'),
       (17, 5, 2, 3, 'Máy lọc nước RO inverter nóng nguội lạnh Sanaky VH102HP3 11 lõi', 13670000, 'img/p17.jpg',
        6990000,
        ' Máy lọc nước RO nóng nguội lạnh Sanaky VH102HP3 với 11 lõi lọc, màng lọc RO Filmtec 75 GPD sản xuất tại Hàn Quốc cho nguồn nước đạt chuẩn của Bộ Y tế, công nghệ máy nén Inverter làm lạnh giúp tiết kiệm điện, có 3 chế độ nước nóng - nguội - lạnh, công suất lọc 10 - 15 lít/giờ,... cho gia đình luôn đủ nước sạch để dùng.',
        2004, '2023-12-16', '2023-12-16'),
       (18, 1, 1, 3, 'Máy lọc nước RO nóng nguội lạnh Hòa Phát HWBv3Ai', 19670000, 'img/p18.jpg', 6990000,
        ' Máy lọc nước RO nóng nguội lạnh Hòa Phát HWBv3Ai với 11 lõi lọc, màng lọc RO Filmtec 75 GPD sản xuất tại Hàn Quốc cho nguồn nước đạt chuẩn của Bộ Y tế, công nghệ máy nén Inverter làm lạnh giúp tiết kiệm điện, có 3 chế độ nước nóng - nguội - lạnh, công suất lọc 10 - 15 lít/giờ,... cho gia đình luôn đủ nước sạch để dùng.',
        2004, '2023-12-16', '2023-12-16'),
       (19, 2, 1, 2, 'Máy lọc nước RO Karofi KAQ-X16 10 lõi', 20670000, 'img/p19.jpg', 6990000,
        ' Máy lọc nước RO nóng nguội lạnh RO Karofi KAQ-X16 với 11 lõi lọc, màng lọc RO Filmtec 75 GPD sản xuất tại Hàn Quốc cho nguồn nước đạt chuẩn của Bộ Y tế, công nghệ máy nén Inverter làm lạnh giúp tiết kiệm điện, có 3 chế độ nước nóng - nguội - lạnh, công suất lọc 10 - 15 lít/giờ,... cho gia đình luôn đủ nước sạch để dùng.',
        2004, '2023-12-16', '2023-12-16'),
       (20, 3, 2, 2, 'Máy lọc nước RO Karofi KAQ-X17 10 lõi', 27670000, 'img/p20.jpg', 7990000,
        ' Máy lọc nước RO nóng nguội lạnh Karofi KAQ-X17 với 11 lõi lọc, màng lọc RO Filmtec 75 GPD sản xuất tại Hàn Quốc cho nguồn nước đạt chuẩn của Bộ Y tế, công nghệ máy nén Inverter làm lạnh giúp tiết kiệm điện, có 3 chế độ nước nóng - nguội - lạnh, công suất lọc 10 - 15 lít/giờ,... cho gia đình luôn đủ nước sạch để dùng.',
        2004, '2023-12-16', '2023-12-16'),
       (21, 3, 2, 2, 'Máy lọc nước RO Karofi KAQ-X17x 10 lõi', 28670000, 'img/p21.jpg', 7990000,
        '  Máy lọc nóng lạnh Karofi KAQ-X17 10 lõi thiết kế dạng tủ đứng sang trọng, trang bị 3 chế độ nước nóng - nguội - lạnh, bình chứa nước lớn đảm bảo luôn có nước sạch cho gia đình sử dụng, cùng nhiều tiện ích khác như tự ngừng hoạt động khi nước đầy bình hoặc áp lực nước thấp,...',
        2004, '2023-12-16', '2023-12-16');

INSERT INTO `role` (`id`, `name`)
VALUES (1, 'Admin'),
       (2, 'User');
INSERT INTO `type_machines` (`id`, `type_name`)
VALUES (1, 'Có nóng lạnh'),
       (2, 'Lọc Hydrogen'),
       (3, 'Lọc nước nhiễm mặn lợ'),
       (4, 'Bán công nghiệp');
INSERT INTO `users` (`id`, `role_id`, `username`, `fullname`, `email`, `phone_number`, `sex`, `address`, `password`,
                     `created_at`, `updated_at`, `status`, `active`)
VALUES (1, 2, '1', 'Doan Quoc Huy', 'anhlapro090@gmail.com', '0586485990', 'Anh', '126 Phuoc Long', '123',
        '2024-01-19 20:59:17', NULL, 1, 1),
       (3, 2, 'huydoan0212', 'Huy Đoàn Quốc', '21130374@st.hcmuaf.edu.vn', '0586485990', '', '81/11 QL1K', 'qweasd1',
        '2024-01-20 15:36:24', NULL, 1, 1);
INSERT INTO `vouchers` (`id`, `voucher_name`, `voucher_code`, `start_date`, `end_date`, `note`, `percent_decrease`)
VALUES (1, 'Không giảm giá', '0', '2024-01-22 00:36:31', '2024-03-19 00:36:35', NULL, 0),
       (2, 'Giảm giá 20%', '123456', '2024-01-21 10:24:02', '2024-01-30 10:24:06', NULL, 0.2),
       (3, 'Giảm giá 50%', '1222', '2024-01-21 10:56:17', '2024-01-28 10:56:19', NULL, 0.5);
INSERT INTO `posts`(`id`, `title`, `content`, `author`)
VALUES (1,
        'Máy lọc nước Pureit của nước nào ?',
        'Pureit là thương hiệu thuộc tập đoàn Unilever, hoạt động tại Việt Nam từ năm 1995, đã đồng hành và phát triển cùng người dân Việt Nam hơn 20 năm qua. Unilever là thương hiệu đi đầu trong lĩnh vực cung cấp các mặt hàng tiêu dùng, với các nhãn hiệu quen thuộc như OMO, Sunlight, Vim, Surf, Knorr, Walls, Lifebuoy, Clear, Sunsilk, Ponds, P/S, Close up và nhiều nhãn hiệu khác. Pureit là giải pháp của Unilever cho nhu cầu lọc nước nói chung và tại Việt Nam nói riêng. Trên toàn cầu, kể từ khi ra mắt, Pureit đã trở thành nhãn hiệu lọc nước bán chạy nhất thế giới với sự có mặt tại 13 quốc gia cùng các sản phẩm dựa trên công nghệ lọc nước mới nhất (UV, RO, bioxit).',
        'Trần Quỳnh Anh');
CREATE TABLE IF NOT EXISTS `import_products` (
                                                 `id` int(11) NOT NULL AUTO_INCREMENT,
                                                 `product_id` int(11) DEFAULT NULL,
                                                 `quantity` int(11) DEFAULT NULL,
                                                 `created_at` datetime DEFAULT NULL,
                                                 `user_id` int(11) DEFAULT NULL,
                                                 `price` int(11) DEFAULT NULL,
                                                 PRIMARY KEY (`id`),
                                                 KEY `product_id` (`product_id`),
                                                 KEY `user_id` (`user_id`),
                                                 CONSTRAINT `import_products_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
                                                 CONSTRAINT `import_products_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
