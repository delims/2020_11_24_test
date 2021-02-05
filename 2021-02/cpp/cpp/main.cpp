//
//  main.cpp
//  cpp
//
//  Created by delims on 2021/2/4.
//

#include <iostream>
#include <fcntl.h>
#include <sys/syscall.h>


extern "C" void checkIsRunning(){
    
    const char *lockfile = "/Users/delims/Desktop/AgFar";
    int ret = open(lockfile,O_RDWR|O_CREAT);
    if (flock(ret, LOCK_EX | LOCK_NB) == -1) {
        printf("there is an app running \n");
        exit(0);
    }
}





int main(int argc, const char * argv[]) {
    // insert code here...
    
    checkIsRunning();
    
    std::cout << "Hello, World!\n";
    
    getchar();
    return 0;
}
