# 7. Modify the Course Credits relation

So EF by default would generate a migration with destructive approach. This means it would change int to decimal(65,30) where we could lost some already existing data in the table.

![Snímka obrazovky 2025-02-25 o 22 10 17](https://github.com/user-attachments/assets/fabee4e5-133e-430b-afed-57b568f048aa)

Thats why I decided to use non-destructive approach and after creating a migration file, editing the default decimal(65,30) to decimal(5,2). This way we wont have any data loss.
