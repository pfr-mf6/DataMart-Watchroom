# How I did it...

Use this to see all tables in the database

```m
let
    Source = Sql.Database("PFBRpt2", "Incident")
in
    Source
```

## Dim_Basic

```m
let
    Source = Sql.Database("PFBRpt2", "Incident"),
    Incidents = Source{[Schema="dbo",Item="Incident"]}[Data],
    SelectedColumns = Table.SelectColumns(Incidents, {"Incident_ID", "IncDate"}),
    RenamedColumns = Table.RenameColumns(SelectedColumns,{
        {"Incident_ID", "Incident_ID_Internal"},
        {"IncDate", "AlarmTime"}
    })
in
    RenamedColumns
```

## Dim_ApparatusResource

```m

let
    Source = Responder,
    SelectColumns = Table.SelectColumns(
        Source,
        {
            "Incident_ID",
            "Responder_ID",
            "Comments"
        }
    ),
    RenamedColumns = Table.RenameColumns(
        SelectColumns,
        {
            {"Incident_ID", "Incident_ID_Internal"},
            {"Comments", "Apparatus_Resource_Narrative"}
        }
    )
in
    RenamedColumns

```