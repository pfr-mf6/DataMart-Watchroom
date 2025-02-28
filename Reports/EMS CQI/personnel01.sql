SELECT TOP (1000) [Dim_Personnel_PK] as pk
      ,[Personnel_Performer_ID_Internal] as person_id_int
      ,[Personnel_Owner_Agency_ID_Internal] as agency_id_int
      ,[Personnel_Last_Name] as last
      ,[Personnel_First_Name] as first
      ,[Personnel_Full_Name] as name

      ,[Personnel_Primary_Email_Address]

    -- COMMENTED OUT LINES ARE BLANK IN THE DATABASE
    --   ,[Personnel_Agency_ID_Number]

    --   ,[Personnel_National_Registry_Number]
    --   ,[Personnel_National_Registry_Certification_Level]
    --   ,[Personnel_Current_National_Registry_Expiration_Date]

    --   ,[Personnel_Employment_Status]
    --   ,[Personnel_Employment_Status_Date]
    --   ,[Personnel_Employment_Status_Date_With_Not_Values]
    
    --   ,[Personnel_Member_Hire_Date]
    --   ,[Personnel_Primary_EMS_Job_Role]
    --   ,[Personnel_Other_Job_Responsibilities_List]
    --   ,[Personnel_Total_Length_Of_Service_In_Years]
    --   ,[Personnel_Date_Used_For_Length_Of_Service]

      ,[Personnel_EMS_Certification_Level_List]
      ,[CreatedOn]
    --   ,[Personnel_State_Of_Licensure_List]
    --   ,[Personnel_Badge_Number]
    --   ,[Personnel_Practice_Level_Expiration_Date]
    --   ,[Personnel_Agency_Name]
    --   ,[Personnel_Position]
    --   ,[Personnel_Position_Start_Date]
    --   ,[Personnel_Position_End_Date]
    --   ,[Personnel_Active_Status]
    --   ,[Personnel_Rank]
    --   ,[Personnel_Rank_Start_Date]
    --   ,[Personnel_Rank_End_Date]
    --   ,[Personnel_Payroll_ID]
    --   ,[Personnel_Show_On_Staff_List]
    --   ,[Personnel_ID]
    --   ,[Personnel_Show_On_EMS_Run_Form_Status]
    --   ,[Personnel_Show_On_Fire_Run_Form_Status]
    --   ,[Personnel_Employment_End_Date]
    --   ,[ModifiedOn] - we just don't need this
    --   ,[Personnel_Current_National_Registry_Certification_Date]
      ,[Personnel_User_Name] as USERNAME_empID
      ,[Personnel_IsSuperAdmin_Flag] AS isSuperAdmin
      ,[Personnel_RequiresPasswordReset_Flag] as reqPassReset
      ,[Personnel_LockStatus] AS isLocked
      ,[Personnel_FailedLoginAttempts] as failed_logins
    --   ,[Personnel_PasswordActivityLockStatus]
    --   ,[Personnel_PasswordActivityUnlockTime]
    --   ,[Personnel_AutoAddToNewAgencies_Flag]
      ,[Personnel_DeletedStatus] AS isDeleted
    --   ,[Personnel_Record_Created_On_Date_Time]
    --   ,[Personnel_Record_Modified_On_Date_Time]
    --   ,[Personnel_Record_Modified_By_Name] -- we just don't care about thie one
      ,[Personnel_Permission_Group_Name_List] AS permissions_group
    --   ,[Personnel_Current_Agency_Licensure_Certification_Date]
      ,[Personnel_Last_Elite_Login_Date_Time]
    --   ,[Personnel_Last_Elite_Field_Login_Date_Time] -- WHY WOULD THIS BE BLANK FOR EVERYONE!>?!?!?!?!?!??!
    --   ,[Personnel_Drivers_License_Expiration_Date]
    --   ,[Personnel_Website_Address]
    --   ,[Personnel_Email_Address_List]
      ,[Dim_Agency_FK]
  FROM [Elite_DWPortland].[DwEms].[Dim_Personnel]

ORDER BY USERNAME_empID DESC
