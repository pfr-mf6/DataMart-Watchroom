SELECT
    Dim_Basic.Basic_Incident_Number AS RP_fire,
    Dim_Incident_One_To_One.Response_Incident_Number as RP_ems,
    Dim_Basic.Basic_Incident_Alarm_Time AS fire_time,
    Dim_Incident.Incident_PSAP_Call_Date_Time AS ems_time,
    -- 'Ex. ' + CONVERT(VARCHAR(255), Dim_Basic.Basic_Exposure) AS unique_record_id,
    Dim_Basic.Basic_Exposure as Fire_Report_Exposure_Number,

    -- ################################################################################################
    Dim_Fire.Fire_Initial_CAD_Incident_Type_Description AS 'EMD - desc',


    -- Column 1: Full Code (before the dash)
    CASE
        WHEN CHARINDEX(' -', Dim_Fire.Fire_Initial_CAD_Incident_Type_Description) > 0 
        THEN LEFT(Dim_Fire.Fire_Initial_CAD_Incident_Type_Description, 
                CHARINDEX(' -', Dim_Fire.Fire_Initial_CAD_Incident_Type_Description) - 1)
        ELSE Dim_Fire.Fire_Initial_CAD_Incident_Type_Description 
    END as ProQA_Code,

    -- Column 2: Initial Numbers
    CASE 
        WHEN CHARINDEX(' -', Dim_Fire.Fire_Initial_CAD_Incident_Type_Description) > 0 
        THEN LEFT(
                LEFT(Dim_Fire.Fire_Initial_CAD_Incident_Type_Description, 
                    CHARINDEX(' -', Dim_Fire.Fire_Initial_CAD_Incident_Type_Description) - 1),
                PATINDEX('%[^0-9]%',
                        LEFT(Dim_Fire.Fire_Initial_CAD_Incident_Type_Description, 
                            CHARINDEX(' -', Dim_Fire.Fire_Initial_CAD_Incident_Type_Description) - 1) + 'A') - 1)
        ELSE LEFT(Dim_Fire.Fire_Initial_CAD_Incident_Type_Description,
                PATINDEX('%[^0-9]%', Dim_Fire.Fire_Initial_CAD_Incident_Type_Description + 'A') - 1)
    END as ProQA_Numeric,

    -- Column 3: Letter after initial numbers (only if code starts with numbers)
    CASE 
        WHEN CHARINDEX(' -', Dim_Fire.Fire_Initial_CAD_Incident_Type_Description) > 0 
            AND PATINDEX('[0-9]%', 
                LEFT(Dim_Fire.Fire_Initial_CAD_Incident_Type_Description, 
                    CHARINDEX(' -', Dim_Fire.Fire_Initial_CAD_Incident_Type_Description) - 1)) = 1
        THEN SUBSTRING(
                LEFT(Dim_Fire.Fire_Initial_CAD_Incident_Type_Description, 
                    CHARINDEX(' -', Dim_Fire.Fire_Initial_CAD_Incident_Type_Description) - 1),
                PATINDEX('%[^0-9]%', 
                        LEFT(Dim_Fire.Fire_Initial_CAD_Incident_Type_Description, 
                            CHARINDEX(' - ', Dim_Fire.Fire_Initial_CAD_Incident_Type_Description) - 1)),
                1)
        ELSE NULL
    END as ProQA_Letter,


    -- ################################################################################################

    Dim_Basic.Basic_Apparatus_Call_Sign_List AS 'All Responding Units',
    Dim_Basic.Basic_Primary_Action_Taken AS 'disposition',

    Dim_Response.Response_EMS_Unit_Call_Sign AS 'ePCR unit',

    Dim_Disposition.Disposition_Patient_Evaluation_Care as 'medical care',

    --STRING_AGG(Dim_Vitals.Vitals_Signs_Taken_Date_Time, ', ') WITHIN GROUP (ORDER BY Dim_Vitals.Vitals_Signs_Taken_Date_Time) AS vital_times,
    -- COUNT(Dim_Vitals.Vitals_Signs_Taken_Date_Time) AS count_vitals,
    -- COUNT(Dim_Procedure.Dim_Procedure_PK) AS count_proc,
    --STRING_AGG(Dim_Procedure.Procedure_Performed_Description, ', ') WITHIN GROUP (ORDER BY Dim_Procedure.Procedure_Performed_Description) AS proc_desc,
    -- STRING_AGG(CONVERT(VARCHAR(MAX), Dim_Procedure.Procedure_Performed_Description), ', ') WITHIN GROUP (ORDER BY Dim_Procedure.Procedure_Performed_Description) AS proc_desc,




    -- STRING_AGG(CONVERT(VARCHAR(MAX), Dim_Procedure.Procedure_Performed_Description), ', ') WITHIN GROUP (ORDER BY Dim_Procedure.Procedure_Performed_Description) AS proc_desc,
    -- STRING_AGG(CONVERT(VARCHAR(MAX), Dim_Medication.Medication_Given_Description), ', ') WITHIN GROUP (ORDER BY Dim_Medication.Medication_Given_Description) AS meds_desc,

    STRING_AGG(CONVERT(VARCHAR(MAX), Dim_Procedure.Procedure_Performed_Description), ', ') AS proc_desc,
    STRING_AGG(CONVERT(VARCHAR(MAX), Dim_Medication.Medication_Given_Description), ', ') AS meds_desc,

    -- I need a column with a 1/0 depending on if proc_desc is null or not
    -- CASE WHEN proc_desc IS NOT NULL --TODO: I haven't confirmed that this works... am doubtful
    -- CASE WHEN STRING_AGG(CONVERT(VARCHAR(MAX), Dim_Procedure.Procedure_Performed_Description), ', ') WITHIN GROUP (ORDER BY Dim_Procedure.Procedure_Performed_Description) IS NOT NULL
    --     THEN 1
    --     ELSE 0
    -- END AS proc_desc_not_null,



    -- CASE WHEN STRING_AGG(CONVERT(VARCHAR(MAX), Dim_Medication.Medication_Given_Description), ', ') WITHIN GROUP (ORDER BY Dim_Medication.Medication_Given_Description) IS NOT NULL
    --     THEN 1
    --     ELSE 0
    -- END AS meds_desc_not_null,


    

    -- ################################################################################################

    'https://portland.imagetrendelite.com/Elite/Organizationportland/Agencyportlandfi/FireRunForm#/Incident'
        + CONVERT(VARCHAR(255), Fact_Fire.Incident_ID_Internal)
        + '/Form'
        + CONVERT(VARCHAR(255), Fact_Fire.Basic_Incident_Form_Number) AS fire_link,

    'https://portland.imagetrendelite.com/Elite/Organizationportland/Agencyportlandfi/EmsRunForm#/Incident'
        + CONVERT(VARCHAR(255), Fact_Incident.Incident_Transaction_GUID_Internal)
        + '/Form'
        + CONVERT(VARCHAR(255), Fact_Incident.Incident_Form_Number) AS ePCR_link,



    -- just for filtering
    Fact_Fire.Agency_Shortname AS agency



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

    LEFT JOIN [Elite_DWPortland].[DwEms].[Dim_Disposition] AS [Dim_Disposition] ON [Fact_Incident].[Dim_Disposition_FK] = [Dim_Disposition].[Dim_Disposition_PK]

    LEFT JOIN [Elite_DWPortland].[DwEms].[Dim_Response] ON Fact_Incident.Dim_Response_FK = Dim_Response.Dim_Response_PK

    LEFT JOIN [Elite_DWPortland].[DwEms].[Bridge_Incident_Vitals] AS [Bridge_Incident_Vitals] ON [Fact_Incident].[Fact_Incident_PK] = [Bridge_Incident_Vitals].[Fact_Incident_PK]
    LEFT JOIN [Elite_DWPortland].[DwEms].[Dim_Vitals] AS [Dim_Vitals] ON [Bridge_Incident_Vitals].[Dim_Vitals_PK] = [Dim_Vitals].[Dim_Vitals_PK]

    LEFT JOIN [Elite_DWPortland].[DwEms].[Bridge_Incident_Procedure] AS [Bridge_Incident_Procedure] ON [Fact_Incident].[Fact_Incident_PK] = [Bridge_Incident_Procedure].[Fact_Incident_PK]
    LEFT JOIN [Elite_DWPortland].[DwEms].[Dim_Procedure] AS [Dim_Procedure] ON [Bridge_Incident_Procedure].[Dim_Procedure_PK] = [Dim_Procedure].[Dim_Procedure_PK]

    LEFT JOIN [Elite_DWPortland].[DwEms].[Bridge_Incident_Medication] AS [Bridge_Incident_Medication] ON [Fact_Incident].[Fact_Incident_PK] = [Bridge_Incident_Medication].[Fact_Incident_PK]
    LEFT JOIN [Elite_DWPortland].[DwEms].[Dim_Medication] AS [Dim_Medication] ON [Bridge_Incident_Medication].[Dim_Medication_PK] = [Dim_Medication].[Dim_Medication_PK]


