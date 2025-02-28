SELECT TOP (1000) 
    [Dim_Basic_PK]

    ,[Basic_Agency_ID_Internal]

    -- This incident ID is used to link between tables.  This column is very important.
    ,[Incident_ID_Internal]
    ,[Basic_Exposure]

    
    -- This is the "time of the incident" for our purposes
    ,[Basic_Incident_Alarm_Time]

    ,[Basic_Shift_Or_Platoon]
    -- ,[Basic_Incident_PSAP_Date_Time]

    -- This is what we call the "RP Number"
    ,[Basic_Incident_Number]

    ,[Basic_Incident_Final_CAD_Dispatch_Code]
    -- ,[Basic_EFD_Card_Number]

    ,[Basic_Incident_Full_Address]
    ,[Basic_Incident_Latitude]
    ,[Basic_Incident_Longitude]

    -- list of all apparatus dispatched on this incident
    ,[Basic_Apparatus_Call_Sign_List]

    ,[Basic_Incident_Type]
    ,[Basic_Incident_Type_Code]
    ,[Basic_Incident_Type_Code_And_Description]

    ,[Basic_Incident_Primary_Narrative]
    ,[Basic_Authorization_Member_Making_Report_Name]


    ,[Basic_Incident_First_Unit_Arrived_Date_Time]
    ,[Basic_Incident_First_Unit_Arrived_Apparatus_Resource_ID]







    -- may use these later...


    -- Incident address
    -- ,[Basic_Incident_State]
    -- ,[Basic_Incident_Status]
    -- ,[Basic_Incident_Street_Name]
    -- ,[Basic_Incident_Street_Number]
    -- ,[Basic_Incident_Street_Prefix]
    -- ,[Basic_Incident_Street_Suffix]
    -- ,[Basic_Incident_Street_Type]

    -- battalion????
    -- ,[Basic_Incident_District]

    -- ,[Basic_Incident_Type_Category]
    -- ,[Basic_Incident_Type_Subcategory]
    -- ,[Basic_Incident_Type_Second]
    -- ,[Basic_Incident_Type_Second_Code]
    -- ,[Basic_Incident_Type_Second_Code_And_Description]
    -- ,[Basic_Incident_Type_Category_Second]
    -- ,[Basic_Incident_Type_Subcategory_Second]
    -- ,[Basic_Incident_Type_Third]
    -- ,[Basic_Incident_Type_Third_Code]
    -- ,[Basic_Incident_Type_Third_Code_And_Description]
    -- ,[Basic_Incident_Type_Category_Third]
    -- ,[Basic_Incident_Type_Subcategory_Third]
    -- ,[Basic_Incident_Updated_Date_Time]
    -- ,[Basic_Incident_User_Entered]
    -- ,[Basic_Incident_User_Updated]
    -- ,[Basic_Incident_Wildland_Location]
    -- ,[Basic_Incident_Zone_Number]
    -- ,[Basic_Primary_Action_Taken]
    -- ,[Basic_Primary_Action_Taken_Category]
    -- ,[Basic_Primary_Action_Taken_Code]
    -- ,[Basic_Primary_Action_Taken_Code_And_Description]
    -- ,[Basic_Incident_Date_Original]
    -- ,[Basic_Incident_Date_Time]
    -- ,[Basic_Primary_Station_Name]

    -- ############################################################################################################################################


    -- blank
    -- ,[Basic_Authorization_Officer_In_Charge_Name]

    -- ,[Basic_Final_NFIRS_Code]
    -- ,[Basic_Final_NFIRS_Description]

    -- ,[Basic_Additional_Actions_Taken_2]
    -- ,[Basic_Additional_Actions_Taken_Category_2]
    -- ,[Basic_Additional_Actions_Taken_3]
    -- ,[Basic_Additional_Actions_Taken_Category_3]
    -- ,[Basic_Additional_Actions_Taken_Code_2]
    -- ,[Basic_Additional_Actions_Taken_Code_3]
    -- ,[Basic_Additional_Actions_Taken_Code_And_Description_2]
    -- ,[Basic_Additional_Actions_Taken_Code_And_Description_3]
    -- ,[Basic_Additional_Actions_Taken_List]
    -- ,[Basic_Aid_Given_Or_Received]
    -- ,[Basic_Aid_Given_Their_Fire_Department_ID]
    -- ,[Basic_Aid_Given_Their_Incident_Number]
    -- ,[Basic_Aid_Given_Their_Incident_State]
    -- ,[Basic_Aid_Received_Their_Fire_Department_ID_List]
    -- ,[Basic_Alarms]



    -- ,[Basic_Authorization_Member_Making_Report_Assignment]
    -- ,[Basic_Authorization_Member_Making_Report_Date]
    -- ,[Basic_Authorization_Member_Making_Report_License_Number]
    -- ,[Basic_Authorization_Member_Making_Report_Performer_ID]
    -- ,[Basic_Authorization_Member_Making_Report_Position]
    -- ,[Basic_Authorization_Member_Making_Report_Signature]

    -- ,[Basic_Authorization_Officer_In_Charge_Assignment]
    -- ,[Basic_Authorization_Officer_In_Charge_Date]
    -- ,[Basic_Authorization_Officer_In_Charge_License_Number]
    -- ,[Basic_Authorization_Officer_In_Charge_Performer_ID]
    -- ,[Basic_Authorization_Officer_In_Charge_Position]
    -- ,[Basic_Authorization_Officer_In_Charge_Signature]

    -- ,[Basic_Civilian_Casualty_Full_Name_List]
    -- ,[Basic_Detector]
    -- ,[Basic_Detector_Code]
    -- ,[Basic_Detector_Code_And_Description]


    -- ,[Basic_Fire_Departement_ID_FDID]
    -- ,[Basic_Fire_Service_Casualty_Full_Name_List]
    -- ,[Basic_Hazardous_Materials_Release]
    -- ,[Basic_Hazardous_Materials_Release_Code]
    -- ,[Basic_Hazardous_Materials_Release_Code_And_Description]


    -- ignore this for now, we use arrival times of the individual UNITS, not from the basic form
    -- ,[Basic_Incident_Arrival_Date_Time]

    -- These pre-calculated items can be ignored for now
    -- ,[Basic_Incident_Alarm_To_Arrival_In_HHMMSS]
    -- ,[Basic_Incident_Alarm_To_Controlled_In_HHMMSS]
    -- ,[Basic_Incident_Alarm_To_First_Unit_Arrived_In_HHMMSS]
    -- ,[Basic_Incident_Alarm_To_In_Service_HHMMSS]
    -- ,[Basic_Incident_Alarm_To_Last_Unit_Arrived_In_HHMMSS]
    -- ,[Basic_Incident_Alarm_To_Last_Unit_Cleared_HHMMSS]
    -- ,[Basic_Incident_Arrival_To_Controlled_HHMMSS]
    -- ,[Basic_Incident_Arrival_To_In_Service_HHMMSS]
    -- ,[Basic_Incident_Arrival_To_Last_Unit_Cleared_HHMMSS]

    -- address fields
    -- ,[Basic_Incident_Apartment_Number]
    -- ,[Basic_Incident_Census_Tract]
    -- ,[Basic_Incident_City_GNIS]
    -- ,[Basic_Incident_City_Name]
    -- ,[Basic_Incident_Controlled_Date_Time]
    -- ,[Basic_Incident_Controlled_To_In_Service_HHMMSS]
    -- ,[Basic_Incident_Controlled_To_Last_Unit_Cleared_HHMMSS]
    -- ,[Basic_Incident_Country_Code]
    -- ,[Basic_Incident_Country_Name]
    -- ,[Basic_Incident_County_GNIS]
    -- ,[Basic_Incident_County_Name]
    -- ,[Basic_Incident_Cross_Street]
    -- ,[Basic_Incident_Date_To_Incident_Record_Create_In_Hours]
    -- ,[Basic_Incident_Date_To_Incident_Record_Created_In_Days]


    -- ,[Basic_Incident_Entered_Date_Time]
    -- ,[Basic_Incident_Import_Method]
    -- ,[Basic_Incident_In_Service_Date_Time]
    -- ,[Basic_Incident_Last_Unit_Cleared_Date_Time]

    -- ,[Basic_Incident_Location_Type]
    -- ,[Basic_Incident_Mixed_Use_Property]
    -- ,[Basic_Incident_Mixed_Use_Property_Code]
    -- ,[Basic_Incident_Mixed_Use_Property_Code_And_Description]
    -- ,[Basic_Incident_Post_Office_Box]
    -- ,[Basic_Incident_Postal_Code]
    -- ,[Basic_Incident_PSAP_To_Alarm_In_HHMMSS]
    -- ,[Basic_Incident_PSAP_To_Arrival_In_HHMMSS]
    -- ,[Basic_Incident_PSAP_To_Controlled_In_HHMMSS]
    -- ,[Basic_Incident_PSAP_To_Last_Unit_Cleared_In_HHMMSS]
    -- ,[Basic_Incident_Reported_By]
    

    -- ,[Basic_NFIRS_Number]
    -- ,[Basic_Primary_Circumstance]
    -- ,[Basic_Primary_Station_Other]
    -- ,[Basic_Property_Use]
    -- ,[Basic_Property_Use_Category]
    -- ,[Basic_Property_Use_Code]
    -- ,[Basic_Property_Use_Code_And_Description]
    -- ,[Basic_Reason_Incident_Classified_As_Critical]


    -- ,[Basic_Type_Of_Alarm]
    -- ,[Basic_Was_Incident_Classified_As_Critical]
    -- ,[Basic_Was_State_Team_Mobilized_For_Incident]
    -- ,[HazMat_Chemical_Name_List]
    -- ,[Basic_Resource_Counts_Include_Aid_Received]
    -- ,[Basic_Apparatus_Or_Personnel_Module_Used]
    -- ,[System_ID]
    -- ,[CreatedOn]
    -- ,[ModifiedOn]


    -- These can be troublesome as crew members don't always "associate" incidents properly
    -- ,[Basic_Incident_Associated_EMS_Incident_ID]
    -- ,[Basic_Incident_Associated_EMS_Incident_Number]

    -- ImageTrend's "is the record locked" flag
    -- ,[Basic_Locked_Status]

    -- ,[Basic_Incident_Leave_Scene_Date_Time]
    -- ,[Basic_Arrival_At_Hospital_Date_Time]
    -- ,[Basic_In_Quarters_Date_Time]
    -- ,[Basic_Incident_PSAP_to_Left_Scene_Time_in_HHMMSS]
    -- ,[Basic_Incident_PSAP_to_Arrived_at_Hospital_in_HHMMSS]
    -- ,[Basic_Incident_PSAP_to_In_Quarters_in_HHMMSS]
    -- ,[Basic_Incident_Alarm_to_Left_Scene_in_HHMMSS]
    -- ,[Basic_Incident_Alarm_to_Arrived_at_Hospital_in_HHMMSS]
    -- ,[Basic_Incident_Alarm_to_In_Quarters_in_HHMMSS]
    -- ,[Basic_Incident_Arrived_at_Scene_to_Left_Scene_in_HHMMSS]
    -- ,[Basic_Incident_Arrived_at_Scene_to_Arrived_at_Hospital_in_HHMMSS]
    -- ,[Basic_Incident_Arrived_at_Scene_to_In_Quarters_in_HHMMSS]
    -- ,[Basic_Incident_Controlled_to_Left_Scene_in_HHMMSS]
    -- ,[Basic_Incident_Controlled_to_Arrived_at_Hospital_in_HHMMSS]
    -- ,[Basic_Incident_Controlled_to_In_Quarters_in_HHMMSS]
    -- ,[Basic_Incident_Left_Scene_to_Arrived_at_Hospital_in_HHMMSS]
    -- ,[Basic_Incident_Left_Scene_to_Last_Unit_Cleared_in_HHMMSS]
    -- ,[Basic_Incident_Left_Scene_to_In_Service_in_HHMMSS]
    -- ,[Basic_Incident_Left_Scene_to_In_Quarters_in_HHMMSS]
    -- ,[Basic_Incident_Arrived_at_Hospital_to_Last_Unit_Cleared_in_HHMMSS]
    -- ,[Basic_Incident_Arrived_at_Hospital_to_In_Service_in_HHMMSS]
    -- ,[Basic_Incident_Arrived_at_Hospital_to_In_Quarters_in_HHMMSS]
    -- ,[Basic_Incident_Last_Unit_Cleared_to_In_Quarters_in_HHMMSS]
    -- ,[Basic_Incident_In_Service_to_In_Quarters_in_HHMMSS]
    -- ,[Basic_Incident_1_Personnel_Assembled_Date_Time]
    -- ,[Basic_Incident_2_Personnel_Assembled_Date_Time]
    -- ,[Basic_Incident_3_Personnel_Assembled_Date_Time]
    -- ,[Basic_Incident_4_Personnel_Assembled_Date_Time]
    -- ,[Basic_Incident_5_Personnel_Assembled_Date_Time]
    -- ,[Basic_Incident_6_Personnel_Assembled_Date_Time]
    -- ,[Basic_Incident_7_Personnel_Assembled_Date_Time]
    -- ,[Basic_Incident_8_Personnel_Assembled_Date_Time]
    -- ,[Basic_Incident_9_Personnel_Assembled_Date_Time]
    -- ,[Basic_Incident_10_Personnel_Assembled_Date_Time]
    -- ,[Basic_Incident_11_Personnel_Assembled_Date_Time]
    -- ,[Basic_Incident_12_Personnel_Assembled_Date_Time]
    -- ,[Basic_Incident_13_Personnel_Assembled_Date_Time]
    -- ,[Basic_Incident_14_Personnel_Assembled_Date_Time]
    -- ,[Basic_Incident_15_Personnel_Assembled_Date_Time]
    -- ,[Basic_Incident_16_Personnel_Assembled_Date_Time]
    -- ,[Basic_Incident_Alarm_To_Arrival_Of_1_Personnel_In_HHMMSS]
    -- ,[Basic_Incident_Alarm_To_Arrival_Of_2_Personnel_In_HHMMSS]
    -- ,[Basic_Incident_Alarm_To_Arrival_Of_3_Personnel_In_HHMMSS]
    -- ,[Basic_Incident_Alarm_To_Arrival_Of_4_Personnel_In_HHMMSS]
    -- ,[Basic_Incident_Alarm_To_Arrival_Of_5_Personnel_In_HHMMSS]
    -- ,[Basic_Incident_Alarm_To_Arrival_Of_6_Personnel_In_HHMMSS]
    -- ,[Basic_Incident_Alarm_To_Arrival_Of_7_Personnel_In_HHMMSS]
    -- ,[Basic_Incident_Alarm_To_Arrival_Of_8_Personnel_In_HHMMSS]
    -- ,[Basic_Incident_Alarm_To_Arrival_Of_9_Personnel_In_HHMMSS]
    -- ,[Basic_Incident_Alarm_To_Arrival_Of_10_Personnel_In_HHMMSS]
    -- ,[Basic_Incident_Alarm_To_Arrival_Of_11_Personnel_In_HHMMSS]
    -- ,[Basic_Incident_Alarm_To_Arrival_Of_12_Personnel_In_HHMMSS]
    -- ,[Basic_Incident_Alarm_To_Arrival_Of_13_Personnel_In_HHMMSS]
    -- ,[Basic_Incident_Alarm_To_Arrival_Of_14_Personnel_In_HHMMSS]
    -- ,[Basic_Incident_Alarm_To_Arrival_Of_15_Personnel_In_HHMMSS]
    -- ,[Basic_Incident_Alarm_To_Arrival_Of_16_Personnel_In_HHMMSS]
    -- ,[Basic_Incident_Last_Unit_Arrived_Date_Time]




    -- ,[Basic_Incident_Geocoded_Date]
    -- ,[Basic_Incident_Geocoded_Ambiguous]
    -- ,[Basic_Incident_Geocoded_Latitude]
    -- ,[Basic_Incident_Geocoded_Longitude]
    -- ,[Basic_Secondary_Station_Names_List]
    -- ,[Basic_Response_Mode_To_Scene]
    -- ,[Basic_Incident_Validity_Score_Range]
    -- ,[Basic_Incident_NFPA_Category_Code]
    -- ,[Basic_Incident_NFPA_Category]
    -- ,[Basic_Incident_NFPA_Type_Code]
    -- ,[Basic_Incident_NFPA_Type]
    -- ,[Basic_Incident_NFPA_Is_Confined_Fire]
    -- ,[Basic_Incident_NFPA_Intentionally_Set_Fire_Type_Code]
    -- ,[Basic_Incident_NFPA_Intentionally_Set_Fire_Type]
    -- ,[Basic_Incident_NFPA_False_Alarm_Type_Code]
    -- ,[Basic_Incident_NFPA_False_Alarm_Type]
    -- ,[Basic_Incident_NFPA_Is_Not_Confined_Fire]
    -- ,[Basic_Incident_NFPA_Type_Is_Fire]
    -- ,[Basic_Incident_NFPA_Type_Is_Incident]
    -- ,[Basic_Incident_NFPA_Type_Is_Residential_Fire]
    -- ,[Basic_Incident_NFPA_Type_Is_Structural_Fire]
    -- ,[Basic_Incident_Target_Performance_Time_In_Minutes]
    -- ,[Basic_Incident_District_Description]



    -- ,[Basic_Incident_17_Personnel_Assembled_Date_Time]
    -- ,[Basic_Incident_18_Personnel_Assembled_Date_Time]
    -- ,[Basic_Incident_19_Personnel_Assembled_Date_Time]
    -- ,[Basic_Incident_20_Personnel_Assembled_Date_Time]
    -- ,[Basic_Incident_21_Personnel_Assembled_Date_Time]
    -- ,[Basic_Incident_22_Personnel_Assembled_Date_Time]
    -- ,[Basic_Incident_23_Personnel_Assembled_Date_Time]
    -- ,[Basic_Incident_Alarm_To_Arrival_Of_17_Personnel_In_HHMMSS]
    -- ,[Basic_Incident_Alarm_To_Arrival_Of_18_Personnel_In_HHMMSS]
    -- ,[Basic_Incident_Alarm_To_Arrival_Of_19_Personnel_In_HHMMSS]
    -- ,[Basic_Incident_Alarm_To_Arrival_Of_20_Personnel_In_HHMMSS]
    -- ,[Basic_Incident_Alarm_To_Arrival_Of_21_Personnel_In_HHMMSS]
    -- ,[Basic_Incident_Alarm_To_Arrival_Of_22_Personnel_In_HHMMSS]
    -- ,[Basic_Incident_Alarm_To_Arrival_Of_23_Personnel_In_HHMMSS]

    -- RP number
    -- ,[Basic_Other_System_Number]


    -- ,[Basic_Incident_Geocoded_Origin]





    -- ,[Basic_In_State_Responsibility_Area]
    -- ,[Basic_Incident_Address_Favorite_Address_Code]

    -- ,[Basic_Final_NFIRS_Code_And_Description]

    -- ,[Basic_Aid_Received_Department_List]
    -- ,[Basic_Aid_Given_Their_Fire_Department_Name]
    -- ,[Basic_Incident_Origin]
    -- ,[Basic_Incident_First_CAD_Download_Date_Time]
    -- ,[Basic_Incident_NFPA_Mutual_Aid_Given]
    -- ,[Basic_Incident_Full_Address_With_State]


    -- first arriving unit
    -- ,[Basic_First_Arrived_At_Scene_Apparatus_ID]
    -- ,[Basic_First_Apparatus_Arrived_At_Scene_Date_Time]

    -- ,[Basic_First_Apparatus_Arrived_At_Scene_Dispatch_to_Arrived_At_Scene_in_Minutes]
    -- ,[Basic_First_Apparatus_Arrived_At_Scene_to_Cleared_in_Minutes]
    -- ,[Basic_First_Apparatus_Arrived_At_Scene_to_Arrived_At_Hospital_in_Minutes]
    -- ,[Basic_First_Apparatus_Arrived_At_Scene_to_In_Quarters_In_Minutes]
    -- ,[Basic_First_Apparatus_Arrived_At_Scene_to_Left_Scene_in_Minutes]
    -- ,[Basic_First_Apparatus_Arrived_At_Scene_to_In_Service_in_Minutes]
    -- ,[Basic_First_Apparatus_Arrived_At_Scene_EnRoute_To_Arrived_At_Scene_in_Minutes]
    -- ,[Basic_First_Apparatus_Arrived_At_Scene_Dispatch_to_First_Arrived_At_Scene_in_Seconds]
    -- ,[Basic_First_Apparatus_Arrived_At_Scene_to_Cleared_in_Seconds]
    -- ,[Basic_First_Apparatus_Arrived_At_Scene_to_Arrived_At_Hospital_in_Seconds]
    -- ,[Basic_First_Apparatus_Arrived_At_Scene_to_In_Quarters_In_Seconds]
    -- ,[Basic_First_Apparatus_Arrived_At_Scene_to_Left_Scene_in_Seconds]
    -- ,[Basic_First_Apparatus_Arrived_At_Scene_to_In_Service_in_Seconds]
    -- ,[Basic_First_Apparatus_Arrived_At_Scene_EnRoute_to_Arrived_At_Scene_in_Seconds]
    -- ,[Basic_First_Apparatus_Unit_Arrived_To_Last_Unit_Arrived_in_Seconds]
    -- ,[Basic_First_Apparatus_Unit_Arrived_To_Last_Unit_Arrived_in_Minutes]
    -- ,[Basic_Last_Apparatus_Arrived_At_Scene_Apparatus_ID]
    -- ,[Basic_Contract_Response_Agency_Name]
    -- ,[Basic_Incident_24_Personnel_Assembled_Date_Time]
    -- ,[Basic_Incident_25_Personnel_Assembled_Date_Time]
    -- ,[Basic_Incident_26_Personnel_Assembled_Date_Time]
    -- ,[Basic_Incident_Alarm_to_Arrival_of_24_Personnel_in_HHMMSS]
    -- ,[Basic_Incident_Alarm_to_Arrival_of_25_Personnel_in_HHMMSS]
    -- ,[Basic_Incident_Alarm_to_Arrival_of_26_Personnel_in_HHMMSS]
    -- ,[Basic_Incident_First_Unit_Arrived_Apparatus_Type]
    -- ,[Basic_Incident_First_Unit_Arrived_Apparatus_Type_Category]
    -- ,[Basic_Incident_First_Unit_Arrived_En_Route_Date_Time]
    -- ,[Basic_Incident_First_Unit_Arrived_Dispatch_Date_Time]
    -- ,[Basic_Incident_First_Unit_Arrived_Dispatch_To_Arrival_In_Minutes]
    -- ,[Basic_Incident_First_Unit_Arrived_Dispatch_To_En_Route_In_Minutes]
    -- ,[Basic_Incident_First_Unit_Arrived_En_Route_To_Arrival_In_Minutes]
    -- ,[Basic_Incident_First_Unit_Arrived_Dispatch_To_Arrival_In_HHMMSS]
    -- ,[Basic_Incident_First_Unit_Arrived_Dispatch_To_En_Route_In_HHMMSS]
    -- ,[Basic_Incident_First_Unit_Arrived_En_Route_To_Arrival_In_HHMMSS]
    -- ,[Basic_Incident_First_Unit_Arrived_Dispatch_To_Arrival_In_Seconds]
    -- ,[Basic_Incident_First_Unit_Arrived_Dispatch_To_En_Route_In_Seconds]
    -- ,[Basic_Incident_First_Unit_Arrived_En_Route_To_Arrival_In_Seconds]

    -- Not sure... 1st, 2nd, 3rd alarm fire??!?
    -- ,[Basic_CAD_Assignment]

    -- ,[Fire_Incident_Marked_As_Finished]
    -- ,[Fire_Incident_Marked_As_Finished_Date_Time]
    -- ,[Fire_Incident_Marked_As_Finished_By_Name]
    -- ,[Basic_Incident_Associated_Community_Health_Visit_ID]
    -- ,[Basic_Incident_Associated_Community_Health_Incident_Number]
    -- ,[Basic_Aid_Given_Or_Received_Code]
    -- ,[Basic_Aid_Given_Or_Received_Code_and_Description]

  FROM [Elite_DWPortland].[DwFire].[Dim_Basic]