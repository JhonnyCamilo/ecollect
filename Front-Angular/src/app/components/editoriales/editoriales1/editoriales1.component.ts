import { Component, OnInit, OnDestroy } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { Editoriales } from 'src/app/models/Editoriales';
import { EditorialesService } from 'src/app/services/Editoriales.service';
import { ToastrService } from 'ngx-toastr';
import { Subscription } from 'rxjs';

@Component({
  selector: 'app-editoriales1',
  templateUrl: './editoriales1.component.html',
  styleUrls: ['./editoriales1.component.css']
})
export class Editoriales1Component implements OnInit, OnDestroy {

 
  form: FormGroup;
  suscription: Subscription;
  idEditoriales = 0;
  tarjeta: Editoriales;
  
  constructor(private formBuilder: FormBuilder,
              private EditorialesService: EditorialesService,
              private toastr: ToastrService) { 
    this.form = this.formBuilder.group({
      id: 0,
      Nombre: ['', [Validators.required]],
      Direccion: ['', [Validators.required, ]],
      Telefono: ['', [Validators.required, ]],
      Correo: ['', [Validators.required, ]],
      MaxRegistros: ['', [Validators.required, ]],
      })
  }

  

  ngOnInit(): void {
    this.suscription = this.EditorialesService.obtenerTarjeta$().subscribe(data => {
      console.log(data);
      this.tarjeta = data;
      this.form.patchValue({
        Nombre: this.tarjeta.Nombre,
        Direccion: this.tarjeta.Direccion,
        Telefono: this.tarjeta.Telefono,
        Correo: this.tarjeta.Correo,
        MaxRegistros: this.tarjeta.MaxRegistros,
        
      });
      this.idEditoriales = this.tarjeta.id;
    });
  }

  ngOnDestroy() {
    this.suscription.unsubscribe();
  }

  guardarEditoriales() {
    if (this.idEditoriales === 0 || this.idEditoriales === undefined) {
      this.agregar();
    } else {
      this.editar();
    }
  }

  agregar() {
    const tarjeta: Editoriales = {
      Nombre: this.form.get('Nombre').value,
      Direccion: this.form.get('Direccion').value,
      Telefono: this.form.get('Telefono').value,
      Correo: this.form.get('Correo').value,
      MaxRegistros: this.form.get('MaxRegistros').value
      };
      this.EditorialesService.guardarTarjeta(tarjeta).subscribe(data => {
        this.toastr.success('Tarjeta Agregada', 'La Tarjeta fue agregada correctamente');
        this.EditorialesService.obtenerTarjetas();
        this.form.reset();
      });
    }
  
  editar() {
    const tarjeta: Editoriales = {
      id: this.tarjeta.id,
      Nombre: this.form.get('Nombre').value,
      Direccion: this.form.get('Direccion').value,
      Telefono: this.form.get(' Telefono').value,
      Correo: this.form.get('Correo').value,
      MaxRegistros: this.form.get('MaxRegistros').value
      };
      this.EditorialesService.actualizarTarjeta(this.idEditoriales, tarjeta).subscribe(data => {
      this.toastr.info('Editorial Actualizado', 'La Editorial fue actualizada');
      this.EditorialesService.obtenerTarjetas();
      this.form.reset();
      this.idEditoriales = 0
    });
  }
}