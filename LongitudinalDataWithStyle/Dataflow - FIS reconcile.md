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

    // Ensure we append 'FIS' to the Incident_ID_Internal
    RenamedColumns = Table.RenameColumns(
        SelectColumns,
        {{"Incident_ID", "Incident_ID_Internal"}}
    ),

    AddPrefix = Table.TransformColumns(
        RenamedColumns,
        {{"Incident_ID_Internal", each 6969000000 + _, type number}}
    ),

    // Mark these entries with 
    AddDataSource = Table.AddColumn(
        AddPrefix, 
        "DataSource", 
        each "FIS", 
        type text
    )
in
    AddDataSource

```


## Dim_Basic

```m

let
    Source = Incident,

    SelectColumns = Table.SelectColumns(
        Source,
        {"Incident_ID", "IncDate"}
    ),

    RenamedColumns = Table.RenameColumns(
        SelectColumns,
        {
            {"Incident_ID", "Incident_ID_Internal"},
            {"IncDate", "AlarmDateTime"}
        }
    ),

    // NOTE: We cannot append a string... this will cause an error
    // We instead append '6969' to the Incident_ID_Internal
    AddPrefix = Table.TransformColumns(
        RenamedColumns,
        {{"Incident_ID_Internal", each 6969000000 + _, type number}}
    )

in
    AddPrefix

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

    RenamedColumns = Table.RenameColumns(
        SelectColumns,
        {
            {"Incident_ID", "Incident_ID_Internal"},
            {"Comments", "Apparatus_Resource_Narrative"}
        }
    ),

    AddPrefix = Table.TransformColumns(
        RenamedColumns,
        {{"Incident_ID_Internal", each 6969000000 + _, type number}}
    )

    // Merge with ResponderUnit table
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