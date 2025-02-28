SELECT TOP (1000) [Dim_Personnel_PK]
      ,[Personnel_Owner_Agency_ID_Internal]
      ,[Personnel_Agency_ID_Number]

      ,[Personnel_Last_Name]
      ,[Personnel_First_Name]
      ,[Personnel_Full_Name]
      ,[Personnel_Primary_Email_Address]

      --,[Personnel_Active_Status] as "ACTIVE?"
      --,[Personnel_Rank] as "RANK"
      --,[Personnel_Rank_Start_Date]

      ,[Personnel_Permission_Group_Name_List] as "GROUP"
      ,[Personnel_User_Name] as "login username"

      ,[Personnel_IsSuperAdmin_Flag] as "superadmin?"
      ,[Personnel_RequiresPasswordReset_Flag] as "req psk reset?"
      ,[Personnel_LockStatus] as "Locked?"
      ,[Personnel_FailedLoginAttempts]
      ,[Personnel_PasswordActivityLockStatus]
      ,[Personnel_PasswordActivityUnlockTime]
      --,[Personnel_AutoAddToNewAgencies_Flag]
      ,[Personnel_DeletedStatus] as "Deleted?"
    --   ,[Personnel_Record_Created_On_Date_Time]
    --   ,[Personnel_Record_Modified_On_Date_Time]
    --   ,[Personnel_Record_Created_By_Name]
    --   ,[Personnel_Record_Modified_By_Name]
      ,[Personnel_Last_Elite_Login_Date_Time] as "last login - elite"
      ,[Personnel_Last_Elite_Field_Login_Date_Time] as "last login - field"
      ,[Personnel_Drivers_License_Expiration_Date]
      ,NULL AS "bookmark"
      ,[Dim_Agency_FK]
      --,[Personnel_Global_Identifier]
  FROM [Elite_DWPortland].[DwEms].[Dim_Personnel]

