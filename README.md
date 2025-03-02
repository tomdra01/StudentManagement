# StudentManagement

## Compulsory Assignment #1 - Conclusion

After working on both migration approaches in this assignment, I can definitely see the differences.

With Change-Based migrations (EF), everything just works. You update the models, generate the migration, and EF keeps track of everything for you. You get that full history of changes, and it feels really safe to evolve the database step by step without worrying too much.

On the other hand, State-Based migrations are just one big file. You keep updating the same Schema.sql and make sure it always reflects the latest version of the database. It works, but you don’t really have that same clear history of what changed and when, unless you check the Git commits. And destructive changes can easily become a problem if you’re not careful.

I would personally prefer using the Change-Based migrations, because it’s just more structured, easier to manage, and less risky when working on real projects.
