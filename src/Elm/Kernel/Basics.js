/*

import Elm.Kernel.Debug exposing (crash)

*/

// MATH

var _Basics_pow = F2(Math.pow);

var _Basics_cos = Math.cos;
var _Basics_sin = Math.sin;
var _Basics_tan = Math.tan;
var _Basics_acos = Math.acos;
var _Basics_asin = Math.asin;
var _Basics_atan = Math.atan;
var _Basics_atan2 = F2(Math.atan2);


var _Basics_ceiling = Math.ceil;
var _Basics_floor = Math.floor;
var _Basics_round = Math.round;
var _Basics_sqrt = Math.sqrt;
var _Basics_log = Math.log;

var _Basics_modBy0 = function()
{
	__Debug_crash(11)
};

var _Basics_fudgeType = function(x) {
	return x;
};

const _Basics_unwrapTypeWrapper__DEBUG = wrapped => {
	const entries = Object.entries(wrapped);
	if (entries.length !== 2) {
		__Debug_crash(12, 'failedUnwrap');
	}
	if (entries[0][0] === '$') {
		return entries[1][1];
	} else {
		return entries[0][1];
	}
}

const _Basics_unwrapTypeWrapper__PROD = wrapped => wrapped;
