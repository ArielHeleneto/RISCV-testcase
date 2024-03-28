# fio 测试

## 说明

fio 套件用于对 Linux 系统磁盘 IO 进行压力测试。

## 测试步骤

- 安装测试依赖： `sudo zypper -n --no-gpg-checks in fio python`
- 运行测试脚本： `bash fio.sh | tee fio.log`

测试脚本如下。

```bash
#!/bin/bash
numjobs=10
iodepth=10
mkdir test
for rw in read write randread randwrite randrw;do
  for bs in 4 16 32 64 128 256 512 1024;do
    if [ $rw == "randrw" ];then
      fio -filename=test/fio -direct=1 -iodepth ${iodepth} -thread -rw=$rw -rwmixread=70 -ioengine=libaio -bs=${bs}k -size=1G -numjobs=${numjobs} -runtime=30 -group_reporting -name=job1
    else
      fio -filename=test/fio -direct=1 -iodepth ${iodepth} -thread -rw=$rw -ioengine=libaio -bs=${bs}k -size=1G -numjobs=${numjobs} -runtime=30 -group_reportin -name=job1
    fi
    sleep 30
  done
done
```

## 日志

- `fio.log`