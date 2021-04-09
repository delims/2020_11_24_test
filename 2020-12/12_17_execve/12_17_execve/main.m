//
//  main.m
//  12_17_execve
//
//  Created by delims on 2020/12/17.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {

//    NSLog(@"i will execve a new program");
    //执行一个新的程序。
//    execve("new.out", NULL, NULL);
    
//    NSLog(@"i am new program");
//
//    sleep(1);
//
//    NSLog(@"i will exit");
    
    void *p = (void *)0x200000000;
    
    int fd = open("file1", O_RDONLY);
    
    if (fd) {
        NSLog(@"file id %i\n",fd);
    }

    
    void *p2 = mmap(p, 100,  PROT_READ, MAP_SHARED, fd, 0);
    
    NSLog(@"ret = %p",p2);
    
    NSLog(@"%s",(char *)p);

    fputs("delims\n", stdout);
    
    
    for (int i = 0 ;i < 100; i ++) {
        NSLog(@"%p",malloc(1));
    }
    
    
    
    return 0;
}
