#include "logger.h"
#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>

#define CONFFILE            "../etc/log.conf"
static const char* kFileOutputFileName = "file.log";

int main(int argc, char* argv[])
{
    remove(kFileOutputFileName);

    const char message[] = "message";
    int result;

    logger_init("app_test", CONFFILE);

    /* and: auto flush on */
    logger_autoFlush(10);
    /* when: initialize console logger */
    result = logger_initConsoleLogger(stdout);
    if(result == 0){return -1;}

    /* when: initialize file logger */
    result = logger_initFileLogger(kFileOutputFileName, 150, 5);
    if(result == 0){return -1;}

    /* when: output to stdout */
    LOG_TRACE(message);
    LOG_DEBUG(message);
    LOG_INFO(message);

    int count = 0;
    while(1){
        count++;
        LOG_TRACE("count:%d",count);
        LOG_DEBUG("count:%d",count);
        LOG_INFO("count:%d",count);
        if(count == 7){
            break;
        }
        usleep(10);
    }

    return 0;
}
