//
//  main.cpp
//  12_07_macos_cpp
//
//  Created by delims on 2020/12/7.
//

#include <iostream>
#include <atomic>
#include <mutex>
#include <semaphore.h>

#import <Foundation/Foundation.h>

using namespace std;

mutex m;

void *runnew(void *arg){
    m.lock();
    cout << "一个新的线程" << endl;
    sleep(3);
    m.unlock();
    return NULL;
}

int main(int argc, const char * argv[]) {
    // insert code here...
//    std::cout << "Hello, World!\n";
    
//    cout << argc << endl;
//    for (int i = 0; i < argc; i ++) {
//        cout << argv[i] << endl;
//    }
    

    for (int i = 0 ; i < 100; i ++) {
        pthread_t ptrhead;
        pthread_create(&ptrhead, NULL, runnew, NULL);
       
        
    }
    
    sleep(100);
    
    return 0;
}
