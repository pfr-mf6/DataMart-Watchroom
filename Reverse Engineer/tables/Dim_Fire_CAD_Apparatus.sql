SELECT
    -- this table's PK
    [Dim_Fire_CAD_Apparatus_PK]
    ,[CAD_Apparatus_Resource_ID] as 'call sign'

    -- times for each apparatus
    ,[CAD_Apparatus_Resource_Arrival_Date_Time] as 'OS'
    ,[CAD_Apparatus_Resource_Clear_Date_Time] as 'clear'
    ,[CAD_Apparatus_Resource_Dispatch_Date_Time] as 'DP'
    ,[CAD_Appratus_Resource_Enroute_Date_Time] as 'ER'
    ,[CAD_Apparatus_Resource_In_Service_Date_Time] as 'AOR'

    -- keep these and ignore for now
    ,[CAD_Apparatus_ID_Internal]
    ,[CAD_Incident_ID_Internal]

FROM [Elite_DWPortland].[DwFire].[Dim_Fire_CAD_Apparatus]