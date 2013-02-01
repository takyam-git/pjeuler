#!/usr/bin/python

import sys
from ctypes import *
from platform import machine
from struct import pack

obj = [
 0x48,0x81,0xec,0x88,0x63,0x00,0x00, # sub    $0x6388,%rsp
 0x8b,0x06,                          # mov    (%rsi),%eax
 0x89,0x44,0x24,0x88,                # mov    %eax,-0x78(%rsp)
 0x83,0xff,0x01,                     # cmp    $0x1,%edi
 0x0f,0x8e,0x9c,0x00,0x00,0x00,      # jle    400701 <p81+0xb2>
 0x41,0x89,0xf8,                     # mov    %edi,%r8d
 0x8d,0x47,0xfe,                     # lea    -0x2(%rdi),%eax
 0x4c,0x8d,0x0c,0x85,0x04,0x00,0x00, # lea    0x4(,%rax,4),%r9
 0x00,                               # 
 0xb8,0x00,0x00,0x00,0x00,           # mov    $0x0,%eax
 0x48,0x8d,0x4c,0x24,0x88,           # lea    -0x78(%rsp),%rcx
 0x48,0x83,0xc1,0x04,                # add    $0x4,%rcx
 0x8b,0x54,0x04,0x88,                # mov    -0x78(%rsp,%rax,1),%edx
 0x03,0x54,0x06,0x04,                # add    0x4(%rsi,%rax,1),%edx
 0x89,0x14,0x01,                     # mov    %edx,(%rcx,%rax,1)
 0x48,0x83,0xc0,0x04,                # add    $0x4,%rax
 0x4c,0x39,0xc8,                     # cmp    %r9,%rax
 0x75,0xec,                          # jne    400681 <p81+0x32>
 0x41,0x89,0xfa,                     # mov    %edi,%r10d
 0x41,0xbb,0x01,0x00,0x00,0x00,      # mov    $0x1,%r11d
 0x49,0x63,0xc2,                     # movslq %r10d,%rax
 0x44,0x89,0xd2,                     # mov    %r10d,%edx
 0x44,0x29,0xc2,                     # sub    %r8d,%edx
 0x48,0x63,0xd2,                     # movslq %edx,%rdx
 0x8b,0x54,0x94,0x88,                # mov    -0x78(%rsp,%rdx,4),%edx
 0x03,0x14,0x86,                     # add    (%rsi,%rax,4),%edx
 0x89,0x54,0x84,0x88,                # mov    %edx,-0x78(%rsp,%rax,4)
 0x41,0x8d,0x42,0x01,                # lea    0x1(%r10),%eax
 0x47,0x8d,0x0c,0x02,                # lea    (%r10,%r8,1),%r9d
 0x89,0xc2,                          # mov    %eax,%edx
 0x44,0x29,0xc2,                     # sub    %r8d,%edx
 0x48,0x63,0xd2,                     # movslq %edx,%rdx
 0x8b,0x4c,0x94,0x88,                # mov    -0x78(%rsp,%rdx,4),%ecx
 0x8d,0x50,0xff,                     # lea    -0x1(%rax),%edx
 0x48,0x63,0xd2,                     # movslq %edx,%rdx
 0x8b,0x54,0x94,0x88,                # mov    -0x78(%rsp,%rdx,4),%edx
 0x39,0xd1,                          # cmp    %edx,%ecx
 0x7d,0x0c,                          # jge    4006e3 <p81+0x94>
 0x48,0x63,0xd0,                     # movslq %eax,%rdx
 0x03,0x0c,0x96,                     # add    (%rsi,%rdx,4),%ecx
 0x89,0x4c,0x94,0x88,                # mov    %ecx,-0x78(%rsp,%rdx,4)
 0xeb,0x0a,                          # jmp    4006ed <p81+0x9e>
 0x48,0x63,0xc8,                     # movslq %eax,%rcx
 0x03,0x14,0x8e,                     # add    (%rsi,%rcx,4),%edx
 0x89,0x54,0x8c,0x88,                # mov    %edx,-0x78(%rsp,%rcx,4)
 0x83,0xc0,0x01,                     # add    $0x1,%eax
 0x44,0x39,0xc8,                     # cmp    %r9d,%eax
 0x75,0xc8,                          # jne    4006bd <p81+0x6e>
 0x41,0x83,0xc3,0x01,                # add    $0x1,%r11d
 0x45,0x01,0xc2,                     # add    %r8d,%r10d
 0x41,0x39,0xfb,                     # cmp    %edi,%r11d
 0x75,0x9d,                          # jne    40069e <p81+0x4f>
 0x8b,0x84,0x24,0x84,0x63,0x00,0x00, # mov    0x6384(%rsp),%eax
 0x48,0x81,0xc4,0x88,0x63,0x00,0x00, # add    $0x6388,%rsp
 0xc3,                               # retq   
]

#from p81 import obj

code = create_string_buffer(''.join(map(chr, obj)))
addr = addressof(code)
ps = pythonapi.getpagesize()
size=(ps - 1) & addr + len(code)
if pythonapi.mprotect(addr&-ps, size, 7) < 0:
    print("mprotect error, addr=%#x" % (addr))
    exit()

mat=[]
n=0
for line in open('matrix.txt'):
    mat += map(int, line.split(','))
    n +=1

p = create_string_buffer(''.join(map(lambda i: pack("i", i), mat)))
print(cast(code, CFUNCTYPE(c_int, c_int, c_void_p))(n, p))
