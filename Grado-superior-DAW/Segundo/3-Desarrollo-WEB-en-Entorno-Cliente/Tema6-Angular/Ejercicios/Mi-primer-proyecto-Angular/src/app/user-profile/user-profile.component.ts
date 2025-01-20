import { Component } from '@angular/core';

@Component({
    selector: 'app-user-profile',
    standalone: true,
    imports: [],
    templateUrl: './user-profile.component.html',
    styleUrl: './user-profile.component.css'
})
export class UserProfileComponent {
    name: string = 'Tom Hanks';
    role: string = 'Juan Gabriel';
    titulo: string = 'Components User';
}
