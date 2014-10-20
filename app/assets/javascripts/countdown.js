$( document ).ready(function() {

var dayOfWeek = new Date().getDay();

if (dayOfWeek > 5){
    daysLeft = 6
}
else{
    daysLeft = 5 - dayOfWeek
}

var midnight = new Date();
midnight.setHours( 24 );
midnight.setMinutes( 0 );
midnight.setSeconds( 0 );
midnight.setMilliseconds( 0 );
( midnight.getTime() - new Date().getTime() ) / 1000 / 60;

var timeTillFriday = new Date();
timeTillFriday.setSeconds(0);
timeTillFriday.setMinutes(0);
timeTillFriday.setHours(0);

ts = timeTillFriday.getTime() + (60*60*24*daysLeft*1000)

var today = Date.today
var target_date = new Date(ts);

var days, hours, minutes, seconds;

if (document.getElementById("countdown")){
    var countdown = document.getElementById("countdown");

    setInterval(function () {

        var current_date = new Date().getTime();
        var seconds_left = (target_date - current_date) / 1000;

        days = parseInt(seconds_left / 86400);
        seconds_left = seconds_left % 86400;

        hours = parseInt(seconds_left / 3600);
        seconds_left = seconds_left % 3600;

        minutes = parseInt(seconds_left / 60);
        seconds = parseInt(seconds_left % 60);

        if (days === 0 && hours === 0 && minutes ===0 && seconds === 0){
            window.location = 'activities'
        }
        else{
        countdown.innerHTML = days + "d, " + hours + "h, "
        + minutes + "m, " + seconds + "s";
        }


    }, 1000);

}

});