function fileGetContents( filename ){
  var fs = require("fs");
  var fileContent = "";
  try {
    var stat = fs.statSync(filename);
    var fd = fs.openSync(filename, "r");
    var bytes = fs.readSync(fd, stat.size, 0, "utf8");
    fileContent += bytes[0];
    fs.closeSync(fd);
    return fileContent;

  } catch(e) {
    console.log("999.999\nERROR SCRIPT NOT FOUND");
    process.exit();
  }
};
var filename = process.argv[2] || "";
var code = fileGetContents(filename);
var microtime = require('microtime')
var start = microtime.now();
var stdout = "";
console.log = function (d) {
  stdout = d;
};
var out = eval(code);
var end = microtime.now();
console.log = function (d) {
    process.stdout.write(d + '\n');
};
console.log((end - start)/1000/1000);
console.log(stdout);
