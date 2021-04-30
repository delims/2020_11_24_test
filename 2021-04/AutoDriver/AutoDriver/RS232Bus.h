//
//  RS232Bus.hpp
//  AutoDriver
//
//  Created by delims on 2021/4/29.
//

#ifndef RS232Bus_hpp
#define RS232Bus_hpp

#include <stdio.h>


#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <stdlib.h>
#include <string>
#include <vector>

using namespace std;

class RS232Bus
{
public:
//    static RS232Bus *instance;
    RS232Bus(const char *dev = "/dev/ttyS5");
    
private:
    int fd;
    pthread_t r_thread;
    pthread_t w_thread;
    
    void(*read_callback)(const char* str);
    
    static void *read(void *self);
    static void *write(void *self);
    vector<string> *split_str(const char *str);
};

#endif /* RS232Bus_hpp */
