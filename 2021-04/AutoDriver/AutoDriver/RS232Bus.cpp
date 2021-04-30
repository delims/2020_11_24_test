//
//  RS232Bus.cpp
//  AutoDriver
//
//  Created by delims on 2021/4/29.
//

#include "RS232Bus.h"
#include <errno.h>
#include <pthread.h>
#include <stdlib.h>
#include <iostream>

using namespace std;

static char r_buffer[512] = {0};
static char w_buffer[512] = {0};
static string w_string;

void read_block(const char str[])
{
    cout << "==" << str << endl;
}

RS232Bus::RS232Bus(const char *dev)
{
    printf("open file %s\n",dev);
    fd = ::open(dev, O_RDWR | O_NONBLOCK);
    if (fd < 0) {
        printf("fd = %d  %s \n",fd,strerror(errno));return;
    } else printf("fd = %d \n",fd);
 
    
    pthread_create(&r_thread, NULL, RS232Bus::read, (void*)this);
    pthread_create(&w_thread, NULL, RS232Bus::write, (void*)this);
    read_callback = read_block;
    
    
    char *data = "$zcby,-30372892.000,-9.57,124,100,2.3,329.56,0.00,0.0,0,0,99,0.00000000,-6340.14577167,101420.3,1,c40,0,0,0,0,f7b3,0*62";
    
//    char *data = "$data,-0.02,0.08,-0.06,0.004,0.016,-1.003,0.0,0.0,999.00,26.0,0,0.0,0.00000000,0.00000000,-31251431.35,10000000.00,-30372892.76,-9992514.19,-0.00,0.0,71.73,0.0,1,0,0*";
    
    
    vector<string> *stringList = this->split_str(data);
    
    for (int i = 0; i < stringList->size(); i ++) {
        printf("%s\n",stringList->at(i).c_str());
    }

    delete stringList;
}


void *RS232Bus::read(void *self){
    int fd = ((RS232Bus*)self)->fd;
    RS232Bus *bus = (RS232Bus*)self;
    while (1) {
        memset(r_buffer, 0, sizeof(r_buffer));
        ::read(fd, r_buffer, 10);
        usleep(500000);
        w_string = r_buffer;
//        cout << w_string << endl;
        bus->read_callback(r_buffer);
        usleep(1000000);
    }
    return NULL;
}

void *RS232Bus::write(void *self){
    int fd = ((RS232Bus*)self)->fd;
    while (1) {
        if (w_string.size()>0) {
            unsigned long size = w_string.size();
            memcpy(w_buffer, w_string.c_str(), size);
            ::write(fd, w_buffer,size);
        }
        usleep(500000);
    }
    return NULL;
}


vector<string> *RS232Bus::split_str(const char *str)
{
    unsigned long size = strlen(str);
    char tmp[size];
    memcpy(tmp, str, size);
    for (int i = 0; i < size; i ++) {
        if (tmp[i] == ',') {
            tmp[i] = '\0';
        }
    }
    char *m_str = (char*)malloc(size+1);
    memcpy(m_str, tmp, size);
    m_str[size] = 0;
    char **ret = (char **)malloc(size * sizeof(char*) / 2);
    memset(ret, 0, size * sizeof(char*));
    char *p = m_str;
    int index = 0;
    while (p < m_str + size) {
        ret[index++] = p;
        p += strlen(p)+1;
    }
    index = 0;
    vector<string> *stringList = new vector<string>;
    while (ret[index]) {
        char *tp = ret[index];
        string str = tp;
        stringList->push_back(str);
        index ++;
    }
    free(m_str);
    free(ret);
    return stringList;
}


//$zcby,-30372892.000,-9.57,124,100,2.3,329.56,0.00,0.0,0,0,99,0.00000000,-6340.14577167,101420.3,1,c40,0,0,0,0,f7b3,0*62
//$data,-0.02,0.08,-0.06,0.004,0.016,-1.003,0.0,0.0,999.00,26.0,0,0.0,0.00000000,0.00000000,-31251431.35,10000000.00,-30372892.76,-9992514.19,-0.00,0.0,71.73,0.0,1,0,0*0D
//
//$zcby,-30372892.000,-9.57,124,100,2.3,329.56,0.00,0.0,0,0,99,0.00000000,-6340.14577167,101420.4,1,c40,0,0,0,0,f7b3,0*65
