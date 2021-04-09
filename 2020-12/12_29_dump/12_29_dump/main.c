//
//  main.m
//  12_29_dump
//
//  Created by delims on 2020/12/29.
//

//#import <Foundation/Foundation.h>

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <mach-o/loader.h>

int main(int argc, const char * argv[]) {
//    @autoreleasepool {
//        // insert code here...
//        NSLog(@"Hello, World!");
//    }
    printf(" main argc = %d \n",argc);

    return 0;
}

struct ProgramVars {
  struct mach_header*    mh;
  int*        NXArgcPtr;
  const char***    NXArgvPtr;
  const char***    environPtr;
    
  const char**    __prognamePtr;
};


__attribute__((constructor))
void dumptofile(int argc, const char **argv, const char **envp, const char **apple, struct ProgramVars *pvars)
{
    printf("argc = %d \n",argc);
    

    
    for (int i = 0; i < argc; i ++) {
        printf("%s\n",argv[0]);
    }

    printf("123\n");
}


static  __attribute__((constructor(101))) void before1()
{
    
    printf("before1\n");
}
static  __attribute__((constructor(102))) void before2()
{
    
    printf("before2\n");
}
static  __attribute__((constructor(102))) void before3()
{
    
    printf("before3\n");
}
