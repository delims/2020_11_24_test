//
//  main.cpp
//  Test_c
//
//  Created by delims on 2021/4/20.
//

#include <iostream>

int main(int argc, const char * argv[]) {
    // insert code here...
//    std::cout << "Hello, World!\n";
    int b = 0x6789;
    int c = 0x23454;
    
    int a[5] = {1,2,3,4,5};
    unsigned int *ptr = (unsigned int *)(a +5);
    unsigned int *ptr1 = (unsigned int *)(a +6);
    unsigned int *ptr2 = (unsigned int *)(a +7);
    unsigned int *ptr3 = (unsigned int *)(a +8);

    printf("%x\n",*ptr);
    printf("%x\n",*ptr1);
    printf("%x\n",*ptr2);
    printf("%x\n",*ptr3);
    printf("a=%p  a0=%p\n",&a,&a[0]);
//    printf("%p\n",ptr);
//    00007ffeef0e001e
    return 0;
}
