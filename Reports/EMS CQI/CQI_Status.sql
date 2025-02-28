/* 7A83F0CA-6A29-4B84-8656-B6184850375C */ SET TRANSACTION ISOLATION LEVEL SNAPSHOT; SET DATEFIRST 7; 
with [results] as (
select top 100000 row_number() over(
order by [Dim_CQICategory___CQI_Status] asc
) as 'row', *
from (
select DISTINCT
[Dim_Incident].[Incident_Crew_Member_Name_Completing_This_Report] as [Dim_Incident___Incident_Crew_Member_Name_Completing_This_Report], [Dim_Incident].[Incident_Unit_Notified_By_Dispatch_Date_Time] as [Dim_Incident___Incident_Unit_Notified_By_Dispatch_Date_Time], [Dim_EMS_CAD].[CAD_Incident_Number] as [Dim_EMS_CAD___CAD_Incident_Number], [Dim_ValidationRules].[Incident_Validation_Rule_Schematron_Export_Error_Level] as [Dim_ValidationRules___Incident_Validation_Rule_Schematron_Export_Error_Level], [Dim_CQICategory].[CQI_Status] as [Dim_CQICategory___CQI_Status], [Dim_Incident].[Incident_Status] as [Dim_Incident___Incident_Status], [Dim_Situation].[Situation_Provider_Primary_Impression_Description_Only] as [Dim_Situation___Situation_Provider_Primary_Impression_Description_Only], [Fact_Incident].[Incident_Agency_Short_Name] as [param__Fact_Incident___Incident_Agency_Short_Name], [Fact_Incident].[Incident_Transaction_GUID_Internal] as [param__Fact_Incident___Incident_Transaction_GUID_Internal], [Fact_Incident].[Incident_Form_Number] as [param__Fact_Incident___Incident_Form_Number]
from [DwEms].[Fact_Incident]
LEFT join [DwEms].[Dim_Incident] as [Dim_Incident] on [Fact_Incident].[Dim_Incident_FK] = [Dim_Incident].[Dim_Incident_PK]
LEFT join [DwEms].[Dim_Agency] as [Dim_Agency] on [Fact_Incident].[Dim_Agency_FK] = [Dim_Agency].[Dim_Agency_PK]
LEFT join [DwEms].[Dim_Situation] as [Dim_Situation] on [Fact_Incident].[Dim_Situation_FK] = [Dim_Situation].[Dim_Situation_PK]
LEFT join [DwEms].[Dim_Permission_AllAgency] as [Dim_Permission_AllAgency] on [Fact_Incident].[Dim_Agency_FK] = [Dim_Permission_AllAgency].[Dim_Agency_PK] and Dim_Permission_AllAgency.Performer_ID_Internal = 'b6595115-ba56-eb11-a962-001dd8b7240e'
LEFT join [DwEms].[Dim_Permission_MyEMS] as [Dim_Permission_MyEMS] on [Fact_Incident].[Fact_Incident_PK] = [Dim_Permission_MyEMS].[Fact_Incident_PK] and Dim_Permission_MyEMS.Performer_ID_Internal = 'b6595115-ba56-eb11-a962-001dd8b7240e'
FULL join [DwEms].[Dim_EMS_CAD] as [Dim_EMS_CAD] on [Fact_Incident].[CAD_ID_FK] = [Dim_EMS_CAD].[Dim_CAD_PK]
LEFT join [DwEms].[Bridge_Incident_ValidationRules] as [Bridge_Incident_ValidationRules] on [Fact_Incident].[Fact_Incident_PK] = [Bridge_Incident_ValidationRules].[Fact_Incident_PK]
LEFT join [DwEms].[Dim_ValidationRules] as [Dim_ValidationRules] on [Bridge_Incident_ValidationRules].[Dim_ValidationRules_PK] = [Dim_ValidationRules].[Dim_ValidationRules_PK]
LEFT join [DwEms].[Dim_CQICategory] as [Dim_CQICategory] on [Fact_Incident].[Fact_Incident_PK] = [Dim_CQICategory].[Fact_Incident_FK]
LEFT join [DwEms].[Dim_Permission_EliteViewer_City] as [Dim_Permission_EliteViewer_City] on [Fact_Incident].[Incident_Elite_Viewer_City_GNIS] = [Dim_Permission_EliteViewer_City].[City_GNIS] and Dim_Permission_EliteViewer_City.Performer_ID_Internal = 'b6595115-ba56-eb11-a962-001dd8b7240e'
LEFT join [DwEms].[Dim_Permission_EliteViewer_Facility] as [Dim_Permission_EliteViewer_Facility] on [Fact_Incident].[Incident_Elite_Viewer_Facility_ID_Internal] = [Dim_Permission_EliteViewer_Facility].[Facility_ID_Internal] and Dim_Permission_EliteViewer_Facility.Performer_ID_Internal = 'b6595115-ba56-eb11-a962-001dd8b7240e'
LEFT join [DwEms].[Dim_Permission_EliteViewer_County] as [Dim_Permission_EliteViewer_County] on [Fact_Incident].[Incident_Elite_Viewer_State_County_GNIS] = [Dim_Permission_EliteViewer_County].[State_County_GNIS] and Dim_Permission_EliteViewer_County.Performer_ID_Internal = 'b6595115-ba56-eb11-a962-001dd8b7240e'
LEFT join [DwEms].[Dim_Permission_EliteViewer_AreasOfOperation] as [Dim_Permission_EliteViewer_AreasOfOperation] on [Fact_Incident].[AreaOfOperation_ID] = [Dim_Permission_EliteViewer_AreasOfOperation].[AreaOfOperation_ID] and Dim_Permission_EliteViewer_AreasOfOperation.Performer_ID_Internal = 'b6595115-ba56-eb11-a962-001dd8b7240e'
  where (Dim_Permission_AllAgency.Performer_ID_Internal is not null or Dim_Permission_MyEMS.Performer_ID_Internal is not null or Dim_Permission_EliteViewer_City.Performer_ID_Internal is not null or Dim_Permission_EliteViewer_County.Performer_ID_Internal is not null or Dim_Permission_EliteViewer_Facility.Performer_ID_Internal is not null or Dim_Permission_EliteViewer_AreasOfOperation.Performer_ID_Internal is not null or Fact_Incident.Incident_Transaction_GUID_Internal is null ) and (Dim_Incident.Incident_Type = 'EMS' or [Fact_Incident].[Fact_Incident_PK] is null)
and (
[Dim_Incident].[Incident_Status] = 'Needs Crew Attention'
and   ([Dim_EMS_CAD].[CAD_Response_EMS_Unit_Call_Sign] <> 'CHAT1' and [Dim_EMS_CAD].[CAD_Response_EMS_Unit_Call_Sign] <> 'CHAT1' and [Dim_EMS_CAD].[CAD_Response_EMS_Unit_Call_Sign] <> 'CHAT2' and [Dim_EMS_CAD].[CAD_Response_EMS_Unit_Call_Sign] <> 'CHAT3' and [Dim_EMS_CAD].[CAD_Response_EMS_Unit_Call_Sign] <> 'CHAT4' and [Dim_EMS_CAD].[CAD_Response_EMS_Unit_Call_Sign] <> 'CHAT5' and [Dim_EMS_CAD].[CAD_Response_EMS_Unit_Call_Sign] <> 'PSR1' and [Dim_EMS_CAD].[CAD_Response_EMS_Unit_Call_Sign] <> 'PSR1' and [Dim_EMS_CAD].[CAD_Response_EMS_Unit_Call_Sign] <> 'PSR2' and [Dim_EMS_CAD].[CAD_Response_EMS_Unit_Call_Sign] <> 'PSR3' and [Dim_EMS_CAD].[CAD_Response_EMS_Unit_Call_Sign] <> 'PSR4' and [Dim_EMS_CAD].[CAD_Response_EMS_Unit_Call_Sign] <> 'PSR5' and [Dim_EMS_CAD].[CAD_Response_EMS_Unit_Call_Sign] <> 'PSR6' and [Dim_EMS_CAD].[CAD_Response_EMS_Unit_Call_Sign] <> 'PSR90')
and   [Dim_Agency].[Agency_Name] = 'Portland Fire & Rescue - EMS'
and   [Dim_Incident].[Incident_Unit_Notified_By_Dispatch_Date_Time] > {ts '2022-08-01 23:59:59'})
) innerSelect where 1=1   )
select *
from [results]