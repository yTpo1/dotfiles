Package Manager Console

Adding Packages to a project
---
add "<PackageReference.." to {ProjectName}.csproj file. Save and use command:
> dotnet restore


Entity Framework Core - https://docs.microsoft.com/en-us/ef/core/miscellaneous/cli/powershell
---
add-migration
-name is a required parameter!
Example:
add-migration CreateIdentitySchema
add-migration -name CreateIdentitySchema

update-database 
Example:
update-database -verbose

EF core Scaffolding DbContext
---
command to be run in project directory (where .csproj file is).
dotnet ef dbcontext scaffold "Data Source=PCNAME\MSSQLSERVER01;initial catalog=AdventureWorks2016CTP3;integrated security=true" Microsoft.EntityFrameworkCore.SqlServer -d -c AdventureWorksContext -o EfStructures\Entities --force

EF core cli tools
---
add, to {ProjectName}.csproj file. Save and use command:
> dotnet restore

<ItemGroup>
    <DotNetCliToolReference Include="Microsoft.EntityFrameworkCore.Tools.DotNet" Version="2.0.3" />
</ItemGroup>
