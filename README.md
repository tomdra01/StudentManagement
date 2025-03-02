# 2. Add MiddleName to Student - EF

Added a new MiddleName column to the Students table. EF automatically detected the changes in our model.
Commands used:

```
dotnet ef migrations add AddMiddleName
dotnet ef database update
dotnet ef migrations script AddInitialSchema AddMiddleName -o Scripts/V2__AddMiddleName.sql
```

EF handled it as non-destructive.
