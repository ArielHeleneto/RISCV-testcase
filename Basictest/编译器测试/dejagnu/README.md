# dejagnu

DejaGnu 是一个用于测试其他程序的框架。

## 测试方法

> 与上游不同之处：直接从软件源安装 dejagnu 而非编译安装。

1. 安装 dejagnu 和 GCC

```bash
sudo dnf install -y dejagnu gcc gcc-*
```

2. 获取 `gcc` 源码及其自带的测试套

```bash
git clone --depth=1 https://gitee.com/openeuler/gcc
cd gcc/gcc/testsuite
```

3. 分别运行 gcc, g++, gfortran 的测试套

```bash
runtest --tool gcc
runtest --tool g++
runtest --tool gfortran
```

4. 查看测试结果

测试结束后，会在当前目录下生成 `.log` 日志文件和 `.sum` 统计信息，可进行查看。由于日志文件过大，已使用 Zstd 压缩，此处仅展示统计结果。

`gcc` 的测试结果统计如下：

```
		=== gcc Summary ===

# of expected passes		112127
# of unexpected failures	38
# of unexpected successes	3
# of expected failures		671
# of unresolved testcases	22
# of unsupported tests		2078
/usr/bin/gcc  version 10.3.1 (GCC) 
```

`g++` 的测试结果统计如下：

```
		=== g++ Summary ===

# of expected passes		180847
# of unexpected failures	27
# of expected failures		863
# of unsupported tests		8384
/usr/bin/c++  version 10.3.1 (GCC) 
```

`gfortran` 的测试结果统计如下：

```
		=== gfortran Summary ===

# of expected passes		53641
# of unexpected failures	130
# of expected failures		220
# of unsupported tests		99
/usr/bin/gfortran  version 10.3.1 (GCC) 
```

## 与 openEuler 23.03 x86_64 比较

统计了 `dejagnu` 编译器测试中，非预期失败/FAIL，并且与 openEuler x86_64 不同的部分。oErv 下的失败项已单独进行重测。

点击标题可跳转到本目录下对应的单项错误日志。

x86_64 平台下的日志见 [此处](./x86_64/)，供参考。

### [gcc](./riscv64/gcc/)

