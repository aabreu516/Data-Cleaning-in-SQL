select *
from PortfolioProject..nashvillehousing


select saledateconverted, Convert (Date, Saledate) AS SaleDateConverted
from PortfolioProject..nashvillehousing

UPDATE NashvilleHousing
SET Saledate = Convert (Date, Saledate) 

ALTER TABLE NashvilleHousing
ADD SaleDateConverted DATE


select *
from PortfolioProject..nashvillehousing
WHERE propertyaddress is NULL


select a.parcelid, a.propertyaddress,b.parcelid, b.propertyaddress, ISNULL(a.propertyaddress, b.propertyaddress)
from PortfolioProject..nashvillehousing a
Join PortfolioProject..nashvillehousing b
ON a.parcelid = b.parcelid
AND a.uniqueid <> b.uniqueid
WHERE a.propertyaddress is NULL

UPDATE a
SET propertyaddress = ISNULL(a.propertyaddress, b.propertyaddress)
from PortfolioProject..nashvillehousing a
Join PortfolioProject..nashvillehousing b
ON a.parcelid = b.parcelid
AND a.uniqueid <> b.uniqueid
WHERE a.propertyaddress is NULL


select propertyaddress
from PortfolioProject..nashvillehousing

SELECT 
SUBSTRING(propertyaddress, 1, 



SELECT 
   TRIM(SUBSTRING(propertyaddress, ',', 1)) AS address,
   TRIM(SUBSTRING(SUBSTRING(propertyaddress, ',', 2), ',', -1)) AS city,
   TRIM(SUBSTRING(propertyaddress, ',', -1)) AS state
FROM 
   NashvilleHousing



SELECT 
SUBSTRING(propertyaddress, 1, CHARINDEX(',', propertyaddress) - 1) AS address,
   SUBSTRING(propertyaddress, CHARINDEX(',', propertyaddress) + 1, LEN(propertyaddress)) as City
  
FROM PortfolioProject..NashvilleHousing


ALTER TABLE NashvilleHousing
ADD new_propertyaddress varchar(255)

UPDATE NashvilleHousing
SET new_propertyaddress = CONCAT(SUBSTRING(propertyaddress, 1, CHARINDEX(',', propertyaddress) - 1), ', Nashville, TN')

SELECT 
   SUBSTRING(propertyaddress, 1, CHARINDEX(',', propertyaddress) - 1) AS address,
   SUBSTRING(propertyaddress, CHARINDEX(',', propertyaddress) + 1, LEN(propertyaddress)) AS city
   
FROM 
   NashvilleHousing;

   UPDATE NashvilleHousing
SET new_propertycity = SUBSTRING(propertyaddress, CHARINDEX(',', propertyaddress) + 1, LEN(propertyaddress)) 

ALTER TABLE NashvilleHousing
ADD new_propertycity varchar(255)



SELECT 
   SUBSTRING(owneraddress, 1, CHARINDEX(',', owneraddress) - 1) AS address,
   SUBSTRING(owneraddress, CHARINDEX(',', owneraddress) + 1, LEN(owneraddress) - CHARINDEX(',', propertyaddress) - 4) AS city,
   SUBSTRING(owneraddress, CHARINDEX(',', owneraddress, CHARINDEX(',', owneraddress) + 1) + 1, LEN(owneraddress) - CHARINDEX(',', REVERSE(owneraddress))) AS state
FROM 
   NashvilleHousing

   ALTER TABLE NashvilleHousing
ADD new_ownerstate VARCHAR (255)

UPDATE NashvilleHousing
SET new_ownerstate = SUBSTRING(owneraddress, CHARINDEX(',', owneraddress, CHARINDEX(',', owneraddress) + 1) + 1, LEN(owneraddress) - CHARINDEX(',', REVERSE(owneraddress)))

SELECT new_owneraddress, new_ownercity, new_ownerstate
FROM NashvilleHousing

SELECT
PARSENAME(REPLACE(owneraddress, ',', '.'), 3),
PARSENAME(REPLACE(owneraddress, ',', '.'), 2),
PARSENAME(REPLACE(owneraddress, ',', '.'), 1)
FROM NashvilleHousing


SELECT DISTINCT (soldasvacant), COUNT(soldasvacant)
FROM NashvilleHousing
GROUP BY soldasvacant


SELECT soldasvacant,
CASE WHEN soldasvacant = 'Y' THEN 'Yes'
WHEN soldasvacant = 'N' THEN 'No'
ELSE soldasvacant
END
FROM NashvilleHousing

UPDATE NashvilleHousing
SET soldasvacant =
CASE WHEN soldasvacant = 'Y' THEN 'Yes'
WHEN soldasvacant = 'N' THEN 'No'
ELSE soldasvacant
END


DELETE FROM NashvilleHousing
WHERE propertyaddress IN (
  SELECT propertyaddress
  FROM NashvilleHousing
  GROUP BY column_name1, column_name2
  HAVING COUNT(*) > 1
)
select *
from PortfolioProject..nashvillehousing

ALTER TABLE NashvilleHousing
DROP COLUMN saledate