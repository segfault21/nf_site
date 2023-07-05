CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- CreateEnum
CREATE TYPE "acceptance_item_status_enum" AS ENUM ('added', 'collected', 'remake', 'shop', 'custom');

-- CreateEnum
CREATE TYPE "import_error_type_enum" AS ENUM ('BASE_NOT_SPECIFIED', 'BASE_NOT_FOUND', 'UNKNOWN_PRODUCT');

-- CreateEnum
CREATE TYPE "pack_request_target_enum" AS ENUM ('acceptance', 'base', 'ready');

-- CreateEnum
CREATE TYPE "role_permission_level_enum" AS ENUM ('read', 'write');

-- CreateEnum
CREATE TYPE "stage_type_enum" AS ENUM ('collect', 'print', 'pack', 'delivery', 'film');

-- CreateEnum
CREATE TYPE "task_run_status_enum" AS ENUM ('created', 'running', 'done', 'error');

-- CreateEnum
CREATE TYPE "batch_status_enum" AS ENUM ('CREATED', 'DONE', 'TAKEN', 'ACCEPTED', 'ACCEPTED PARTIALLY');

-- CreateEnum
CREATE TYPE "build_request_status_enum" AS ENUM ('CREATED', 'IN PROGRESS', 'DONE', 'TAKEN', 'COLLECTED', 'REMAKE', 'SHOP', 'CUSTOM');

-- CreateEnum
CREATE TYPE "task_status_enum" AS ENUM ('CREATED', 'RUNNING', 'SUCCESS', 'ERROR');

