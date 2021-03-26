import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Editoriales1Component } from './editoriales1.component';

describe('Editoriales1Component', () => {
  let component: Editoriales1Component;
  let fixture: ComponentFixture<Editoriales1Component>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Editoriales1Component ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Editoriales1Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
