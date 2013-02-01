var fs = require('fs');
var a = fs.readFileSync('matrix.txt').toString().split('\n');
a.pop();
for (var i = 0; i < a.length; ++ i) {
	a[i] = a[i].split(',');
	for (var j = 0; j < a[i].length; ++ j) a[i][j] -= 0;
}
var N = a.length;
var b = new Array(N);
b[0] = new Array(N);
b[0][0] = a[0][0];
for (var j = 1; j < N; ++ j) {
	b[0][j] = b[0][j-1] + a[0][j];
}
for (var i = 1; i < N; ++ i) {
	b[i] = new Array(N);
	b[i][0] = b[i-1][0] + a[i][0];
	for (var j = 1; j < N; ++ j) {
		b[i][j] = Math.min(b[i-1][j], b[i][j-1]) + a[i][j];
	}
}
console.log(b[N-1][N-1]);
