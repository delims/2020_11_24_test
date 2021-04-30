//
//  main.cpp
//  AutoDriver
//
//  Created by delims on 2021/4/29.
//

#include <iostream>
#include "RS232Bus.h"

int main(int argc, const char * argv[]) {
    // insert code here...
    
//    RS232Bus *bus = new RS232Bus("/dev/ttys002");
    RS232Bus *bus = new RS232Bus("/Users/delims/Desktop/1.txt");

    
    getchar();
    return 0;
}

