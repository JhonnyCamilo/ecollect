import { Component, OnInit } from '@angular/core';
import { EditorialesService } from 'src/app/services/Editoriales.service';
import { ToastrService } from 'ngx-toastr';


@Component({
  selector: 'app-lista-editoriales',
  templateUrl: './lista-editoriales.component.html',
  styleUrls: ['./lista-editoriales.component.css']
})
export class ListaEditorialesComponent implements OnInit {

  constructor(public tarjetaService: EditorialesService, 
    public toastr: ToastrService) { }

  ngOnInit(): void {
    this.tarjetaService.obtenerTarjetas();
  }

  eliminarTarjeta(id: number){
    if (confirm('Esta seguro que desea elimnar la Tarjeta?')) {
      this.tarjetaService.elimnarTarjeta(id).subscribe(data => {
        this.toastr.warning('Tarjeta eliminada', 'la Tarjeta fue eliminada');
        this.tarjetaService.obtenerTarjetas();
      });
    }
  }

  editar(tarjeta) {
    this.tarjetaService.actualizar(tarjeta);
  }

}
