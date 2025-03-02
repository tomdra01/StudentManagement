# 6. Add Department relation - EF

Created the Department entity and added a foreign key to Instructor.
Commands used:

```
dotnet ef migrations add AddDepartment
dotnet ef database update
dotnet ef migrations script RenameGradeToFinalGrade AddDepartment -o Scripts/V6__AddDepartment.sql
```

This was non-destructive, just adding new stuff.
