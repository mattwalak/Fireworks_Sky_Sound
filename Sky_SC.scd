"ifconfig | grep 'inet '".unixCmd;

n = NetAddr("127.0.0.1", 57120); // You would typically supply your phone or alternate language here, but it's not necessary unless you want responders receiving from different servers.

NetAddr.langPort;  // **should** be 57120. *or 21*

// Turns the trace on and dumps all incoming OSC messages.
OSCFunc.trace(bool: true, hideStatusMsg: true);  // I don't need no stinkin' status messages!


(
var fund = 50;

OSCdef(\highNote, {|msg|
	x = {
		var sig, env;
		env = XLine.kr(1, 0.01, 1, doneAction: 2);
		sig = SinOsc.ar(fund * rrand(22, 60) + rrand(0.0, 50.0)) * 0.1 * env;
	}.play;
}, '/highNote');

OSCdef(\melodyNote, {|msg|
	x = {
		var sig, env;
		env = XLine.kr(1, 0.01, 1, doneAction: 2);
		sig = Pulse.ar(fund * rrand(8, 20)) * 0.1 * env;
	}.play;
}, '/melodyNote');

OSCdef(\bassNote, {|msg|
	x = {
		var sig, env;
		env = XLine.kr(1, 0.01, 1, doneAction: 2);
		sig = Saw.ar(fund * rrand(1, 2)) * 0.1 * env;
	}.play;
}, '/bassNote');
)

{Pulse.ar(120)}.play;

