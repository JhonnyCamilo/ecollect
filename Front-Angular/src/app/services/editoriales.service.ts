import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Editoriales } from '../models/Editoriales';
import { Observable, BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class EditorialesService {
  myAppUrl = 'https://backend20210205143038.azurewebsites.net/';
  myApiUrl = 'api/TarjetaCredito/';
  list: Editoriales[];
  private actualizarFormulario = new BehaviorSubject<Editoriales>({} as any);


  constructor(private http: HttpClient) { }

  guardarTarjeta(tarjeta: Editoriales): Observable<Editoriales> {
    return this.http.post<Editoriales>(this.myAppUrl + this.myApiUrl, tarjeta);
  }

  elimnarTarjeta(id: number): Observable<Editoriales> {
    return this.http.delete<Editoriales>(this.myAppUrl + this.myApiUrl + id);
  }

  obtenerTarjetas() {
    this.http.get(this.myAppUrl + this.myApiUrl).toPromise()
                  .then(data => {
                    this.list = data as Editoriales[];
                  });
  }
  actualizarTarjeta(id: number, tarjeta: Editoriales): Observable<Editoriales>{
      return this.http.put<Editoriales>(this.myAppUrl + this.myApiUrl + id, tarjeta);
  }

  actualizar(tarjeta) {
    this.actualizarFormulario.next(tarjeta);
  }

  obtenerTarjeta$(): Observable<Editoriales>{
    return this.actualizarFormulario.asObservable();
  }
}

