$( document ).ready(function() {

var dayOfWeek = new Date().getDay();

if (dayOfWeek > 6){
    daysLeft = 6 - dayOfWeek
}
else{
    daysLeft = 6 - dayOfWeek
}

var timeTillFriday = new Date();
timeTillFriday.setSeconds(0);
timeTillFriday.setMinutes(0);
timeTillFriday.setHours(10);

ts = timeTillFriday.getTime() + (60*60*24*daysLeft*1000)

var today = Date.today
var target_date = new Date(ts);

var days, hours, minutes, seconds;

if (document.getElementById("saturday_countdown")){
    var countdown = document.getElementById("saturday_countdown");

    setInterval(function () {

        var current_date = new Date().getTime();
        var seconds_left = (target_date - current_date) / 1000;

        days = parseInt(seconds_left / 86400);
        days = "0" + days
        seconds_left = seconds_left % 86400;

        hours = parseInt(seconds_left / 3600);
        if (hours.toString().length === 1)
        { hours = "0" + hours }
        seconds_left = seconds_left % 3600;

        minutes = parseInt(seconds_left / 60);
        if (minutes.toString().length === 1)
        { minutes = "0" + minutes }

        seconds = parseInt(seconds_left % 60);
        if (seconds.toString().length === 1)
        { seconds = "0" + seconds }

        if (days === 0 && hours === 0 && minutes ===0 && seconds === 0){
            window.location = 'activities'
        }
        else{
        countdown.innerHTML = days + ":" + hours + ":"
        + minutes + ":" + seconds;
        }


    }, 1000);

}

});