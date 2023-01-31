# 使用 mount 挂载磁盘镜像

## 操作步骤

1. 打开 Terminal，输入 `dd if=/dev/zero of=test.img bs=256M count=1` 创建 256M 的测试文件
2. 查看 openEuler 提供的文件系统创建工具
    ```
    [openeuler@openEuler-riscv64 ~]$ ls /usr/sbin | grep mkfs
    mkfs
    mkfs.cramfs
    mkfs.ext2
    mkfs.ext3
    mkfs.ext4
    mkfs.fat
    mkfs.minix
    mkfs.msdos
    mkfs.vfat
    ```
3. 使用提供的工具分别在测试文件内创建文件系统并尝试挂载（以 ext4 为例）

    ```
    $ mkfs.ext4 test.img
    mke2fs 1.46.4 (18-Aug-2021)
    Discarding device blocks: done
    Creating filesystem with 262144 1k blocks and 65536 inodes
    Filesystem UUID: ecc406f2-842a-452d-8fe6-f653ce2e2af2
    Superblock backups stored on blocks:
    	8193, 24577, 40961, 57345, 73729, 204801, 221185

    Allocating group tables: done
    Writing inode tables: done
    Creating journal (8192 blocks): done
    Writing superblocks and filesystem accounting information: done
    ```

    ```
    # mount test.img /mnt
    ```

    mount 命令执行后无返回，代表挂载成功

## 预期结果

1. 使用 openEuler 提供的文件系统创建工具创建的文件系统能够成功挂载
2. 常见的文件系统，如 UDF 文件系统能够成功挂载

## 实际结果

1. 无法挂载创建的 minix 文件系统
    ```
    $ mkfs.minix test.img
    21856 inodes
    65535 blocks
    Firstdatazone=696 (696)
    Zonesize=1024
    Maxsize=268966912

    # mount test.img /mnt
    mount: /mnt: unknown filesystem type 'minix'.
    ```

2. 无法挂载 UDF 文件系统
    ```
    $ wget https://repo.openeuler.org/openEuler-22.03-LTS-SP1/ISO/x86_64/openEuler-22.03-LTS-SP1-x86_64-dvd.iso
    # mount openEuler-22.03-LTS-SP1-x86_64-dvd.iso /mnt
    mount: /mnt: unknown filesystem type 'iso9660'.
    ```