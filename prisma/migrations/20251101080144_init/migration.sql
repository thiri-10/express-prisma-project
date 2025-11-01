-- CreateTable
CREATE TABLE `Supplier` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `payable_amount` DECIMAL(20, 4) NOT NULL,
    `ph_no` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `address` VARCHAR(191) NOT NULL,
    `credit_limit` DECIMAL(20, 4) NOT NULL,
    `status` ENUM('ACTIVE', 'SUSPENDED') NOT NULL,
    `created_at` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updated_at` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Supplier_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Raw_Material` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `current_price` DECIMAL(10, 4) NOT NULL,
    `current_stock` DECIMAL(6, 2) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Material_Order` (
    `id` VARCHAR(191) NOT NULL,
    `supplier_id` VARCHAR(191) NOT NULL,
    `order_date` DATETIME(3) NOT NULL,
    `grand_total` DECIMAL(20, 4) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Material_Order_Items` (
    `id` VARCHAR(191) NOT NULL,
    `material_order_id` VARCHAR(191) NOT NULL,
    `raw_material_id` VARCHAR(191) NOT NULL,
    `quantity` DECIMAL(6, 2) NOT NULL,
    `unit_price` DECIMAL(10, 4) NOT NULL,
    `total_amount` DECIMAL(20, 4) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Material_Price_Record` (
    `id` VARCHAR(191) NOT NULL,
    `raw_material_id` VARCHAR(191) NOT NULL,
    `price` DECIMAL(10, 4) NOT NULL,
    `start_date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `end_date` DATETIME(3) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Material_Stock_Record` (
    `id` VARCHAR(191) NOT NULL,
    `raw_material_id` VARCHAR(191) NOT NULL,
    `stock` DECIMAL(6, 2) NOT NULL,
    `start_date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `end_date` DATETIME(3) NULL,
    `updated_by` ENUM('ADMIN', 'ORDER') NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Material_Transition_Record` (
    `id` VARCHAR(191) NOT NULL,
    `material_order_id` VARCHAR(191) NULL,
    `supplier_id` VARCHAR(191) NOT NULL,
    `amount` DECIMAL(20, 4) NOT NULL,
    `type` ENUM('SALE', 'PAYMENT') NOT NULL,
    `updated_at` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
