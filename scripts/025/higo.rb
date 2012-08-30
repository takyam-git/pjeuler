fivo = [1,1]

while fivo[-1] < 10 ** 999 
  fivo << fivo[-1] + fivo[-2]
end
p fivo.length
