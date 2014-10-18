$( document ).ready(function() {
// set the date we're counting down to

var dayOfWeek = new Date().getDay();

if (dayOfWeek > 5){
    daysLeft = 6
}
else{
    daysLeft = 5 - dayOfWeek
}

var ts = (new Date()).getTime() + 60*60*24*daysLeft*1000

var today = Date.today
var target_date = new Date(ts);

// variables for time units
var days, hours, minutes, seconds;



// get tag element
if (document.getElementById("countdown")){
    var countdown = document.getElementById("countdown");

    // update the tag with id "countdown" every 1 second
    setInterval(function () {

        // find the amount of "seconds" between now and target
        var current_date = new Date().getTime();
        var seconds_left = (target_date - current_date) / 1000;

        // do some time calculations
        days = parseInt(seconds_left / 86400);
        seconds_left = seconds_left % 86400;

        hours = parseInt(seconds_left / 3600);
        seconds_left = seconds_left % 3600;

        minutes = parseInt(seconds_left / 60);
        seconds = parseInt(seconds_left % 60);

        // format countdown string + set tag value
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