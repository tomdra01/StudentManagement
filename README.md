# 4. Add Instructor relation - EF

Created the Instructor entity and added the InstructorId foreign key to the Course.
Commands used:

```
dotnet ef migrations add AddInstructor
dotnet ef database update
dotnet ef migrations script AddDateOfBirth AddInstructor -o Scripts/V4__AddInstructor.sql
```

Nothing was removed or changed, so non-destructive.
