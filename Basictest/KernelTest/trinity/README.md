# Trinity 测试

## 说明

Trinity 套件通过模拟系统调用，对内核API进行冒烟测试。

## 测试步骤

```bash
sudo dnf install git make gcc -y
git clone https://github.com/kernelslacker/trinity.git --depth=1
cd trinity
./configure | tee build_configure.log
make -j${nproc} | tee build_output.log
./trinity -qq | tee trinityrun.log
```

## 采集日志

采集下列日志。

- build_configure.log
- build_output.log
- trinityrun.log