| 失败项                                                                                                                                                                                                                           | CMD                                                                | x86 情况 | oErv 重测结果 | 失败原因                                                                                                                                                                                         |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------|--------|-----------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| FAIL: gcc.dg/autoprefetch/get-edge-prob-non-init.c (test for excess errors)                                                                                                                                                   | runtest -v --tool gcc autoprefetch.exp=get-edge-prob-non-init.c    | PASS   | FAIL      | cc1: warning: '-fprefetch-loop-arrays' not supported for this target                                                                                                                         |
| FAIL: gcc.dg/debug/dwarf2/inline5.c scan-assembler-not \\(DIE \\(0x([0-9a-f]*)\\) DW_TAG_lexical_block\\)[^#/!@;\\|]*[#/!@;\\|]+ +[^(].*DW_TAG_lexical_block\\)[^#/!@;\\|x]*x\\1[^#/!@;\\|]*[#/!@;\\|] +DW_AT_abstract_origin | runtest -v --tool gcc debug.exp=inline5.c                          | PASS   | FAIL      | cc1: error: target system does not support the 'stabs' debug format                                                                                                                          |
| FAIL: c-c++-common/patchable_function_entry-decl.c  -Wc++-compat   scan-assembler-times nop\|NOP 2                                                                                                                             | runtest -v --tool gcc dg.exp=patchable_function_entry-decl.c       | PASS   | FAIL      | c-c++-common/patchable_function_entry-decl.c  -Wc++-compat  : nop|NOP found 3 times                                                                                                          |
| FAIL: c-c++-common/patchable_function_entry-default.c  -Wc++-compat   scan-assembler-times nop\|NOP 3                                                                                                                          | runtest -v --tool gcc dg.exp=patchable_function_entry-default.c    | PASS   | FAIL      | c-c++-common/patchable_function_entry-default.c  -Wc++-compat  : nop|NOP found 4 times                                                                                                       |
| FAIL: c-c++-common/patchable_function_entry-definition.c  -Wc++-compat   scan-assembler-times nop\|NOP 1                                                                                                                       | runtest -v --tool gcc dg.exp=patchable_function_entry-definition.c | PASS   | FAIL      | c-c++-common/patchable_function_entry-definition.c  -Wc++-compat  : nop|NOP found 2 times                                                                                                    |
| FAIL: c-c++-common/spec-barrier-1.c  -Wc++-compat  (test for excess errors)                                                                                                                                                   | runtest -v --tool gcc dg.exp=spec-barrier-1.c                      | PASS   | FAIL      | ./c-c++-common/spec-barrier-1.c:21:3: warning: this target does not define a speculation barrier; your program will still execute correctly, but incorrect speculation may not be restricted |

### [g++](./riscv64/g++/)

| 失败项                                                                                                                  | CMD                                                                | x86 情况 | oErv 重测结果 | 失败原因                                                                                                                                                                                          |
|----------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------|--------|-----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| FAIL: g++.dg/opt/pr99305.C  -std=gnu++98  scan-tree-dump-times optimized " = \\(unsigned char\\) c_[0-9]*\\(D\\);" 3 | runtest -v --tool g++ dg.exp=pr99305.C                             | PASS   | FAIL      | g++.dg/opt/pr99305.C  -std=gnu++98 : pattern found 0 times                                                                                                                                    |
| FAIL: g++.dg/opt/pr99305.C  -std=gnu++14  scan-tree-dump-times optimized " = \\(unsigned char\\) c_[0-9]*\\(D\\);" 3 | runtest -v --tool g++ dg.exp=pr99305.C                             | PASS   | FAIL      | g++.dg/opt/pr99305.C  -std=gnu++14 : pattern found 0 times                                                                                                                                    |
| FAIL: g++.dg/opt/pr99305.C  -std=gnu++17  scan-tree-dump-times optimized " = \\(unsigned char\\) c_[0-9]*\\(D\\);" 3 | runtest -v --tool g++ dg.exp=pr99305.C                             | PASS   | FAIL      | g++.dg/opt/pr99305.C  -std=gnu++17 : pattern found 0 times                                                                                                                                    |
| FAIL: g++.dg/opt/pr99305.C  -std=gnu++2a  scan-tree-dump-times optimized " = \\(unsigned char\\) c_[0-9]*\\(D\\);" 3 | runtest -v --tool g++ dg.exp=pr99305.C                             | PASS   | FAIL      | g++.dg/opt/pr99305.C  -std=gnu++2a : pattern found 0 times                                                                                                                                    |
| FAIL: c-c++-common/patchable_function_entry-decl.c  -std=gnu++98  scan-assembler-times nop\|NOP 2                     | runtest -v --tool g++ dg.exp=patchable_function_entry-decl.c       | PASS   | FAIL      | c-c++-common/patchable_function_entry-decl.c  -std=gnu++98 : nop|NOP found 3 times                                                                                                            |
| FAIL: c-c++-common/patchable_function_entry-decl.c  -std=gnu++14  scan-assembler-times nop\|NOP 2                     | runtest -v --tool g++ dg.exp=patchable_function_entry-decl.c       | PASS   | FAIL      | c-c++-common/patchable_function_entry-decl.c  -std=gnu++14 : nop|NOP found 3 times                                                                                                            |
| FAIL: c-c++-common/patchable_function_entry-decl.c  -std=gnu++17  scan-assembler-times nop\|NOP 2                     | runtest -v --tool g++ dg.exp=patchable_function_entry-decl.c       | PASS   | FAIL      | c-c++-common/patchable_function_entry-decl.c  -std=gnu++17 : nop|NOP found 3 times                                                                                                            |
| FAIL: c-c++-common/patchable_function_entry-decl.c  -std=gnu++2a  scan-assembler-times nop\|NOP 2                     | runtest -v --tool g++ dg.exp=patchable_function_entry-decl.c       | PASS   | FAIL      | c-c++-common/patchable_function_entry-decl.c  -std=gnu++2a : nop|NOP found 3 times                                                                                                            |
| FAIL: c-c++-common/patchable_function_entry-default.c  -std=gnu++98  scan-assembler-times nop\|NOP 3                  | runtest -v --tool g++ dg.exp=patchable_function_entry-default.c    | PASS   | FAIL      | c-c++-common/patchable_function_entry-default.c  -std=gnu++98 : nop|NOP found 4 times                                                                                                         |
| FAIL: c-c++-common/patchable_function_entry-default.c  -std=gnu++14  scan-assembler-times nop\|NOP 3                  | runtest -v --tool g++ dg.exp=patchable_function_entry-default.c    | PASS   | FAIL      | c-c++-common/patchable_function_entry-default.c  -std=gnu++14 : nop|NOP found 4 times                                                                                                         |
| FAIL: c-c++-common/patchable_function_entry-default.c  -std=gnu++17  scan-assembler-times nop\|NOP 3                  | runtest -v --tool g++ dg.exp=patchable_function_entry-default.c    | PASS   | FAIL      | c-c++-common/patchable_function_entry-default.c  -std=gnu++17 : nop|NOP found 4 times                                                                                                         |
| FAIL: c-c++-common/patchable_function_entry-default.c  -std=gnu++2a  scan-assembler-times nop\|NOP 3                  | runtest -v --tool g++ dg.exp=patchable_function_entry-default.c    | PASS   | FAIL      | c-c++-common/patchable_function_entry-default.c  -std=gnu++2a : nop|NOP found 4 times                                                                                                         |
| FAIL: c-c++-common/patchable_function_entry-definition.c  -std=gnu++98  scan-assembler-times nop\|NOP 1               | runtest -v --tool g++ dg.exp=patchable_function_entry-definition.c | PASS   | FAIL      | c-c++-common/patchable_function_entry-definition.c  -std=gnu++98 : nop|NOP found 2 times                                                                                                      |
| FAIL: c-c++-common/patchable_function_entry-definition.c  -std=gnu++14  scan-assembler-times nop\|NOP 1               | runtest -v --tool g++ dg.exp=patchable_function_entry-definition.c | PASS   | FAIL      | c-c++-common/patchable_function_entry-definition.c  -std=gnu++14 : nop|NOP found 2 times                                                                                                      |
| FAIL: c-c++-common/patchable_function_entry-definition.c  -std=gnu++17  scan-assembler-times nop\|NOP 1               | runtest -v --tool g++ dg.exp=patchable_function_entry-definition.c | PASS   | FAIL      | c-c++-common/patchable_function_entry-definition.c  -std=gnu++17 : nop|NOP found 2 times                                                                                                      |
| FAIL: c-c++-common/patchable_function_entry-definition.c  -std=gnu++2a  scan-assembler-times nop\|NOP 1               | runtest -v --tool g++ dg.exp=patchable_function_entry-definition.c | PASS   | FAIL      | c-c++-common/patchable_function_entry-definition.c  -std=gnu++2a : nop|NOP found 2 times                                                                                                      |
| FAIL: c-c++-common/spec-barrier-1.c  -std=gnu++98 (test for excess errors)                                           | runtest -v --tool g++ dg.exp=spec-barrier-1.c                      | PASS   | FAIL      | ./c-c++-common/spec-barrier-1.c:21:42: warning: this target does not define a speculation barrier; your program will still execute correctly, but incorrect speculation may not be restricted |
| FAIL: c-c++-common/spec-barrier-1.c  -std=gnu++14 (test for excess errors)                                           | runtest -v --tool g++ dg.exp=spec-barrier-1.c                      | PASS   | FAIL      | ./c-c++-common/spec-barrier-1.c:21:42: warning: this target does not define a speculation barrier; your program will still execute correctly, but incorrect speculation may not be restricted |
| FAIL: c-c++-common/spec-barrier-1.c  -std=gnu++17 (test for excess errors)                                           | runtest -v --tool g++ dg.exp=spec-barrier-1.c                      | PASS   | FAIL      | ./c-c++-common/spec-barrier-1.c:21:42: warning: this target does not define a speculation barrier; your program will still execute correctly, but incorrect speculation may not be restricted |
| FAIL: c-c++-common/spec-barrier-1.c  -std=gnu++2a (test for excess errors)                                           | runtest -v --tool g++ dg.exp=spec-barrier-1.c                      | PASS   | FAIL      | ./c-c++-common/spec-barrier-1.c:21:42: warning: this target does not define a speculation barrier; your program will still execute correctly, but incorrect speculation may not be restricted |

### [gfortran](./riscv64/gfortran/)

| 失败项                                                                                                                                  | CMD                                            | x86 情况 | oErv 重测结果 | 失败原因                                                                                                                 |
|--------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------|--------|-----------|----------------------------------------------------------------------------------------------------------------------|
| FAIL: gfortran.dg/pr45636.f90   -O   scan-tree-dump-times forwprop2 "memset" 0                                                       | runtest -v --tool gfortran dg.exp=pr45636.f90  | PASS   | FAIL      | gfortran.dg/pr45636.f90   -O  : pattern found 2 times                                                                |
| FAIL: gfortran.dg/pr95690.f90   -O   (test for errors, line 5)                                                                       | runtest -v --tool gfortran dg.exp=pr95690.f90  | PASS   | FAIL      | (x86_64 报错位置不同，5:21) ./gfortran.dg/pr95690.f90:6:6: Error: initializer for floating value is not a floating constant |
| FAIL: gfortran.dg/pr95690.f90   -O  (test for excess errors)                                                                         | runtest -v --tool gfortran dg.exp=pr95690.f90  | PASS   | FAIL      | ./gfortran.dg/pr95690.f90:6:6: Error: initializer for floating value is not a floating constant                      |
| FAIL: gfortran.dg/ieee/ieee_6.f90   -O0  execution test                                                                              | runtest -v --tool gfortran ieee.exp=ieee_6.f90 | PASS   | FAIL      | Note: The following floating-point exceptions are signalling: IEEE_INVALID_FLAG                                      |
| FAIL: gfortran.dg/ieee/ieee_6.f90   -O1  execution test                                                                              | runtest -v --tool gfortran ieee.exp=ieee_6.f90 | PASS   | FAIL      | Note: The following floating-point exceptions are signalling: IEEE_INVALID_FLAG                                      |
| FAIL: gfortran.dg/ieee/ieee_6.f90   -O2  execution test                                                                              | runtest -v --tool gfortran ieee.exp=ieee_6.f90 | PASS   | FAIL      | Note: The following floating-point exceptions are signalling: IEEE_INVALID_FLAG                                      |
| FAIL: gfortran.dg/ieee/ieee_6.f90   -O3 -fomit-frame-pointer -funroll-loops -fpeel-loops -ftracer -finline-functions  execution test | runtest -v --tool gfortran ieee.exp=ieee_6.f90 | PASS   | FAIL      | Note: The following floating-point exceptions are signalling: IEEE_INVALID_FLAG                                      |
| FAIL: gfortran.dg/ieee/ieee_6.f90   -O3 -g  execution test                                                                           | runtest -v --tool gfortran ieee.exp=ieee_6.f90 | PASS   | FAIL      | Note: The following floating-point exceptions are signalling: IEEE_INVALID_FLAG                                      |
| FAIL: gfortran.dg/ieee/ieee_6.f90   -Os  execution test                                                                              | runtest -v --tool gfortran ieee.exp=ieee_6.f90 | PASS   | FAIL      | Note: The following floating-point exceptions are signalling: IEEE_INVALID_FLAG                                      |

### Extra. 针对已知会出现报错的部分测试用例进行单独测试

可使用 [rerun-scripts](./rerun-scripts/) 下提供的脚本。

```bash
cd gcc/gcc/testsuite
bash gcc.sh; bash g++.sh; bash gfortran.sh
```

运行完成后，在 `~/log` 下查看对应日志。