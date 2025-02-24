using DotNetEnv;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;

namespace StudentManagement;

class Program
{
    static void Main()
    {
        Env.Load();
        
        var serviceProvider = new ServiceCollection()
            .AddDbContext<AppDbContext>(options =>
                options.UseMySql(Env.GetString("CONNECTION_STRING"), 
                    ServerVersion.AutoDetect(Env.GetString("CONNECTION_STRING"))))
            .BuildServiceProvider();
        
        using var context = serviceProvider.GetRequiredService<AppDbContext>();
        Console.WriteLine("Connected to MySQL successfully!");
    }
}