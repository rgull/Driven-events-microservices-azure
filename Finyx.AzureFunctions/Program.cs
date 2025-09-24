using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Configuration;


var host = new HostBuilder()
    .ConfigureFunctionsWorkerDefaults()
    .ConfigureServices((context, services) =>
    {
        // Configuration
        services.AddSingleton<IConfiguration>(context.Configuration);
        
        //// Core Services
        //services.AddScoped<IUserService, UserService>();
        //services.AddScoped<IDocumentService, DocumentService>();
        //services.AddScoped<IReportingService, ReportingService>();
        
        //// Repositories
        //services.AddScoped<IUserRepository, UserRepository>();
        //services.AddScoped<IDocumentRepository, DocumentRepository>();
        //services.AddScoped<IReportingRepository, ReportingRepository>();
        
        //// Event Services
        //services.AddScoped<IEventPublisher, EventPublisher>();
        //services.AddScoped<IEventSubscriber, EventSubscriber>();
        
        // Authentication
        services.AddAuthentication();
        services.AddAuthorization();
    })
    .Build();

host.Run();
