using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;

namespace StudentManagement;

class Program
{
    static void Main()
    {
        var serviceProvider = new ServiceCollection()
            .AddDbContext<AppDbContext>(options =>
                options.UseInMemoryDatabase("StudentManagementDB"))
            .BuildServiceProvider();

        using var context = serviceProvider.GetRequiredService<AppDbContext>();
    }
}