-- CreateTable
CREATE TABLE "acceptance" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "version" INTEGER NOT NULL,
    "comment" VARCHAR,
    "userId" UUID,
    "batchId" UUID,

    CONSTRAINT "PK_960708ee59333f03310462d674d" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "acceptance_item" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "version" INTEGER NOT NULL,
    "status" "acceptance_item_status_enum" NOT NULL DEFAULT E'added',
    "collectedAt" TIMESTAMPTZ(6),
    "acceptanceId" UUID,
    "buildRequestId" UUID,
    "collectedById" UUID,

    CONSTRAINT "PK_58c0c8e23b528b84f2ad7be2817" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "acceptance_log" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "version" INTEGER NOT NULL,
    "fromStatus" VARCHAR,
    "toStatus" VARCHAR,
    "comment" VARCHAR,
    "type" VARCHAR NOT NULL,
    "acceptanceId" UUID,
    "userId" UUID,
    "itemId" UUID,

    CONSTRAINT "PK_e89a8e5989b9f3ad39dd3f1229b" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "batch" (
    "number" SERIAL NOT NULL,
    "comment" VARCHAR,
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "version" INTEGER NOT NULL,
    "userId" UUID,
    "status" "batch_status_enum" NOT NULL DEFAULT E'CREATED',

    CONSTRAINT "PK_57da3b830b57bec1fd329dcaf43" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "batch_log" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "version" INTEGER NOT NULL,
    "existingRequestIds" TEXT[],
    "separatedRequestIds" TEXT[],
    "type" VARCHAR NOT NULL,
    "batchId" UUID,
    "userId" UUID,
    "removedRequestIds" TEXT[],
    "removedRequestProductNames" TEXT[],

    CONSTRAINT "PK_8e27b2db9c743251522300857fd" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "build_request" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "version" INTEGER NOT NULL,
    "moyskladId" VARCHAR NOT NULL,
    "productName" VARCHAR NOT NULL,
    "itemId" UUID,
    "batchId" UUID,
    "collectedAt" TIMESTAMPTZ(6),
    "status" "build_request_status_enum" NOT NULL DEFAULT E'CREATED',
    "acceptanceId" UUID,
    "collectedById" UUID,
    "moyskladTechOperationId" VARCHAR,
    "isBase" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "PK_1503f23a6673b3f56a5218a9228" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "colelction_item_log" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "version" INTEGER NOT NULL,
    "dtf" BOOLEAN,
    "cut" BOOLEAN,
    "itemId" UUID,
    "userId" UUID,

    CONSTRAINT "PK_422aeda39c0ca7fba87d6a8ba1f" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "container" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "name" VARCHAR NOT NULL,
    "index" INTEGER,
    "comment" VARCHAR NOT NULL DEFAULT E'',
    "lastMovedAt" TIMESTAMPTZ(6),
    "stageId" UUID,
    "deletedAt" TIMESTAMP(6),

    CONSTRAINT "PK_74656f796df3346fa6ec89fa727" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "container_log" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "date" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "containerId" UUID,
    "fromStageId" UUID,
    "toStageId" UUID,
    "userId" UUID,

    CONSTRAINT "PK_0c495b9e7f79d2725134e226cf3" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "container_tag" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "version" INTEGER NOT NULL,
    "name" VARCHAR NOT NULL,
    "color" VARCHAR NOT NULL,
    "number" SERIAL NOT NULL,

    CONSTRAINT "PK_f22cf8e4e76b79b6662ce63501d" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "import_error" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "version" INTEGER NOT NULL,
    "orderId" INTEGER NOT NULL,
    "itemId" INTEGER NOT NULL,
    "moyskladType" VARCHAR NOT NULL,
    "moyskladId" VARCHAR NOT NULL,
    "type" "import_error_type_enum" NOT NULL,
    "resolved" BOOLEAN NOT NULL DEFAULT false,
    "moyskladLink" VARCHAR NOT NULL,
    "productName" VARCHAR NOT NULL,
    "positionId" VARCHAR NOT NULL,

    CONSTRAINT "PK_428e984c525aaecf89a353e83d2" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "item_actions_log" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "orderId" INTEGER NOT NULL,
    "itemId" INTEGER NOT NULL,
    "itemIndex" INTEGER NOT NULL,
    "statusFrom" VARCHAR,
    "statusTo" VARCHAR,
    "defectComment" VARCHAR,
    "weight" INTEGER,
    "pressCount" INTEGER,
    "date" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" UUID NOT NULL,
    "containerId" UUID,

    CONSTRAINT "PK_64929e12e54074dd247274bb8fb" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "migrations" (
    "id" SERIAL NOT NULL,
    "timestamp" BIGINT NOT NULL,
    "name" VARCHAR NOT NULL,

    CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "moysklad_product_cache" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "version" INTEGER NOT NULL,
    "moyskladId" VARCHAR NOT NULL,
    "_actual" BOOLEAN NOT NULL DEFAULT true,
    "name" VARCHAR NOT NULL,
    "code" VARCHAR NOT NULL,
    "externalCode" VARCHAR NOT NULL,
    "pathName" VARCHAR NOT NULL,
    "attributes" JSONB NOT NULL,

    CONSTRAINT "PK_15fc61fb2120ba37440a9049dc4" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "moysklad_techcard" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "version" INTEGER NOT NULL,
    "moyskladId" VARCHAR NOT NULL,
    "products" JSONB NOT NULL,
    "materials" JSONB NOT NULL,
    "isBase" BOOLEAN NOT NULL,
    "actual" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "PK_45a50da6c88fead94bdbd8db038" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "moysklad_techcard_cache" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "version" INTEGER NOT NULL,
    "moyskladId" VARCHAR NOT NULL,
    "_actual" BOOLEAN NOT NULL DEFAULT true,
    "products" JSONB NOT NULL,
    "materials" JSONB NOT NULL,
    "isBase" BOOLEAN NOT NULL,

    CONSTRAINT "PK_086bdf04a4a22cbe2bec6dc2ee5" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "moysklad_variant_cache" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "version" INTEGER NOT NULL,
    "moyskladId" VARCHAR NOT NULL,
    "_actual" BOOLEAN NOT NULL DEFAULT true,
    "code" VARCHAR NOT NULL,
    "externalCode" VARCHAR NOT NULL,
    "name" VARCHAR NOT NULL,
    "productId" VARCHAR NOT NULL,
    "charateristics" JSONB NOT NULL,

    CONSTRAINT "PK_496b1051049e848196fb0b7bc0e" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pack_request" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "version" INTEGER NOT NULL,
    "target" "pack_request_target_enum" NOT NULL,
    "done" BOOLEAN NOT NULL DEFAULT false,
    "storedItemId" UUID NOT NULL,
    "buildRequestId" UUID,

    CONSTRAINT "PK_7585f4e8c0cb8936e7dbb99ef6e" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "print_request" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "version" INTEGER NOT NULL,
    "moyskladId" VARCHAR NOT NULL,
    "finished" BOOLEAN NOT NULL DEFAULT false,
    "itemId" UUID,

    CONSTRAINT "PK_a7d79bfd97965c9d61b58e87ac0" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "production_method" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "version" INTEGER NOT NULL,
    "productCode" VARCHAR NOT NULL,
    "dtf" BOOLEAN NOT NULL DEFAULT false,
    "cut" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "PK_018b710aed3f8fd41338d44bfa9" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "role" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "name" VARCHAR NOT NULL,

    CONSTRAINT "PK_b36bcfe02fc8de3c57a8b2391c2" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "role_permission" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "level" "role_permission_level_enum" NOT NULL,
    "permission" VARCHAR NOT NULL,
    "roleId" UUID,

    CONSTRAINT "PK_96c8f1fd25538d3692024115b47" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "stage" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "name" VARCHAR NOT NULL,
    "color" VARCHAR NOT NULL,
    "requiredStatuses" TEXT[],
    "expiresIn" INTEGER NOT NULL,
    "default" BOOLEAN NOT NULL,
    "index" INTEGER NOT NULL,
    "type" "stage_type_enum" NOT NULL DEFAULT E'collect',

    CONSTRAINT "PK_c54d11b3c24a188262844af1612" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "stored_item" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "orderId" INTEGER NOT NULL,
    "orderNumber" VARCHAR NOT NULL,
    "isActual" BOOLEAN NOT NULL DEFAULT true,
    "orderDate" DATE NOT NULL,
    "orderStatus" VARCHAR NOT NULL,
    "orderType" VARCHAR NOT NULL,
    "orderStatusComment" VARCHAR,
    "site" VARCHAR NOT NULL,
    "itemId" INTEGER NOT NULL,
    "itemIndex" INTEGER NOT NULL,
    "itemName" VARCHAR NOT NULL,
    "itemSku" VARCHAR,
    "itemSize" VARCHAR,
    "itemStatus" VARCHAR NOT NULL,
    "itemComment" VARCHAR,
    "itemCount" INTEGER NOT NULL,
    "customerComment" VARCHAR,
    "deliveryCode" VARCHAR,
    "containerName" VARCHAR,
    "itemUpdatedAt" TIMESTAMPTZ(6),
    "brand" VARCHAR NOT NULL,
    "offerExternalId" VARCHAR,
    "collection" VARCHAR NOT NULL,
    "category" VARCHAR NOT NULL,
    "orderConfirmedAt" VARCHAR,
    "orderIni" VARCHAR,
    "itemIni" VARCHAR,
    "isUrgent" BOOLEAN NOT NULL,
    "storedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "moyskladPositionId" VARCHAR,
    "dtf" BOOLEAN NOT NULL DEFAULT false,
    "cut" BOOLEAN NOT NULL DEFAULT false,
    "containerId" UUID,
    "productionMethodId" UUID,
    "moyskladType" VARCHAR,
    "moyskladId" VARCHAR,
    "paymentMethod" VARCHAR,

    CONSTRAINT "PK_73dacdec8cc40b4df873017f4ba" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "stored_item_log" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "version" INTEGER NOT NULL,
    "itemId" UUID NOT NULL,
    "dtf" BOOLEAN,
    "cut" BOOLEAN,
    "userId" UUID,

    CONSTRAINT "PK_cea0cfa434c0da67edc3442a428" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "task" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "version" INTEGER NOT NULL,
    "name" VARCHAR NOT NULL,
    "data" JSONB NOT NULL,
    "retries" INTEGER NOT NULL DEFAULT 0,
    "status" "task_status_enum" NOT NULL DEFAULT E'CREATED',
    "eventId" VARCHAR,
    "parentId" UUID,
    "parentRunId" UUID,

    CONSTRAINT "PK_fb213f79ee45060ba925ecd576e" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "task_run" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "version" INTEGER NOT NULL,
    "status" "task_run_status_enum" NOT NULL,
    "finishedAt" TIMESTAMPTZ(6),
    "taskId" UUID,

    CONSTRAINT "PK_36326cc52f4708f36ae4e6158cc" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "techcard" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "version" INTEGER NOT NULL,
    "moyskladId" VARCHAR NOT NULL,
    "products" JSONB NOT NULL,
    "materials" JSONB NOT NULL,
    "isBase" BOOLEAN NOT NULL,
    "actual" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "PK_1a366c290deab0de5d1897ac2e9" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "user" (
    "id" UUID NOT NULL DEFAULT uuid_generate_v4(),
    "name" VARCHAR NOT NULL,
    "email" VARCHAR NOT NULL,
    "lastName" VARCHAR NOT NULL,
    "passwordHash" VARCHAR NOT NULL,
    "authId" VARCHAR NOT NULL,
    "createdAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "roleId" UUID,

    CONSTRAINT "PK_cace4a159ff9f2512dd42373760" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "container_tags_container_tag" (
    "containerId" UUID NOT NULL,
    "containerTagId" UUID NOT NULL,

    CONSTRAINT "PK_60da5281e4c3ef10d66227ffc61" PRIMARY KEY ("containerId","containerTagId")
);

-- CreateTable
CREATE TABLE "stage_type" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR NOT NULL,
    "default" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "PK_6b9b1c1938f4ff5d6dd36dd0908" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "REL_0eb81449edb4100b03391c8665" ON "acceptance"("batchId");

-- CreateIndex
CREATE INDEX "IDX_b457064432485b6d9c333c601b" ON "acceptance_log"("type");

-- CreateIndex
CREATE INDEX "IDX_116a6e59448f78069eb82652ce" ON "batch_log"("type");

-- CreateIndex
CREATE UNIQUE INDEX "UQ_4d05f49d346906977611f50d1c8" ON "moysklad_product_cache"("moyskladId");

-- CreateIndex
CREATE UNIQUE INDEX "UQ_c1d2b529c17b89a1c4a3914c5aa" ON "moysklad_techcard"("moyskladId");

-- CreateIndex
CREATE UNIQUE INDEX "UQ_810ffd59eca47c14eb15ea5459e" ON "moysklad_techcard_cache"("moyskladId");

-- CreateIndex
CREATE UNIQUE INDEX "UQ_59cbad4d17bf90c9cc43fc7fe09" ON "moysklad_variant_cache"("moyskladId");

-- CreateIndex
CREATE UNIQUE INDEX "UQ_4cd63f32a5dbdd7b44358a28028" ON "techcard"("moyskladId");

-- CreateIndex
CREATE INDEX "IDX_28ecf01cd031a10088c2389c87" ON "container_tags_container_tag"("containerTagId");

-- CreateIndex
CREATE INDEX "IDX_30168a281a366643304c7e72ce" ON "container_tags_container_tag"("containerId");

-- AddForeignKey
ALTER TABLE "acceptance" ADD CONSTRAINT "FK_0eb81449edb4100b03391c86655" FOREIGN KEY ("batchId") REFERENCES "batch"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "acceptance" ADD CONSTRAINT "FK_ed17e6150ee2d2653470b5ebf1c" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "acceptance_item" ADD CONSTRAINT "FK_bc03eb359c075b6140537c30e45" FOREIGN KEY ("acceptanceId") REFERENCES "acceptance"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "acceptance_item" ADD CONSTRAINT "FK_399d92960bcd76585c0be06606f" FOREIGN KEY ("buildRequestId") REFERENCES "build_request"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "acceptance_item" ADD CONSTRAINT "FK_285c3240ef8632c22e08b78e267" FOREIGN KEY ("collectedById") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "acceptance_log" ADD CONSTRAINT "FK_565935c169d56492f22cd6820a8" FOREIGN KEY ("acceptanceId") REFERENCES "acceptance"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "acceptance_log" ADD CONSTRAINT "FK_46b7b8ccfa5825696ed8387d430" FOREIGN KEY ("itemId") REFERENCES "acceptance_item"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "acceptance_log" ADD CONSTRAINT "FK_92dee24cac95ec5e5d6e030c562" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "batch" ADD CONSTRAINT "FK_cd203de35ad146448672593faae" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "batch_log" ADD CONSTRAINT "FK_b6f142fb9641d4c129657cdaa69" FOREIGN KEY ("batchId") REFERENCES "batch"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "batch_log" ADD CONSTRAINT "FK_3f56f39ed70b86bfde742dfe9fb" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "build_request" ADD CONSTRAINT "FK_cb72961913651f3fac07e3121c2" FOREIGN KEY ("acceptanceId") REFERENCES "acceptance"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "build_request" ADD CONSTRAINT "FK_521ed8d22af8f7b55bb69c00a60" FOREIGN KEY ("batchId") REFERENCES "batch"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "build_request" ADD CONSTRAINT "FK_faf6ce6a58e3b36d896984082aa" FOREIGN KEY ("collectedById") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "build_request" ADD CONSTRAINT "FK_2264e98ecb2cc217ffe2c318dc2" FOREIGN KEY ("itemId") REFERENCES "stored_item"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "colelction_item_log" ADD CONSTRAINT "FK_f16be30e9276949810032aee447" FOREIGN KEY ("itemId") REFERENCES "stored_item"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "colelction_item_log" ADD CONSTRAINT "FK_e0a4b0d6d3e19cc6fec56571bde" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "container" ADD CONSTRAINT "FK_5603a84ae17613a12c91ef17eef" FOREIGN KEY ("stageId") REFERENCES "stage"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "container_log" ADD CONSTRAINT "FK_8f0d705f4dbc6f0cfdafd1a0d28" FOREIGN KEY ("containerId") REFERENCES "container"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "container_log" ADD CONSTRAINT "FK_61d0a2b5ac8287b5368757b9334" FOREIGN KEY ("fromStageId") REFERENCES "stage"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "container_log" ADD CONSTRAINT "FK_4692262ca4794e9d526bf19b069" FOREIGN KEY ("toStageId") REFERENCES "stage"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "container_log" ADD CONSTRAINT "FK_bcef0ed01684c60c365559f931e" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "item_actions_log" ADD CONSTRAINT "FK_fea58fde6d712ab39ea433bd04a" FOREIGN KEY ("containerId") REFERENCES "container"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "item_actions_log" ADD CONSTRAINT "FK_035ccacb36d9311de5c3dc7f499" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pack_request" ADD CONSTRAINT "FK_d8b5ae5c32bc0d2a635103fe253" FOREIGN KEY ("buildRequestId") REFERENCES "build_request"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "pack_request" ADD CONSTRAINT "FK_ab7a304889a6eb705c9e34c1d01" FOREIGN KEY ("storedItemId") REFERENCES "stored_item"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "print_request" ADD CONSTRAINT "FK_aa5529be9e5f624a0030da28c0f" FOREIGN KEY ("itemId") REFERENCES "stored_item"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "role_permission" ADD CONSTRAINT "FK_e3130a39c1e4a740d044e685730" FOREIGN KEY ("roleId") REFERENCES "role"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "stored_item" ADD CONSTRAINT "FK_8b69d613226b52d811bfe15906f" FOREIGN KEY ("containerId") REFERENCES "container"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "stored_item" ADD CONSTRAINT "FK_f4035515bbd56cbe586746914bf" FOREIGN KEY ("productionMethodId") REFERENCES "production_method"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "stored_item_log" ADD CONSTRAINT "FK_bd5d8981aed851984b1c381bd2e" FOREIGN KEY ("itemId") REFERENCES "stored_item"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "stored_item_log" ADD CONSTRAINT "FK_75e66e5b62b5edcbe31cf65651b" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "task" ADD CONSTRAINT "FK_8c9920b5fb32c3d8453f64b705c" FOREIGN KEY ("parentId") REFERENCES "task"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "task" ADD CONSTRAINT "FK_48c75f78c70ab6dfc646c93fa74" FOREIGN KEY ("parentRunId") REFERENCES "task_run"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "task_run" ADD CONSTRAINT "FK_dad807e0562e20f2ccf739d7cde" FOREIGN KEY ("taskId") REFERENCES "task"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "user" ADD CONSTRAINT "FK_c28e52f758e7bbc53828db92194" FOREIGN KEY ("roleId") REFERENCES "role"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "container_tags_container_tag" ADD CONSTRAINT "FK_30168a281a366643304c7e72ce8" FOREIGN KEY ("containerId") REFERENCES "container"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "container_tags_container_tag" ADD CONSTRAINT "FK_28ecf01cd031a10088c2389c874" FOREIGN KEY ("containerTagId") REFERENCES "container_tag"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
