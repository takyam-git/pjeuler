filename = process.argv[2]
stdout = "";

#override console.log
console.log = (d) ->
  stdout = d

start = (new Date).getTime()
require(filename);
end = (new Date).getTime()

#reverse console.log
console.log = (d) ->
    process.stdout.write(d + '\n')

console.log (end - start) / 1000
console.log stdout
