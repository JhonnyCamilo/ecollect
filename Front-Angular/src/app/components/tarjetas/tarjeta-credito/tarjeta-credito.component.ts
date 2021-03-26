import { Component, OnInit, OnDestroy } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { TarjetaService } from 'src/app/services/tarjeta.service';
import { TarjetaCredito } from 'src/app/models/tarjetaCredito';
import { ToastrService } from 'ngx-toastr';
import { Subscription } from 'rxjs';

@Component({
  selector: 'app-tarjeta-credito',
  templateUrl: './tarjeta-credito.component.html',
  styleUrls: ['./tarjeta-credito.component.css']
  
})
export class TarjetaCreditoComponent implements OnInit, OnDestroy {
  form: FormGroup;
  suscription: Subscription;
  tarjeta: TarjetaCredito;
  idTarjeta = 0;

  constructor(private formBuilder: FormBuilder, 
              private tarjetaService: TarjetaService,
              private toastr: ToastrService) { 
    this.form = this.formBuilder.group({
      id: 0,
      Titulo: ['', [Validators.required]],
      NumeroPaginas: ['', [Validators.required, ]],
      Autor: ['', [Validators.required, ]],
      Year: ['', [Validators.required, ]],
      Editorial: ['', [Validators.required, ]],
      Genero: ['', [Validators.required, ]]
    })
  }

  ngOnInit(): void {
    this.suscription = this.tarjetaService.obtenerTarjeta$().subscribe(data => {
      console.log(data);
      this.tarjeta = data;
      this.form.patchValue({
        Titulo: this.tarjeta.Titulo,
        NumeroPaginas: this.tarjeta.NumeroPaginas,
        Autor: this.tarjeta.Autor,
        Year: this.tarjeta.Year,
        Editorial: this.tarjeta.Editorial,
        Genero: this.tarjeta.Genero
      });
      this.idTarjeta = this.tarjeta.id;
    });
  }

  ngOnDestroy() {
    this.suscription.unsubscribe();
  }

  guardarTarjeta() {
    if (this.idTarjeta === 0 || this.idTarjeta === undefined) {
      this.agregar();
    } else {
      this.editar();
    }
  }

  agregar() {
    const tarjeta: TarjetaCredito = {
      Titulo: this.form.get('Titulo').value,
      NumeroPaginas: this.form.get('NumeroPaginas').value,
      Autor: this.form.get('Autor').value,
      Year: this.form.get('Year').value,
      Editorial: this.form.get('Editorial').value,
      Genero: this.form.get('Genero').value
    };

    this.tarjetaService.guardarTarjeta(tarjeta).subscribe(data => {
      this.toastr.success('Libro Agregado', 'El libro fue agregado correctamente');
      this.tarjetaService.obtenerTarjetas();
      this.form.reset();
    });
  }


  editar() {
    const tarjeta: TarjetaCredito = {
      id: this.tarjeta.id,
      Titulo: this.form.get('Titulo').value,
      NumeroPaginas: this.form.get('NumeroPaginas').value,
      Autor: this.form.get('Autor').value,
      Year: this.form.get('Año').value,
      Editorial: this.form.get('Editorial').value,
      Genero: this.form.get('Genero').value
    };
    this.tarjetaService.actualizarTarjeta(this.idTarjeta, tarjeta).subscribe(data => {
      this.toastr.info('Libro Actualizado', 'El libro fue actualizado');
      this.tarjetaService.obtenerTarjetas();
      this.form.reset();
      this.idTarjeta = 0;
    });
  }

}
