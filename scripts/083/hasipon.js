var fs = require('fs');
var a = fs.readFileSync('matrix.txt').toString().split('\n');
a.pop();
for (var i = 0; i < a.length; ++ i) {
	a[i] = a[i].split(',');
	for (var j = 0; j < a[i].length; ++ j) a[i][j] -= 0;
}

var N = a.length;
var b = new Array(N);
for (var i = 0; i < N; ++ i) {
	b[i] = new Array(N);
	for (var j = 0; j < N; ++ j) {
		b[i][j] = 1e+300;
	}
}
b[0][0] = a[0][0];
var Q = [[a[0][0], 0, 0]];
var di = [+1,-1, 0, 0];
var dj = [ 0, 0,+1,-1];
while (Q.length) {
	var x = Q.shift();
	var d = x[0];
	var i = x[1];
	var j = x[2];
	if (i == N-1 && j == N-1) break;
	if (d > b[i][j]) continue;
	for (var k = 0; k < 4; ++ k) {
		var ii = i + di[k];
		var jj = j + dj[k];
		if (0 <= ii && ii < N && 0 <= jj && jj < N && d + a[ii][jj] < b[ii][jj]) {
			b[ii][jj] = d + a[ii][jj];
			Q.push([b[ii][jj], ii, jj]);
		}
	}
	Q.sort(function(a,b){return a[0]-b[0];});
}
console.log(b[N-1][N-1]);
