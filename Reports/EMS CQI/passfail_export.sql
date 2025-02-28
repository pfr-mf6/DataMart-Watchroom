/* 9FC886CB-A83D-44FB-B3C0-3FEC33840F41 */ SET TRANSACTION ISOLATION LEVEL SNAPSHOT; SET DATEFIRST 7; 
with [results] as (
select top 100000 row_number() over(
order by [Dim_CQIReviewer___CQI_Reviewer_Full_Name] asc, 
	[Dim_IncidentSupplementalQuestions___QA115] asc, 
	[Dim_EMS_CAD___CAD_Unit_Notified_By_Dispatch_Date_Time] asc
) as 'row', *
from (
select DISTINCT
[Dim_EMS_CAD].[CAD_Unit_Notified_By_Dispatch_Date_Time] as [Dim_EMS_CAD___CAD_Unit_Notified_By_Dispatch_Date_Time], [Dim_EMS_CAD].[CAD_Incident_Number] as [Dim_EMS_CAD___CAD_Incident_Number], [Dim_EMS_CAD].[CAD_Response_EMS_Vehicle_Unit_Number] as [Dim_EMS_CAD___CAD_Response_EMS_Vehicle_Unit_Number], [Dim_Situation].[Situation_Provider_Primary_Impression_Description_Only] as [Dim_Situation___Situation_Provider_Primary_Impression_Description_Only], [Dim_EMS_CAD].[CAD_Unit_Arrived_On_Scene_Date_Time] as [Dim_EMS_CAD___CAD_Unit_Arrived_On_Scene_Date_Time], [Dim_EMS_CAD].[CAD_Unit_Back_In_Service_Date_Time] as [Dim_EMS_CAD___CAD_Unit_Back_In_Service_Date_Time], [Dim_Incident].[Incident_Complaint_Reported_By_Dispatch] as [Dim_Incident___Incident_Complaint_Reported_By_Dispatch], [Dim_CQIReviewer].[CQI_Reviewer_Full_Name] as [Dim_CQIReviewer___CQI_Reviewer_Full_Name], [Dim_CQIReviewerStatusScore].[CQI_Reviewer_Status] as [Dim_CQIReviewerStatusScore___CQI_Reviewer_Status], [Dim_IncidentSupplementalQuestions].[QA115] as [Dim_IncidentSupplementalQuestions___QA115], [Dim_IncidentSupplementalQuestions].[QA143] as [Dim_IncidentSupplementalQuestions___QA143], [Dim_CQISupplementalQuestions].[QA130] as [Dim_CQISupplementalQuestions___QA130], [Dim_CQISupplementalQuestions].[QA234] as [Dim_CQISupplementalQuestions___QA234], [Dim_CQISupplementalQuestions].[QA145] as [Dim_CQISupplementalQuestions___QA145], [Dim_CQISupplementalQuestions].[QA222] as [Dim_CQISupplementalQuestions___QA222], [Dim_CQISupplementalQuestions].[QA202] as [Dim_CQISupplementalQuestions___QA202], [Dim_CQISupplementalQuestions].[QA182] as [Dim_CQISupplementalQuestions___QA182], [Dim_CQISupplementalQuestions].[QA173] as [Dim_CQISupplementalQuestions___QA173], [Dim_CQISupplementalQuestions].[QA172] as [Dim_CQISupplementalQuestions___QA172], [Dim_CQISupplementalQuestions].[QA129] as [Dim_CQISupplementalQuestions___QA129], [Dim_CQICategory].[CQI_Status] as [Dim_CQICategory___CQI_Status], [Dim_CQICategory].[CQI_Name] as [Dim_CQICategory___CQI_Name], [Fact_Incident].[Incident_Agency_Short_Name] as [param__Fact_Incident___Incident_Agency_Short_Name], [Fact_Incident].[Incident_Transaction_GUID_Internal] as [param__Fact_Incident___Incident_Transaction_GUID_Internal], [Fact_Incident].[Incident_Form_Number] as [param__Fact_Incident___Incident_Form_Number]
from [DwEms].[Fact_Incident]
LEFT join [DwEms].[Dim_Incident] as [Dim_Incident] on [Fact_Incident].[Dim_Incident_FK] = [Dim_Incident].[Dim_Incident_PK]
LEFT join [DwEms].[Dim_Situation] as [Dim_Situation] on [Fact_Incident].[Dim_Situation_FK] = [Dim_Situation].[Dim_Situation_PK]
LEFT join [DwEms].[Dim_Permission_AllAgency] as [Dim_Permission_AllAgency] on [Fact_Incident].[Dim_Agency_FK] = [Dim_Permission_AllAgency].[Dim_Agency_PK] and Dim_Permission_AllAgency.Performer_ID_Internal = 'b6595115-ba56-eb11-a962-001dd8b7240e'
LEFT join [DwEms].[Dim_Permission_MyEMS] as [Dim_Permission_MyEMS] on [Fact_Incident].[Fact_Incident_PK] = [Dim_Permission_MyEMS].[Fact_Incident_PK] and Dim_Permission_MyEMS.Performer_ID_Internal = 'b6595115-ba56-eb11-a962-001dd8b7240e'
FULL join [DwEms].[Dim_EMS_CAD] as [Dim_EMS_CAD] on [Fact_Incident].[CAD_ID_FK] = [Dim_EMS_CAD].[Dim_CAD_PK]
LEFT join [DwEms].[Dim_IncidentSupplementalQuestions] as [Dim_IncidentSupplementalQuestions] on [Fact_Incident].[Incident_Transaction_GUID_Internal] = [Dim_IncidentSupplementalQuestions].[Incident_ID_Internal]
LEFT join [DwEms].[Dim_CQICategory] as [Dim_CQICategory] on [Fact_Incident].[Fact_Incident_PK] = [Dim_CQICategory].[Fact_Incident_FK]
LEFT join [DwEms].[Dim_CQISupplementalQuestions] as [Dim_CQISupplementalQuestions] on [Fact_Incident].[Fact_Incident_PK] = [Dim_CQISupplementalQuestions].[Fact_Incident_FK] AND [Dim_CQISupplementalQuestions].[Category_ID_Internal] = [Dim_CQICategory].[CQI_Category_ID_Internal]
LEFT join [DwEms].[Dim_Permission_EliteViewer_City] as [Dim_Permission_EliteViewer_City] on [Fact_Incident].[Incident_Elite_Viewer_City_GNIS] = [Dim_Permission_EliteViewer_City].[City_GNIS] and Dim_Permission_EliteViewer_City.Performer_ID_Internal = 'b6595115-ba56-eb11-a962-001dd8b7240e'
LEFT join [DwEms].[Dim_Permission_EliteViewer_Facility] as [Dim_Permission_EliteViewer_Facility] on [Fact_Incident].[Incident_Elite_Viewer_Facility_ID_Internal] = [Dim_Permission_EliteViewer_Facility].[Facility_ID_Internal] and Dim_Permission_EliteViewer_Facility.Performer_ID_Internal = 'b6595115-ba56-eb11-a962-001dd8b7240e'
LEFT join [DwEms].[Dim_Permission_EliteViewer_County] as [Dim_Permission_EliteViewer_County] on [Fact_Incident].[Incident_Elite_Viewer_State_County_GNIS] = [Dim_Permission_EliteViewer_County].[State_County_GNIS] and Dim_Permission_EliteViewer_County.Performer_ID_Internal = 'b6595115-ba56-eb11-a962-001dd8b7240e'
LEFT join [DwEms].[Dim_CQIReviewer] as [Dim_CQIReviewer] on [Dim_CQISupplementalQuestions].[Dim_CQIReviewer_FK] = [Dim_CQIReviewer].[Dim_CQIReviewer_PK]
LEFT join [DwEms].[Dim_CQIReviewerStatusScore] as [Dim_CQIReviewerStatusScore] on [Fact_Incident].[Incident_Transaction_GUID_Internal] = [Dim_CQIReviewerStatusScore].[Incident_ID_Internal]
LEFT join [DwEms].[Dim_Permission_EliteViewer_AreasOfOperation] as [Dim_Permission_EliteViewer_AreasOfOperation] on [Fact_Incident].[AreaOfOperation_ID] = [Dim_Permission_EliteViewer_AreasOfOperation].[AreaOfOperation_ID] and Dim_Permission_EliteViewer_AreasOfOperation.Performer_ID_Internal = 'b6595115-ba56-eb11-a962-001dd8b7240e'
  where (Dim_Permission_AllAgency.Performer_ID_Internal is not null or Dim_Permission_MyEMS.Performer_ID_Internal is not null or Dim_Permission_EliteViewer_City.Performer_ID_Internal is not null or Dim_Permission_EliteViewer_County.Performer_ID_Internal is not null or Dim_Permission_EliteViewer_Facility.Performer_ID_Internal is not null or Dim_Permission_EliteViewer_AreasOfOperation.Performer_ID_Internal is not null or Fact_Incident.Incident_Transaction_GUID_Internal is null ) and (Dim_Incident.Incident_Type = 'EMS' or [Fact_Incident].[Fact_Incident_PK] is null)
and (
(  [Dim_CQISupplementalQuestions].[QA130] like '%yes%'
or   [Dim_CQISupplementalQuestions].[QA222] = 'Yes'
or   [Dim_CQISupplementalQuestions].[QA145] = 'Yes'
or   [Dim_CQISupplementalQuestions].[QA202] = 'yes'
or   [Dim_IncidentSupplementalQuestions].[QA115] = 'Yes'
or   [Dim_CQISupplementalQuestions].[QA182] = 'Yes'
or   [Dim_CQISupplementalQuestions].[QA173] = 'Yes'
or   [Dim_CQISupplementalQuestions].[QA172] = 'Yes'
or   [Dim_CQISupplementalQuestions].[QA129] = 'Yes')
and   ([Dim_Incident].[Incident_First_Posted_Date_Time] between ({ts '2024-12-19 00:00:00'}) and ({ts '2025-01-02 23:59:59'}))
and   ([Dim_EMS_CAD].[CAD_Response_EMS_Vehicle_Unit_Number] <> 'CHAT1' and [Dim_EMS_CAD].[CAD_Response_EMS_Vehicle_Unit_Number] <> 'CHAT2' and [Dim_EMS_CAD].[CAD_Response_EMS_Vehicle_Unit_Number] <> 'CHAT3' and [Dim_EMS_CAD].[CAD_Response_EMS_Vehicle_Unit_Number] <> 'CHAT4' and [Dim_EMS_CAD].[CAD_Response_EMS_Vehicle_Unit_Number] <> 'PSR1' and [Dim_EMS_CAD].[CAD_Response_EMS_Vehicle_Unit_Number] <> 'PSR2' and [Dim_EMS_CAD].[CAD_Response_EMS_Vehicle_Unit_Number] <> 'PSR3' and [Dim_EMS_CAD].[CAD_Response_EMS_Vehicle_Unit_Number] <> 'PSR4' and [Dim_EMS_CAD].[CAD_Response_EMS_Vehicle_Unit_Number] <> 'PSR5' and [Dim_EMS_CAD].[CAD_Response_EMS_Vehicle_Unit_Number] <> 'PSR6' and [Dim_EMS_CAD].[CAD_Response_EMS_Vehicle_Unit_Number] <> 'PSR90'))
) innerSelect where 1=1   )
select *
from [results]