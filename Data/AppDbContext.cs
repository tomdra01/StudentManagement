using DotNetEnv;
using Microsoft.EntityFrameworkCore;
using StudentManagement.Models;

public class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

    public DbSet<Student> Students { get; set; }
    public DbSet<Course> Courses { get; set; }
    public DbSet<Enrollment> Enrollments { get; set; }
    public DbSet<Instructor> Instructors { get; set; }
    public DbSet<Department> Departments { get; set; }
    
    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        if (!optionsBuilder.IsConfigured)
        {
            Env.Load();
            
            var connectionString = Env.GetString("CONNECTION_STRING");
            optionsBuilder.UseMySql(connectionString, ServerVersion.AutoDetect(connectionString));
        }
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Enrollment>()
            .HasOne<Student>()
            .WithMany()
            .HasForeignKey(e => e.StudentId);

        modelBuilder.Entity<Enrollment>()
            .HasOne<Course>()
            .WithMany()
            .HasForeignKey(e => e.CourseId);
        
        modelBuilder.Entity<Course>()
            .HasOne<Instructor>()
            .WithMany()
            .HasForeignKey(c => c.InstructorId);
        
        modelBuilder.Entity<Department>()
            .HasOne<Instructor>()
            .WithMany()
            .HasForeignKey(d => d.DepartmentHeadId);
    }
}