var fs = require('fs');
var a = fs.readFileSync(process.argv[1].replace(/[^/]*$/, '')+'matrix.txt').toString().split('\n');
a.pop();
for (var i = 0; i < a.length; ++ i) {
	a[i] = a[i].split(',');
	for (var j = 0; j < a[i].length; ++ j) a[i][j] -= 0;
}
var N = a.length;
var b = new Array(N);
b[0] = new Array(N);
for (var j = 0; j < N; ++ j) {
	b[0][j] = a[j][N-1];
}
for (var i = 1; i < N; ++ i) {
	b[i] = new Array(N);
	for (var j = 0; j < N; ++ j) {
		b[i][j] = b[i-1][j] + a[j][N-1-i];
	}
	for (var j = 1; j < N; ++ j) {
		b[i][j] = Math.min(b[i][j], b[i][j-1] + a[j][N-1-i]);
	}
	for (var j = N-2; j >= 0; -- j) {
		b[i][j] = Math.min(b[i][j], b[i][j+1] + a[j][N-1-i]);
	}
}
var ans = 1e+300;
for (var j = 0; j < N; ++ j) {
	ans = Math.min(ans, b[N-1][j]);
}
console.log(ans);
