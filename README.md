# 5. Rename Grade to FinalGrade in Enrollment - EF

Renamed the Grade column to FinalGrade.
Commands used:

```
dotnet ef migrations add RenameGradeToFinalGrade
dotnet ef database update
dotnet ef migrations script AddInstructor RenameGradeToFinalGrade -o Scripts/V5__RenameGradeToFinalGrade.sql
```

This can be destructive, depending on the DB, but EF handled the rename without data loss here.
