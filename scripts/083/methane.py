
def main():
    from heapq import heapify, heappush, heappop

    M = open('matrix.txt').read().split()
    M = [map(int, m.split(',')) for m in M]

    H = len(M)
    W = len(M[0])

    scores = [(M[0][0], 0, 0)]
    R = [[0]*W for _ in xrange(H)]

    def next(xx, yy):
        if not R[yy][xx]:
            ss = M[yy][xx] + s
            R[yy][xx] = ss
            heappush(scores, (ss, xx, yy))

    while scores:
        s, x, y = heappop(scores)
        if x == W-1 and y == H-1:
            #for r in R:
            #    print r
            return s
        if y > 0:
            next(x, y-1)
        if y < H-1:
            next(x, y+1)
        if x > 0:
            next(x-1, y)
        if x < W-1:
            next(x+1, y)

print main()
