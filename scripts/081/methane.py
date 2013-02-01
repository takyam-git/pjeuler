def main():
    M = open('matrix.txt').read().split()
    M = [map(int, m.split(',')) for m in M]
    xr = xrange

    H = len(M)
    W = len(M[0])

    scores = [0] * W
    s = 0
    for x in xr(W):
        s += M[0][x]
        scores[x] = s

    min_ = min

    for y in xr(1, H):
        L = M[y]
        scores[0] += L[0]
        s = scores[0]
        for x in xr(1, W):
            s = scores[x] = min_(scores[x], s) + L[x]

    return scores[-1]

print main()
