#get file path
filename = process.argv[2]

#replace console.log()
stdout = []
console.log = (d) ->
  stdout.push(d)

#start benchmark
start = process.hrtime()
require(filename) #js eval is very very slow
result = process.hrtime(start)

#restore console.log()
console.log = (d) ->
  process.stdout.write(d + '\n')

#export benchmark time & stdout
console.log(result[0] + (result[1] / 1000 / 1000 / 1000));
console.log(stdout.join("\n"));