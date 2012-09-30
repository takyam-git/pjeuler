//get file path
var filename = process.argv[2] || "";

//replace console.log()
var stdout = [];
console.log = function (d) {
  stdout.push(d);
};

//start benchmark
var start = process.hrtime();
require(filename); //js eval is very very slow
var result = process.hrtime(start)

//restore console.log()
console.log = function (d) {
    process.stdout.write(d + '\n');
};

//export benchmark time & stdout
console.log(result[0] + (result[1] / 1000 / 1000 / 1000));
console.log(stdout.join("\n"));