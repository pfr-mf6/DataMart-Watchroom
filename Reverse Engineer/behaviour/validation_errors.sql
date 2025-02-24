SELECT Fact_Fire_PK, COUNT(*) AS validation_count
FROM [Elite_DWPortland].[DwFire].[Bridge_Fire_ValidationRules]
GROUP BY Fact_Fire_PK
HAVING COUNT(*) >= 0;


-- SET TRANSACTION ISOLATION LEVEL SNAPSHOT; 
-- SET DATEFIRST 7;

-- with [results] as (
--   select top 100000 
--     row_number() over(
--       order by dispatched desc
--     ) as 'row', *
--   from (
--     select
--       [Dim_Incident_One_To_One].[Response_Incident_Number] as 'RP',
--       [Dim_Incident].[Incident_Unit_Notified_By_Dispatch_Date_Time] as dispatched,
--       [Dim_ValidationRules].[Incident_Validation_Rule_ID] as ValidationRuleID,
--       [Dim_ValidationRules].[Incident_Validation_Rule_Notes] as ValidationRuleNotes, 
--       [Fact_Incident].[Incident_Agency_Short_Name] as AgencyShortName, 
--       [Fact_Incident].[Incident_Form_Number] as 'form number'

--     from [Elite_DWPortland].[DwEms].[Fact_Incident] as [Fact_Incident]
--     LEFT JOIN [Elite_DWPortland].[DwEms].[Dim_Incident] as [Dim_Incident] 
--       on [Fact_Incident].[Dim_Incident_FK] = [Dim_Incident].[Dim_Incident_PK]
--     LEFT JOIN [Elite_DWPortland].[DwEms].[Dim_Incident_One_To_One] as [Dim_Incident_One_To_One] 
--       on [Fact_Incident].[Dim_Incident_One_To_One_PK] = [Dim_Incident_One_To_One].[Dim_Incident_One_To_One_PK]
--     LEFT JOIN [Elite_DWPortland].[DwEms].[Bridge_Incident_ValidationRules] as [Bridge_Incident_ValidationRules] 
--       on [Fact_Incident].[Fact_Incident_PK] = [Bridge_Incident_ValidationRules].[Fact_Incident_PK]
--     LEFT JOIN [Elite_DWPortland].[DwEms].[Dim_ValidationRules] as [Dim_ValidationRules] 
--       on [Bridge_Incident_ValidationRules].[Dim_ValidationRules_PK] = [Dim_ValidationRules].[Dim_ValidationRules_PK]
--     where ([Dim_Incident].[Incident_Type] = 'EMS' or [Fact_Incident].[Fact_Incident_PK] is null)
--       and ([Dim_Incident].[Incident_Unit_Notified_By_Dispatch_Date_Time] > {ts '2024-09-01 00:00:00'})
--       and [Dim_ValidationRules].[Incident_Validation_Rule_ID] is not NULL
--   ) innerSelect 
--   where 1=1
-- )
-- select *
-- from [results];