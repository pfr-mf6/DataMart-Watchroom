WITH Dispatched_Groups AS (
    SELECT *,
        DENSE_RANK() OVER (
            PARTITION BY RP_fire 
            ORDER BY DATEADD(SECOND, -DATEDIFF(SECOND, '2000-01-01', DP) % 120, 
                           DP)  -- Changed from 60 to 120 to create 2-minute windows
        ) as dispatch_group
    FROM (
    -- ###############################################################################################


    SELECT
        Dim_Basic.Basic_Incident_Number AS RP_fire,
        Dim_Basic.Basic_Incident_Alarm_Time AS fire_time,

        Dim_Fire.Fire_Initial_CAD_Incident_Type_Description as EFD,

        Dim_Basic.Basic_Apparatus_Call_Sign_List AS All_Responding_Units,
        Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign AS unit,


        -- ###############################################################################################

        Dim_Basic.Basic_Incident_Alarm_Time AS 'alarm',
        Dim_ApparatusResources.Apparatus_Resource_Dispatch_Date_Time as 'DP',
        --Dim_ApparatusResources.Apparatus_Resource_Arrival_Date_Time as 'OS',
        -- Dim_ApparatusResources.Appratus_Resource_Enroute_Date_Time as 'ER',
        -- Dim_ApparatusResources.Apparatus_Resource_Clear_Date_Time as 'CL',
        -- Dim_ApparatusResources.Apparatus_Resource_In_Service_Date_Time as 'AV',
        -- Dim_ApparatusResources.Apparatus_Resource_Staging_Date_Time as 'SG',
        --Dim_ApparatusResources.Apparatus_Resource_Leave_Scene_Date_Time as 'TR',
        --Dim_ApparatusResources.Apparatus_Resource_Arrival_At_Hospital_Time as 'TC',
        --Dim_ApparatusResources.Apparatus_Resource_In_Quarters_Date_Time as 'AIQ',

        -- ROW_NUMBER() OVER (
        --         PARTITION BY Dim_Basic.Basic_Incident_Number 
        --         ORDER BY Dim_ApparatusResources.Apparatus_Resource_Arrival_Date_Time
        --     ) as arrival_order,


        Dim_Basic.Basic_Primary_Action_Taken AS 'disposition',
        -- ###############################################################################################


        -- ###############################################################################################
        -- just for filtering
        Fact_Fire.Agency_Shortname AS agency,
        Dim_Basic.Basic_Exposure as Exposure,



        'https://portland.imagetrendelite.com/Elite/Organizationportland/Agencyportlandfi/FireRunForm#/Incident'
            + CONVERT(VARCHAR(255), Fact_Fire.Incident_ID_Internal)
            + '/Form'
            + CONVERT(VARCHAR(255), Fact_Fire.Basic_Incident_Form_Number) AS fire_link






    FROM [Elite_DWPortland].[DwFire].[Fact_Fire]
        INNER JOIN [Elite_DWPortland].[DwFire].[Dim_Basic] 
            ON Fact_Fire.Dim_Basic_FK = Dim_Basic.Dim_Basic_PK
        INNER JOIN [Elite_DWPortland].[DwFire].[Dim_Fire] 
            ON Fact_Fire.Dim_Fire_FK = Dim_Fire.Dim_Fire_PK
        LEFT JOIN [Elite_DWPortland].[DwEms].[Fact_Incident]
            INNER JOIN [Elite_DWPortland].[DwEms].[Dim_Incident_One_To_One] 
                ON Fact_Incident.Dim_Incident_One_To_One_PK = Dim_Incident_One_To_One.Dim_Incident_One_To_One_PK
            INNER JOIN [Elite_DWPortland].[DwEms].[Dim_Incident] 
                ON Fact_Incident.Dim_Incident_FK = Dim_Incident.Dim_Incident_PK
            ON Dim_Basic.Basic_Incident_Number = Dim_Incident_One_To_One.Response_Incident_Number

        LEFT JOIN [Elite_DWPortland].[DwFire].[Bridge_Fire_ApparatusResources] AS [Bridge_Fire_ApparatusResources] ON [Fact_Fire].[Fact_Fire_PK] = [Bridge_Fire_ApparatusResources].[Fact_Fire_PK]
        LEFT JOIN [Elite_DWPortland].[DwFire].[Dim_ApparatusResources] AS [Dim_ApparatusResources] ON [Bridge_Fire_ApparatusResources].[Dim_ApparatusResources_PK] = [Dim_ApparatusResources].[Dim_ApparatusResources_PK]



    WHERE
        Fact_Fire.Agency_shortname = 'portlandfi'
        AND Dim_Basic.Basic_Incident_Alarm_Time >= '2024-08-19'
        AND Dim_Basic.Basic_Incident_Number IS NOT NULL
        AND Dim_Basic.Basic_Exposure = 0
        AND (Dim_Fire.Fire_Initial_CAD_Incident_Type_Description LIKE '69%' OR Dim_Fire.Fire_Initial_CAD_Incident_Type_Description LIKE 'BOX%')
        -- AND Dim_Basic.Basic_Incident_Number LIKE 'RP25-1289'

        -- NOTE: There are records with NO EMD/ProQA code... but let's just leave these in for now :<
        -- AND Dim_Fire.Fire_Initial_CAD_Incident_Type_Description IS NULL



        -- NACHO UNITS!
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'CHS%'
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'CHAT%'
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign not LIKE 'PSR%'
        -- AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign not LIKE 'M%' -- this will exclude MC9 :(
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE '[M][0-9]%'
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE '[B][0-9]%'
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign not LIKE 'LZ%'

        -- Fire inspectors
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE '[I][0-9]%'


        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'MCCL%'
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'MS%'

        -- AIRPORT FIRE
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'C8%'
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'NOPDX%'
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'NOBOEC%'
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'E80%'
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'R82%'
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'INFO%'
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'RB80%'

        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'VA%'
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'CC%'
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'D3%'
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'LO%'
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'TV%'
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'TIPF%'
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'POISON%'
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'INFFA1%'
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'EMS%'
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'FT%'

        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'E32%'
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'BU33%'

        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'S6%'
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'E61%'
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'BU61%'

        --AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'BU33%' -- ????

        -- GRESHAM UNITS <3
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'C7%'
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'T71%'
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'E71%'
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'E72%'
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'E73%'
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'E74%'
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'E75%'
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'E76%'
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'R74%'
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'BU74%'
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'RHB74%'
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'HR71%'
        AND Dim_ApparatusResources.Apparatus_Resource_Vehicle_Call_Sign NOT LIKE 'HS81%'





    -- ###############################################################################################
    ) base_query
),
Multiple_Dispatches AS (
    SELECT DISTINCT RP_fire
    FROM Dispatched_Groups
    GROUP BY RP_fire
    HAVING COUNT(DISTINCT dispatch_group) > 1
),
Concatenated_Groups AS (
    SELECT 
        d.RP_fire,
        d.fire_time,
        d.EFD,
        d.alarm,
        d.disposition,
        d.agency,
        d.Exposure,
        d.fire_link,
        d.dispatch_group,
        STRING_AGG(d.unit, ', ') WITHIN GROUP (ORDER BY d.DP) as units_in_group
    FROM Dispatched_Groups d
    INNER JOIN Multiple_Dispatches m ON d.RP_fire = m.RP_fire
    GROUP BY 
        d.RP_fire,
        d.fire_time,
        d.EFD,
        d.alarm,
        d.disposition,
        d.agency,
        d.Exposure,
        d.fire_link,
        d.dispatch_group
)
SELECT *
FROM Concatenated_Groups
ORDER BY RP_fire, dispatch_group;


-- SELECT 
--     RP_fire,
--     fire_time,
--     EFD,
--     All_Responding_Units,
--     unit,
--     alarm,
--     DP,
--     dispatch_group,
--     --disposition,
--     --agency,
--     Exposure,
--     fire_link
-- FROM Dispatched_Groups
-- ORDER BY RP_fire, dispatch_group

-- Multiple_Dispatches AS (
--     SELECT DISTINCT RP_fire
--     FROM Dispatched_Groups
--     GROUP BY RP_fire
--     HAVING COUNT(DISTINCT dispatch_group) > 1
-- )
-- SELECT 
--     d.RP_fire,
--     d.fire_time,
--     d.EFD,
--     d.All_Responding_Units,
--     d.unit,
--     d.alarm,
--     d.DP,
--     d.disposition,
--     d.agency,
--     d.Exposure,
--     d.fire_link,
--     d.dispatch_group
-- FROM Dispatched_Groups d
-- INNER JOIN Multiple_Dispatches m ON d.RP_fire = m.RP_fire
-- ORDER BY d.RP_fire, d.dispatch_group;