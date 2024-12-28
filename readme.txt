本例程是参考github的另一份源码修改来的：https://github.com/yksz/c-logger
只为记录适合自己且简便的log
编译出来的log文件夹可替换到各个应用上
支持云端下发update字段的协议，其params为：{"log_level":"info","output":"cloud"}
编译步骤：
在根目录下make即可，中间会生成一个共享库文件夹log并将共享库连接到测试代码的源文件中
生成的可执行文件存放在bin文件夹下，进入到bin文件夹后执行以下两个步骤即可运行程序：
export LD_LIBRARY_PATH=/home/zsd/workspace/c-logger/log/lib:$LD_LIBRARY_PATH
./logger_app_test
执行完会打印相对应的log在串口上，并且会将对应log记录在当前执行文件的目录下