#! /usr/bin/env python
# -*- coding: utf-8 -*-


# 時間チェック用
#import datetime


def gojoho(a, b):
    # ユークリッドの互除法で最大公約数を求める
    while True:
        amari = a % b
        if amari == 0:
            return(b)
        else:
            a = b
            b = amari
        
    
def so(x, y):
    # 互いに素かを判定（最大公約数が1）
    if x > y:
        a = x
        b = y
    else:
        a = y
        b = x
    GCD = gojoho(a,b)
    if GCD == 1:
        return(True)
    else:
        return(False)
        
def fermat(p, a_max=2):
    # フェルマーの判定法 (a^(p-1) % p != 1 なら素数ではない. ただしpとaは互いに素)
    # 返り値：Falseなら素数ではない。Trueなら素数である可能性あり。
    
    if p == 2:
        return(True)
    
    if p < 2:
        return(False)
    
    
    for a in range(2, a_max + 1):
        if so(p, a):
            # 互いに素である
            if not(pow(a, p-1, p) == 1):
                #print n, "fermat"
                return(False)
    else:
        return(True)


def sosu(p, slist):
    
    if p == 2:
        return(True)
    if p < 2:
        return(False)
        
    if not fermat(p):
        #print n, "not prime (fermat)" 
        return(False)
    
    else:
        # 素数である可能性が残っているので最終チェック
        # 愚直な判定法    
        for t in slist:
            # p^(1/2) 以下の素数について割れるかを調べればいい。
            if t*t > p:
                break
                
            if n % t == 0:
                # 結局素数ではなかった
                #print n, "not prime (non-fermat)" 
                return(False)
        
        # 素数である
        return(True)
        
#t1 = datetime.datetime.today()

mx = 10000
n = 2
inc = 1 
# 最初は2から3へ。次からはinc=2にして奇数だけ
ct = 0
SUM = 0
slist = []
while True:
    #print n 
    if ct >= mx:
        # 所定の個数の素数を超えていれば終了
        break
    
    
    if sosu(n, slist):
        slist.append(n)
        ct = ct + 1
        if ct % 1000 == 0:
            print n, "is prime ( ct =", ct, ")"
        SUM = SUM + n
        n = n + inc
        inc = 2
    else:
        n = n + inc
        inc = 2
        
print "over:", SUM

#t2 = datetime.datetime.today()
#print t2 - t1