-- WHERE Fact_Fire.CreatedOn >= '2025-01-01'
WHERE
    -- Fact_Fire.CreatedOn >= '2024-08-19' -- NOTE: we can't use the createdOn time becuase crews sometimes go WAY WAY back to do incomplete reports and it throws off our data :(
    Dim_Basic.Basic_Incident_Alarm_Time >= '2024-08-19'
    AND Fact_Fire.Agency_shortname = 'portlandfi'
    AND Dim_Basic.Basic_Incident_Number IS NOT NULL
    AND Dim_Basic.Basic_Exposure = 0




-- ################################################################################################
GROUP BY 
    Dim_Incident_One_To_One.Response_Incident_Number,
    Dim_Incident.Incident_PSAP_Call_Date_Time,

    Dim_Basic.Basic_Incident_Number,
    Dim_Basic.Basic_Incident_Alarm_Time,
    Dim_Basic.Basic_Exposure,
    Dim_Basic.Basic_Apparatus_Call_Sign_List,
    Dim_Basic.Basic_Primary_Action_Taken,

    Dim_Response.Response_EMS_Unit_Call_Sign,

    Dim_Disposition.Disposition_Patient_Evaluation_Care,

    Dim_Fire.Fire_Initial_CAD_Incident_Type_Description,
    Fact_Fire.Agency_Shortname,

    Fact_Fire.Incident_ID_Internal,
    Fact_Fire.Basic_Incident_Form_Number,
    Fact_Incident.Incident_Transaction_GUID_Internal,
    Fact_Incident.Incident_Form_Number




    --SUBSTRING_INDEX(Dim_Fire.Fire_Initial_CAD_Incident_Type_Description, ' - ', 1) as Code,
    --NULLIF(SUBSTRING_INDEX(Dim_Fire.Fire_Initial_CAD_Incident_Type_Description, ' - ', -1), SUBSTRING_INDEX(Dim_Fire.Fire_Initial_CAD_Incident_Type_Description, ' - ', 1)) as Description,
    -- CASE 
    --     WHEN CHARINDEX(' - ', Dim_Fire.Fire_Initial_CAD_Incident_Type_Description) > 0 
    --     THEN LEFT(Dim_Fire.Fire_Initial_CAD_Incident_Type_Description, CHARINDEX(' - ', Dim_Fire.Fire_Initial_CAD_Incident_Type_Description) - 1)
    --     ELSE Dim_Fire.Fire_Initial_CAD_Incident_Type_Description 
    -- END as ProQA_Code,

    -- works
    -- PATINDEX('%[0-9]%', ProQA_Code) as starting_position,
    -- LEFT(ProQA_Code, PATINDEX('%[^0-9]%', ProQA_Code + 'A') - 1) as Protocol_Number,
    -- CASE 
    -- WHEN CHARINDEX(' - ', Dim_Fire.Fire_Initial_CAD_Incident_Type_Description) > 0 
    -- THEN LEFT(
    --         LEFT(Dim_Fire.Fire_Initial_CAD_Incident_Type_Description, 
    --              CHARINDEX(' - ', Dim_Fire.Fire_Initial_CAD_Incident_Type_Description) - 1),
    --         PATINDEX('%[^0-9]%', 
    --                  LEFT(Dim_Fire.Fire_Initial_CAD_Incident_Type_Description, 
    --                       CHARINDEX(' - ', Dim_Fire.Fire_Initial_CAD_Incident_Type_Description) - 1) + 'A') - 1)
    -- ELSE LEFT(Dim_Fire.Fire_Initial_CAD_Incident_Type_Description,
    --          PATINDEX('%[^0-9]%', Dim_Fire.Fire_Initial_CAD_Incident_Type_Description + 'A') - 1)
    -- END as Protocol_Number,

    -- works but extracts letters when it should be blank for 'GRASS'
    -- CASE 
    -- WHEN CHARINDEX(' - ', Dim_Fire.Fire_Initial_CAD_Incident_Type_Description) > 0 
    -- THEN SUBSTRING(
    --         LEFT(Dim_Fire.Fire_Initial_CAD_Incident_Type_Description, 
    --              CHARINDEX(' - ', Dim_Fire.Fire_Initial_CAD_Incident_Type_Description) - 1),
    --         PATINDEX('%[^0-9]%', 
    --                  LEFT(Dim_Fire.Fire_Initial_CAD_Incident_Type_Description, 
    --                       CHARINDEX(' - ', Dim_Fire.Fire_Initial_CAD_Incident_Type_Description) - 1)),
    --         1)
    -- ELSE SUBSTRING(Dim_Fire.Fire_Initial_CAD_Incident_Type_Description,
    --               PATINDEX('%[^0-9]%', Dim_Fire.Fire_Initial_CAD_Incident_Type_Description),
    --               1)
    -- END as Protocol_Letter,

    -- CASE 
    -- WHEN CHARINDEX(' - ', Dim_Fire.Fire_Initial_CAD_Incident_Type_Description) > 0 
    --     AND PATINDEX('[0-9]%', 
    --         LEFT(Dim_Fire.Fire_Initial_CAD_Incident_Type_Description, 
    --             CHARINDEX(' - ', Dim_Fire.Fire_Initial_CAD_Incident_Type_Description) - 1)) = 1
    -- THEN SUBSTRING(
    --         LEFT(Dim_Fire.Fire_Initial_CAD_Incident_Type_Description, 
    --              CHARINDEX(' - ', Dim_Fire.Fire_Initial_CAD_Incident_Type_Description) - 1),
    --         PATINDEX('%[^0-9]%', 
    --                  LEFT(Dim_Fire.Fire_Initial_CAD_Incident_Type_Description, 
    --                       CHARINDEX(' - ', Dim_Fire.Fire_Initial_CAD_Incident_Type_Description) - 1)),
    --         1)
    -- ELSE NULL
    -- END as Protocol_Letter,