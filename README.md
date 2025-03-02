# 1. Initial Schema - EF

Here I generated the first migration with EF Core to create the base tables (Students, Courses, Enrollments).
Commands used:

'
dotnet ef migrations add InitialSchema
dotnet ef database update
dotnet ef migrations script --idempotent -o Scripts/V1__InitialSchema.sql
'

EF created all tables, primary keys, and foreign keys.
