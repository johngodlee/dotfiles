// Get the current date and time as separate objects

setInterval(function(){
n = new Date();
y = n.getFullYear();
m = ("0" + (n.getMonth() + 1)).slice(-2);
d = ("0" + n.getDate()).slice(-2);
hh = n.getHours();
mm = ("0" + (n.getMinutes() + 1)).slice(-2);
ss = ("0" + (n.getSeconds() + 1)).slice(-2);

document.getElementById("date").innerHTML = y + "_" + m + "_" + d;
document.getElementById("time").innerHTML = hh + ":" + mm + ":" + ss;
}, 900);

