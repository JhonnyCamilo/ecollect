using Microsoft.EntityFrameworkCore.Migrations;

namespace BackEnd.Migrations
{
    public partial class Inicial : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "TarjetaCredito",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Nombre = table.Column<string>(type: "varchar(100)", nullable: false),
                    Direccion = table.Column<string>(type: "varchar(100)", nullable: false),
                    Telefono = table.Column<string>(type: "varchar(100)", nullable: false),
                    Correo = table.Column<string>(type: "varchar(100)", nullable: false),
                    MaxRegistros = table.Column<string>(type: "varchar(100)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_TarjetaCredito", x => x.Id);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "TarjetaCredito");
        }
    }
}
