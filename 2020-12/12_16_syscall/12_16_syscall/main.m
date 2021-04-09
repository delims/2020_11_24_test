//
//  main.m
//  12_16_syscall
//
//  Created by delims on 2020/12/16.
//

#import <Foundation/Foundation.h>

void sighandler(int arg) {
    NSLog(@"received signal %i",arg);
}

int main(int argc, const char * argv[]) {

    
    int *a = malloc(4096);
    int *b = malloc(1);
    int *c = malloc(4096);
    NSLog(@"%p",a);
    NSLog(@"%p",b);
    NSLog(@"%p",c);

    NSLog(@"%x",4096);
    
    //注册信号处理函数，注册发生错误会返回 SIG_ERR。注册成功后，对应的信号来了会调用对应的处理函数。
    if (signal(SIGINT, sighandler) == SIG_ERR) {
        NSLog(@"error");
    }
    
    pause();
    
    return 0;
}
