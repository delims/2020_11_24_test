//
//  main.m
//  12_31_dyldtest
//
//  Created by delims on 2020/12/31.
//

#import <Foundation/Foundation.h>
#import <mach/message.h>
#import <mach/mach.h>
#import <pthread/pthread.h>


void func2()
{
    
}

void func1()
{
    func2();
    
}

void *newThread(void *arg)
{
    while(1){};
    return NULL;
}

int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        // insert code here...
//        NSLog(@"Hello, World!");
//    }
//    int a = 100;
//    int b = 200;
//    int c = 300;
//    int d = a + b + c;
//    a = d;
//
//    printf("hello world \n");
//    printf("hello world2 \n");
//    printf("hello world2 \n");
//
//    func1();
//    func2();
//
//    host_t myhost = mach_host_self();
//    mach_port_t psDefault;
//    mach_port_t psDefault_control;
//    task_array_t tasks;
//    mach_msg_type_number_t numTasks;
//
//    int t;
//
//    kern_return_t kr;
//
//    kr = processor_set_default(myhost, &psDefault);
//
//    kr = host_processor_set_priv(myhost, psDefault, &psDefault_control);
//    if (kr != KERN_SUCCESS) {
//        fprintf(stderr, "host_processor_set_priv - %d ",kr);
//        exit(1);
//    }
//
//    kr = processor_set_tasks(psDefault_control, &tasks, &numTasks);
//
//    if (kr != KERN_SUCCESS) {
//        fprintf(stderr, "processor_set_tasks - %d \n",kr);
//        exit(2);
//    }
//
//    for (t = 0 ; t < numTasks; t ++) {
//        int pid;
//        pid_for_task(tasks[t], &pid);
//        printf("Task: %d pid : %d \n",tasks[t],pid);
//    }
//
//    for (int i = 0; i < 1; i ++) {
//        pthread_t ptd;
//        pthread_create(&ptd, NULL, newThread, NULL);
////        pthread_join(ptd, NULL);
//    }
//
//    sleep(100);
    
    char nbuffer[4096];
    
    printf("%p\n",nbuffer);
//
    return 0;
}
