import { Component, OnInit, OnChanges } from '@angular/core';
import { Router } from '@angular/router';
import { AuthenticationService } from '../../service/authentication.service';
import { ActivityService } from '../../service/activity.service';
import { InMemoryDataService } from '../../service/in-memory-data.service';
import { FollowUsersService } from '../../service/follow-users.service';
import { Activity } from '../../model/activity';
import { UserService } from '../../service/user.service';
import { CookieService } from 'angular2-cookie/core';
declare var swal: any;

@Component({
  selector: 'profile',
  templateUrl: 'profile.component.html',
  styleUrls: ['profile.component.css']
})


export class ProfileComponent implements OnInit, OnChanges {

  canEdit = false
  listactivity = []

  constructor(
    private router: Router,
    private auth: AuthenticationService,
    private activityservice: ActivityService,
    private userservice: UserService,
    private data: InMemoryDataService,
    private cookie: CookieService,
    private followUserService: FollowUsersService) {
      this.followUserService.followUsers('click link /profile');
    }

  private initialize() {
    if (this.cookie.get("id") == null) {
      this.auth.pleaselogin()
    } else {
      this.LoadData()
    }
  }

  LoadData() {
    let username = this.data.user.username
    this.activityservice.getAllActivityByUserName(username).subscribe((listactivity: Activity[]) => {
      this.listactivity = listactivity
    }, error => {
      console.log(error);
    });
  }


  ngOnInit(): void {
    this.initialize()
  }

  ngOnChanges() {
    this.initialize()
  }


  clickdetail(s: string) {
    document.documentElement.scrollTop = 0
    document.body.scrollTop = 0
    if (s === 'feedback')
      this.router.navigate(['/feedback'])
    else if (s === 'register') {
      this.router.navigate(['/profile'])
    } else
      this.router.navigate(['/room-details', s])
  }

  viewcontent(content: string) {
    swal(content)
  }

  // viewServiceDetails(name: string) {
  //   document.documentElement.scrollTop = 0
  //   document.body.scrollTop = 0
  //   this.router.navigate(['/hotel-services', name])
  // }

  editInfo() {
    this.canEdit = true
  }

  saveInfo(name: string, phone: string, address: string) {
    this.canEdit = false
    if (name === null || name === '' || phone === null || phone === '' || address === null || address === '')
      swal("Oops...", "Please input all your information!", "error")
    else {
      let user = this.data.user
      user.name = name
      user.phone = phone
      user.address = address
      this.userservice.editUser(user).subscribe(
        responsse => {
          if (responsse) {
            swal('Congrats!', 'Edit information successfully!', 'success')
          }
        }, err => this.showErr(err)
      )
    }

  }

  changepassword(currentpass: string, newpass: string, confirmpass: string) {

  }

  showErr(err: string) {
    swal("Oops...", "Sorry. Something go wrong!", "error")
    console.log(err)
  }
}
