SELECT TOP (1000) [Dim_PersonnelLicenseGroup_PK]
      ,[Personnel_Performer_ID_Internal]
      ,[Personnel_Performer_State_Licensure_ID_Internal]
      ,[Personnel_State_Of_Licensure]
      ,[Personnel_States_Licensure_ID_Number]
      ,[Personnel_State_EMS_Certification_Licensure_Level]
      ,[Personnel_State_EMS_Current_Certification_Date]
      ,[Personnel_Initial_States_Licensure_Issue_Date]
      ,[Personnel_Current_States_Licensure_Expiration_Date]
      ,[CreatedOn]
      ,[System_ID]
      ,[ModifiedOn]
      ,[Personnel_States_Licensure_Active]
      ,[Dim_Personnel_FK]
      ,[Personnel_Licensure_Level_Duration_In_Months]
      ,[Personnel_Licensure_Level_Required_Training_Hours]
      ,[Personnel_Current_States_Licensure_Expiration_Date_Minus_Duration_Months]
      ,[Personnel_License_Nemsis_UUID]
  FROM [Elite_DWPortland].[DwEms].[Dim_PersonnelLicenseGroup]


-- SELECT TOP (1000) [Dim_PersonnelLicenseGroup_PK]
--       ,[Personnel_States_Licensure_ID_Number] as "License #"
--       ,[Personnel_States_Licensure_Active]
--   FROM [Elite_DWPortland].[DwEms].[Dim_PersonnelLicenseGroup]



-- WITH RankedLicenses AS (
--     SELECT 
--         [Dim_PersonnelLicenseGroup_PK],
--         [Personnel_States_Licensure_ID_Number] AS "License #",
--         [Personnel_States_Licensure_Active],
--         ROW_NUMBER() OVER (PARTITION BY [Personnel_States_Licensure_ID_Number] ORDER BY [Dim_PersonnelLicenseGroup_PK]) AS RowNum
--     FROM 
--         [Elite_DWPortland].[DwEms].[Dim_PersonnelLicenseGroup]
-- )
-- SELECT 
--     [Dim_PersonnelLicenseGroup_PK],
--     [License #],
--     [Personnel_States_Licensure_Active]
-- FROM 
--     RankedLicenses
-- WHERE 
--     RowNum = 1;