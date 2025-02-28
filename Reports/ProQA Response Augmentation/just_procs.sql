SELECT
    Dim_Incident_One_To_One.Response_Incident_Number as RP_ems,
    Dim_Procedure.Procedure_Performed_Description AS proc_desc,
    Dim_Procedure.Dim_Procedure_PK as PK,
    Dim_Procedure.Procedure_Successful_Flag as successful

FROM [Elite_DWPortland].[DwEms].[Fact_Incident]

    -- We need all these incidents, so INNER JOIN is appropriate
    INNER JOIN [Elite_DWPortland].[DwEms].[Dim_Incident_One_To_One] 
        ON Fact_Incident.Dim_Incident_One_To_One_PK = Dim_Incident_One_To_One.Dim_Incident_One_To_One_PK

    -- If you only want incidents WITH procedures, use INNER JOIN
    -- If you want ALL incidents even without procedures, use LEFT JOIN
    INNER JOIN [Elite_DWPortland].[DwEms].[Bridge_Incident_Procedure] 
        ON [Fact_Incident].[Fact_Incident_PK] = [Bridge_Incident_Procedure].[Fact_Incident_PK]
    
    -- Since we're using the bridge table, we want INNER JOIN here
    -- (if there's a bridge record, there must be a procedure)
    INNER JOIN [Elite_DWPortland].[DwEms].[Dim_Procedure]
        ON [Bridge_Incident_Procedure].[Dim_Procedure_PK] = [Dim_Procedure].[Dim_Procedure_PK]

WHERE
    Fact_Incident.Incident_Agency_Short_Name = 'portlandfi'
    AND Dim_Incident_One_To_One.Response_Incident_Number IS NOT NULL
    AND Dim_Procedure.Procedure_Performed_Description IS NOT NULL

ORDER BY Response_Incident_Number, PK