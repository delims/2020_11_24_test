//
//  main.m
//  explore_main
//
//  Created by delims on 2021/4/26.
//

#import <Foundation/Foundation.h>
#include <mach-o/fat.h>
#include <mach-o/loader.h>
#include <pthread/pthread.h>
#include <semaphore.h>


struct ProgramVars {
  struct mach_header*    mh;
  int*        NXArgcPtr;
  const char***    NXArgvPtr;
  const char***    environPtr;
  const char**    __prognamePtr;
};

__attribute__((constructor))
void dumptofile(int argc, const char **argv, const char **envp, const char **apple, struct ProgramVars *pvars){
    
    printf("==%x\n",pvars->mh->magic);
//    printf("==%s\n",pvars->__prognamePtr[0]);
//    printf("==%s\n",pvars->__prognamePtr[1]);
}

static pthread_mutex_t _mutex;
static pthread_cond_t _cond;


void *newThread(void* arg)
{
//    pthread_mutex_lock(&_mutex);
    for (int i = 0 ; i < 100; i ++) {
        sleep(1);
        printf("%p  %i\n",NSThread.currentThread,i);
    }
//    pthread_mutex_unlock(&_mutex);
    return NULL;
}

void *consumer(void *arg){
    while (1) {
        pthread_cond_wait(&_cond, &_mutex);
        
        printf("I am consumer\n");
    }
    return NULL;
}



void *producer(void *arg){
    while (1) {
        printf("I am producer\n");
        pthread_cond_signal(&_cond);
        sleep(2);
    }
    return NULL;
}

int main(int argc, const char * argv[],const char* envp[], const char* apple[]) {
//    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
        printf("%i\n",argc);
//        for (int i = 0 ;i < argc; i ++) {
//            printf("%s\n",argv[i]);
//            printf("%s\n",envp[i]);
//            printf("%s\n",apple[i]);
//        }
//    }
    
    pthread_mutex_init(&_mutex, NULL);
    pthread_cond_init(&_cond,NULL);
    
    pthread_t thread1;
    pthread_t thread2;
    
//    pthread_create(&thread1, NULL, consumer, NULL);
//    pthread_create(&thread2, NULL, producer, NULL);
    
    pthread_rwlock_t rwlock;
    pthread_rwlock_init(&rwlock, NULL);
    
    
//    pthread_detach(thread);
    pthread_join(thread1, NULL);
    
    printf("%s \n","main over");
    return 0;
}
