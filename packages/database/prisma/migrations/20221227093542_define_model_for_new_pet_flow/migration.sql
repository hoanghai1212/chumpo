-- CreateEnum
CREATE TYPE "Gender" AS ENUM ('MALE', 'FEMALE');

-- CreateEnum
CREATE TYPE "PetKind" AS ENUM ('DOG', 'CAT');

-- CreateEnum
CREATE TYPE "PetSize" AS ENUM ('SMALL', 'MEDIUM', 'LARGE');

-- CreateEnum
CREATE TYPE "FoodType" AS ENUM ('WET', 'DRY', 'OTHER');

-- CreateTable
CREATE TABLE "Account" (
    "id" STRING NOT NULL,
    "userId" STRING NOT NULL,
    "type" STRING NOT NULL,
    "provider" STRING NOT NULL,
    "providerAccountId" STRING NOT NULL,
    "refresh_token" STRING,
    "access_token" STRING,
    "expires_at" TIMESTAMP(3),
    "token_type" STRING,
    "scope" STRING,
    "id_token" STRING,
    "session_state" STRING,

    CONSTRAINT "Account_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Session" (
    "id" STRING NOT NULL,
    "sessionToken" STRING NOT NULL,
    "userId" STRING NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Session_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" STRING NOT NULL,
    "name" STRING,
    "email" STRING,
    "emailVerified" TIMESTAMP(3),
    "image" STRING,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "VerificationToken" (
    "identifier" STRING NOT NULL,
    "token" STRING NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL
);

-- CreateTable
CREATE TABLE "Pet" (
    "id" STRING NOT NULL,
    "name" STRING NOT NULL,
    "kind" "PetKind" NOT NULL,
    "gender" "Gender" NOT NULL,
    "size" "PetSize" NOT NULL,
    "birthday" TIMESTAMP(3) NOT NULL,
    "gotchaDay" TIMESTAMP(3),
    "avatar" STRING,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "ownerId" STRING NOT NULL,
    "needGrainFree" BOOL,
    "needWeightControl" BOOL,

    CONSTRAINT "Pet_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Breed" (
    "id" STRING NOT NULL,
    "name" STRING NOT NULL,

    CONSTRAINT "Breed_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PetFood" (
    "id" STRING NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "petId" STRING NOT NULL,
    "foodProductId" STRING NOT NULL,
    "foodType" "FoodType" NOT NULL,
    "note" STRING,

    CONSTRAINT "PetFood_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MealTime" (
    "id" STRING NOT NULL,
    "label" STRING NOT NULL,
    "startTime" TIMESTAMP(3) NOT NULL,
    "endTime" TIMESTAMP(3) NOT NULL,
    "description" STRING,

    CONSTRAINT "MealTime_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MealServingSize" (
    "id" STRING NOT NULL,
    "label" STRING NOT NULL,
    "description" STRING,

    CONSTRAINT "MealServingSize_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MealDetail" (
    "id" STRING NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "petFoodId" STRING NOT NULL,
    "quantity" INT4 NOT NULL,

    CONSTRAINT "MealDetail_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FoodBrand" (
    "id" STRING NOT NULL,
    "name" STRING NOT NULL,

    CONSTRAINT "FoodBrand_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FoodProduct" (
    "id" STRING NOT NULL,
    "name" STRING NOT NULL,
    "foodBrandId" STRING,

    CONSTRAINT "FoodProduct_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PetTreat" (
    "id" STRING NOT NULL,
    "img" STRING NOT NULL,
    "name" STRING NOT NULL,
    "description" STRING,

    CONSTRAINT "PetTreat_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PetFlavor" (
    "id" STRING NOT NULL,
    "img" STRING NOT NULL,
    "name" STRING NOT NULL,
    "description" STRING,

    CONSTRAINT "PetFlavor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PetSensitivies" (
    "id" STRING NOT NULL,
    "img" STRING NOT NULL,
    "name" STRING NOT NULL,
    "description" STRING,

    CONSTRAINT "PetSensitivies_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PetWellnessConcern" (
    "id" STRING NOT NULL,
    "name" STRING NOT NULL,
    "description" STRING,

    CONSTRAINT "PetWellnessConcern_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Vaccine" (
    "id" STRING NOT NULL,
    "name" STRING NOT NULL,

    CONSTRAINT "Vaccine_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PetVaccineHistory" (
    "id" STRING NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "petId" STRING NOT NULL,
    "vaccineId" STRING,
    "name" STRING,
    "lastVaccinationDate" TIMESTAMP(3) NOT NULL,
    "nextVaccinationDate" TIMESTAMP(3) NOT NULL,
    "previousVaccinationDate" TIMESTAMP(3) NOT NULL,
    "note" STRING,
    "photo" STRING[],

    CONSTRAINT "PetVaccineHistory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_PetToPetTreat" (
    "A" STRING NOT NULL,
    "B" STRING NOT NULL
);

-- CreateTable
CREATE TABLE "_PetToPetFlavor" (
    "A" STRING NOT NULL,
    "B" STRING NOT NULL
);

-- CreateTable
CREATE TABLE "_PetToPetSensitivies" (
    "A" STRING NOT NULL,
    "B" STRING NOT NULL
);

-- CreateTable
CREATE TABLE "_PetToPetWellnessConcern" (
    "A" STRING NOT NULL,
    "B" STRING NOT NULL
);

-- CreateTable
CREATE TABLE "_BreedToPet" (
    "A" STRING NOT NULL,
    "B" STRING NOT NULL
);

-- CreateTable
CREATE TABLE "_MealDetailToMealTime" (
    "A" STRING NOT NULL,
    "B" STRING NOT NULL
);

-- CreateTable
CREATE TABLE "_MealDetailToMealServingSize" (
    "A" STRING NOT NULL,
    "B" STRING NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Account_provider_key" ON "Account"("provider");

-- CreateIndex
CREATE UNIQUE INDEX "Account_providerAccountId_key" ON "Account"("providerAccountId");

-- CreateIndex
CREATE UNIQUE INDEX "Session_sessionToken_key" ON "Session"("sessionToken");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "VerificationToken_identifier_key" ON "VerificationToken"("identifier");

-- CreateIndex
CREATE UNIQUE INDEX "VerificationToken_token_key" ON "VerificationToken"("token");

-- CreateIndex
CREATE UNIQUE INDEX "_PetToPetTreat_AB_unique" ON "_PetToPetTreat"("A", "B");

-- CreateIndex
CREATE INDEX "_PetToPetTreat_B_index" ON "_PetToPetTreat"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_PetToPetFlavor_AB_unique" ON "_PetToPetFlavor"("A", "B");

-- CreateIndex
CREATE INDEX "_PetToPetFlavor_B_index" ON "_PetToPetFlavor"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_PetToPetSensitivies_AB_unique" ON "_PetToPetSensitivies"("A", "B");

-- CreateIndex
CREATE INDEX "_PetToPetSensitivies_B_index" ON "_PetToPetSensitivies"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_PetToPetWellnessConcern_AB_unique" ON "_PetToPetWellnessConcern"("A", "B");

-- CreateIndex
CREATE INDEX "_PetToPetWellnessConcern_B_index" ON "_PetToPetWellnessConcern"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_BreedToPet_AB_unique" ON "_BreedToPet"("A", "B");

-- CreateIndex
CREATE INDEX "_BreedToPet_B_index" ON "_BreedToPet"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_MealDetailToMealTime_AB_unique" ON "_MealDetailToMealTime"("A", "B");

-- CreateIndex
CREATE INDEX "_MealDetailToMealTime_B_index" ON "_MealDetailToMealTime"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_MealDetailToMealServingSize_AB_unique" ON "_MealDetailToMealServingSize"("A", "B");

-- CreateIndex
CREATE INDEX "_MealDetailToMealServingSize_B_index" ON "_MealDetailToMealServingSize"("B");

-- AddForeignKey
ALTER TABLE "Account" ADD CONSTRAINT "Account_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Session" ADD CONSTRAINT "Session_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pet" ADD CONSTRAINT "Pet_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PetFood" ADD CONSTRAINT "PetFood_petId_fkey" FOREIGN KEY ("petId") REFERENCES "Pet"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PetFood" ADD CONSTRAINT "PetFood_foodProductId_fkey" FOREIGN KEY ("foodProductId") REFERENCES "FoodProduct"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MealDetail" ADD CONSTRAINT "MealDetail_petFoodId_fkey" FOREIGN KEY ("petFoodId") REFERENCES "PetFood"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FoodProduct" ADD CONSTRAINT "FoodProduct_foodBrandId_fkey" FOREIGN KEY ("foodBrandId") REFERENCES "FoodBrand"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PetVaccineHistory" ADD CONSTRAINT "PetVaccineHistory_petId_fkey" FOREIGN KEY ("petId") REFERENCES "Pet"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PetVaccineHistory" ADD CONSTRAINT "PetVaccineHistory_vaccineId_fkey" FOREIGN KEY ("vaccineId") REFERENCES "Vaccine"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PetToPetTreat" ADD CONSTRAINT "_PetToPetTreat_A_fkey" FOREIGN KEY ("A") REFERENCES "Pet"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PetToPetTreat" ADD CONSTRAINT "_PetToPetTreat_B_fkey" FOREIGN KEY ("B") REFERENCES "PetTreat"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PetToPetFlavor" ADD CONSTRAINT "_PetToPetFlavor_A_fkey" FOREIGN KEY ("A") REFERENCES "Pet"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PetToPetFlavor" ADD CONSTRAINT "_PetToPetFlavor_B_fkey" FOREIGN KEY ("B") REFERENCES "PetFlavor"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PetToPetSensitivies" ADD CONSTRAINT "_PetToPetSensitivies_A_fkey" FOREIGN KEY ("A") REFERENCES "Pet"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PetToPetSensitivies" ADD CONSTRAINT "_PetToPetSensitivies_B_fkey" FOREIGN KEY ("B") REFERENCES "PetSensitivies"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PetToPetWellnessConcern" ADD CONSTRAINT "_PetToPetWellnessConcern_A_fkey" FOREIGN KEY ("A") REFERENCES "Pet"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PetToPetWellnessConcern" ADD CONSTRAINT "_PetToPetWellnessConcern_B_fkey" FOREIGN KEY ("B") REFERENCES "PetWellnessConcern"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BreedToPet" ADD CONSTRAINT "_BreedToPet_A_fkey" FOREIGN KEY ("A") REFERENCES "Breed"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BreedToPet" ADD CONSTRAINT "_BreedToPet_B_fkey" FOREIGN KEY ("B") REFERENCES "Pet"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MealDetailToMealTime" ADD CONSTRAINT "_MealDetailToMealTime_A_fkey" FOREIGN KEY ("A") REFERENCES "MealDetail"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MealDetailToMealTime" ADD CONSTRAINT "_MealDetailToMealTime_B_fkey" FOREIGN KEY ("B") REFERENCES "MealTime"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MealDetailToMealServingSize" ADD CONSTRAINT "_MealDetailToMealServingSize_A_fkey" FOREIGN KEY ("A") REFERENCES "MealDetail"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_MealDetailToMealServingSize" ADD CONSTRAINT "_MealDetailToMealServingSize_B_fkey" FOREIGN KEY ("B") REFERENCES "MealServingSize"("id") ON DELETE CASCADE ON UPDATE CASCADE;
