def main(N):
    from math import log
    if N <= 6:
        return sum([2,3,5,7,11,13][:N])

    MAX_NUM = int(N*log(N) + N*log(log(N)) + 1)/2

    L = bytearray(MAX_NUM)
    F = bytearray(b'1' * MAX_NUM)
    S = 2
    i = 1
    next = L.find

    for _ in xrange(N-1):
        i = next(b'\x00', i)
        x = i*2+1
        S += x
        L[i::x] = F[i::x]
        #print i, x, L

    return S

print main(10000)


#1 3 5 7 9 11 13 15 17 19 21 23 25 ...
#  *     *        *       *

