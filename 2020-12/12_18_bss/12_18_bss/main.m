//
//  main.m
//  12_18_bss
//
//  Created by delims on 2020/12/18.
//

#import <Foundation/Foundation.h>
#include <pthread/pthread.h>
#include <signal.h>
#include <sys/semaphore.h>

static int aa;
static int bb;
static int cc;

void once_func(void)
{
    printf("run once\n");
}


void *newthread(void *arg)
{
    static pthread_once_t once_control = PTHREAD_ONCE_INIT;
    pthread_once(&once_control, once_func);
    return NULL;
}

int main(int argc, const char * argv[]) {
    
//    printf("%p\n",&aa);
//    printf("%p\n",&bb);
//    printf("%p\n",&cc);
//
//
//    write(1, "banide\n", sizeof("banide"));
//    char buffer[10];
//    read(0, buffer, 10);
//    printf("%s \n",buffer);
//    printf("%p\n","a");

    for (int i = 0 ; i < 10; i ++) {
        pthread_t tid;
        pthread_create(&tid, NULL, newthread, NULL);
//        pthread_join(tid, NULL);
    }
    
    sleep(1);
    
    
    
    return 0;
}
