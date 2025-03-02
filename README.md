# 3. Add DateOfBirth to Student - EF

Added DateOfBirth to the Student model. EF automatically detects changes.
Commands used:

```
dotnet ef migrations add AddDateOfBirth
dotnet ef database update
dotnet ef migrations script AddMiddleName AddDateOfBirth -o Scripts/V3__AddDateOfBirth.sql**
```

Again, non-destructive and very straightforward.


