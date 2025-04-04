﻿using BorilackiKlubAPP.Data;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();


// Dodavanje baze podataka
builder.Services.AddDbContext<BorilackiKlubContext>(
    opcije =>
    {
        opcije.UseSqlServer(builder.Configuration.GetConnectionString("BorilackiKlubContext"));
    }
    );

builder.Services.AddCors(opcije =>
{
    opcije.AddPolicy("CorsPolicy",
        builder =>
            builder.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader()
    );

});


var app = builder.Build();

// Configure the HTTP request pipeline.
//if (app.Environment.IsDevelopment())
//{
    app.UseSwagger();
    app.UseSwaggerUI(opcije =>
    {
        opcije.ConfigObject.AdditionalItems.Add("requestSnippetsEnabled", true);
        opcije.EnableTryItOutByDefault();
    });
//}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.UseStaticFiles();
app.UseDefaultFiles();
app.MapFallbackToFile("index.html");

app.UseCors("CorsPolicy");

app.Run();
