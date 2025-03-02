# How I did it...

Use this to see all tables in the database

```m
let
    Source = Sql.Database("PFBRpt2", "Incident")
in
    Source
```

## Fact_Fire

```m

let
    Source = Incident,

    SelectColumns = Table.SelectColumns(
        Source,
        {"Incident_ID"}
    ),

    // Rename to match ITE conventions
    RenamedColumns = Table.RenameColumns(
        SelectColumns,
        {{"Incident_ID", "Incident_ID_Internal"}}
    ),

    // Add 6969 to avoid "collisions" and to ensure each dataset has unique IDs
    // NOTE: very important to ensure Int64 typecast
    AddPrefix = Table.TransformColumns(
        RenamedColumns,
        {{"Incident_ID_Internal", each Number.FromText(Text.From(6969000000 + _)), Int64.Type}}
    ),

    // Add the DataSource column
    AddDataSource = Table.AddColumn(
        AddPrefix, 
        "DataSource", 
        each "FIS", 
        type text
    ),

    AddShortname = Table.AddColumn(
        AddDataSource, 
        "Agency_Shortname", 
        each "FIS", 
        type text
    )

in
    AddShortname

```


## Dim_Basic

```m

let
    Source = Incident,
    SelectColumns = Table.SelectColumns(
        Source,
        {"Incident_ID", "IncDate"}
    ),

    // Rename to match ITE conventions
    RenamedColumns = Table.RenameColumns(
        SelectColumns,
        {
            {"Incident_ID", "Incident_ID_Internal"},
            {"IncDate", "Basic_Incident_Alarm_Time"}
        }
    ),

    // Add 6969 to avoid "collisions" and to ensure each dataset has unique IDs
    // NOTE: very important to ensure Int64 typecast
    AddPrefix = Table.TransformColumns(
        RenamedColumns,
        {{"Incident_ID_Internal", each Number.FromText(Text.From(6969000000 + _)), Int64.Type}}
    ),

    // Add dummy data
    AddIncidentNumber = Table.AddColumn(
        AddPrefix, 
        "Basic_Incident_Number", 
        each "RP__-______",
        type text
    )

in
    AddIncidentNumber

```

## Dim_ApparatusResources

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

    // Rename to match ITE conventions
    RenamedColumns = Table.RenameColumns(
        SelectColumns,
        {
            {"Incident_ID", "Incident_ID_Internal"},
            {"Comments", "Apparatus_Resource_Narrative"}
        }
    ),

    // Add 6969 to avoid "collisions" and to ensure each dataset has unique IDs
    // NOTE: very important to ensure Int64 typecast
    AddPrefix = Table.TransformColumns(
        RenamedColumns,
        {{"Incident_ID_Internal", each Number.FromText(Text.From(6969000000 + _)), Int64.Type}}
    ),

    // Use ResponderUnit_ID lookup table to get unit names
    MergedWithResponder = Table.NestedJoin(
        AddPrefix,
        {"Responder_ID"},
        ResponderUnit,
        {"ResponderUnit_ID"},
        "ResponderUnit",
        JoinKind.LeftOuter
    ),

    // Expand to get just the Description
    ExpandedResponder = Table.ExpandTableColumn(
        MergedWithResponder,
        "ResponderUnit",
        {"Description"},
        {"Apparatus_Resource"}
    ),

    // Clean up the Description field (remove extra spaces)
    CleanDescription = Table.TransformColumns(
        ExpandedResponder,
        {{"Apparatus_Resource", Text.Trim, type text}}
    ),

    // Remove the original Responder_ID if you don't need it
    RemoveResponderID = Table.RemoveColumns(
        CleanDescription,
        {"Responder_ID"}
    )
in
    RemoveResponderID

```