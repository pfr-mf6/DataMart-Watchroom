SELECT TOP (1000) [Dim_ApparatusResources_PK]
      ,[Apparatus_ID_Internal]
      ,[Incident_ID_Internal]
      ,[Apparatus_Personnel_ID_List]
      ,[Apparatus_Personnel_Name_List]

      ,[Apparatus_Resource_Actions_Taken_1]
      ,[Apparatus_Resource_Actions_Taken_2]
      ,[Apparatus_Resource_Actions_Taken_3]
      ,[Apparatus_Resource_Actions_Taken_4]

      ,[Apparatus_Resource_Actions_Taken_Code_1]
      ,[Apparatus_Resource_Actions_Taken_Code_2]
      ,[Apparatus_Resource_Actions_Taken_Code_3]
      ,[Apparatus_Resource_Actions_Taken_Code_4]

      ,[Apparatus_Resource_Actions_Taken_Code_And_Description_1]
      ,[Apparatus_Resource_Actions_Taken_Code_And_Description_2]
      ,[Apparatus_Resource_Actions_Taken_Code_And_Description_3]
      ,[Apparatus_Resource_Actions_Taken_Code_And_Description_4]
      ,[Apparatus_Resource_Actions_Taken_Code_And_Description_List]
      ,[Apparatus_Resource_Actions_Taken_Code_List]
      ,[Apparatus_Resource_Actions_Taken_List]






    -- #####################################
    -- TIMES
    -- #####################################
      ,[Apparatus_Resource_Dispatch_Date_Time]
      ,[Appratus_Resource_Enroute_Date_Time]
      ,[Apparatus_Resource_Arrival_Date_Time]
      ,[Apparatus_Resource_Clear_Date_Time]
      ,[Apparatus_Resource_In_Service_Date_Time]
      ,[Apparatus_Resource_Staging_Date_Time]
      ,[Apparatus_Resource_Leave_Scene_Date_Time]
      ,[Apparatus_Resource_Arrival_At_Hospital_Time]
      ,[Apparatus_Resource_In_Quarters_Date_Time]





      ,[Apparatus_Resource_ID]
      ,[Apparatus_Resource_Number_Of_People]
      ,[Apparatus_Resource_Response_Mode_To_Scene]
      ,[Apparatus_Resource_Sent_Flag]
      ,[Apparatus_Resource_Type]
      ,[Apparatus_Resource_Type_Category]
      ,[Apparatus_Resource_Type_Code]
      ,[Apparatus_Resource_Type_Code_And_Description]
      ,[Apparatus_Resource_Use]
      ,[Apparatus_Resource_Use_Code]
      ,[Apparatus_Resource_Use_Code_And_Description]

      
      ,[Apparatus_Resource_Vehicle_Call_Sign]
      ,[Apparatus_Resource_Vehicle_Category_Type]
      ,[Apparatus_Resource_Vehicle_Mutual_Response_Type]
      ,[Apparatus_Resource_Last_Arrived_At_Scene_Date_Time]
      ,[Apparatus_Resource_Primary_Action_Taken]
      ,[Apparatus_Resource_Primary_Action_Taken_Code]
      ,[Apparatus_Resource_Primary_Action_Taken_Code_And_Description]
      ,[Apparatus_Resource_Arrival_Sequence_Number_By_Overall_Incident]
      ,[Apparatus_Resource_Arrival_Sequence_Number_By_Apparatus_Type]
      ,[Apparatus_Resource_Narrative]
      ,[Apparatus_Resource_Dispatch_Location]

  FROM [Elite_DWPortland].[DwFire].[Dim_ApparatusResources]