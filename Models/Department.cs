namespace StudentManagement.Models;

public class Department
{
    public int Id { get; set; }
    public string Name { get; set; }
    public decimal Budget { get; set; }
    public DateOnly StartDate { get; set; }
    public int? DepartmentHeadId { get; set; }
}