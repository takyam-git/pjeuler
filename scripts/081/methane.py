import sys
def main():
    M = open('matrix.txt').read().split()
    M = [map(int, m.split(',')) for m in M]
    xr = xrange

    H = len(M)
    W = len(M[0])

    Z = sys.maxint

    scores = [0] * W
    s = 0
    for x in xr(W):
        s += M[0][x]
        scores[x] = s

    min_ = min

    for y in xr(1, H):
        s = sys.maxint
        scores[0] += M[y][0]
        for x in xr(1, W):
            scores[x] = min_(scores[x], scores[x-1]) + M[y][x]

    return scores[-1]

print main()
