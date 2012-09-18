// function fileCheck( filename ){
//   var fs = require("fs");
//   try {
//     fs.statSync(filename);
//   } catch(e) {
//     console.log("999.999\nERROR SCRIPT NOT FOUND");
//     process.exit();
//   }
// };
var filename = process.argv[2] || "";
// fileCheck(filename);
var microtime = require('microtime')
var stdout = "";
console.log = function (d) {
  stdout = d;
};
var start = microtime.now();
// eval(code);
require(filename); //js eval is very very slow
var end = microtime.now();
console.log = function (d) {
    process.stdout.write(d + '\n');
};
console.log((end - start)/1000/1000);
console.log(stdout);
