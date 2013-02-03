(function() {
	require("fs").createReadStream("matrix.txt", {encoding: "utf8"}).on('data', function (data) {
		var map = data.split("\n", 80), i = 0, length = map.length, x, y;
		for (i = 0; map.length > i; i += 1) {map[i] = map[i].split(",", 80); }
		for (y in map) {
			if(keypairs.hasOwnProperty(y)) {
				for (x in map[y]) {
					if(keypairs.hasOwnProperty(x)) {
						map[y][x] = Number(map[y][x]);
						map[y][x] += (x !== '0') ? (y !== '0') ? (map[y - 1][x] < map[y][x - 1]) ? map[y - 1][x] : map[y][x - 1] : map[y][x - 1] : (y !== '0') ? map[y - 1][x] : 0;
					}
				}
			}
		}
		console.log(map[map.length - 1][map[y].length - 1]);
	});
}());
