//
//  main.m
//  11_24_ios_oc
//
//  Created by delims on 2020/11/24.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int double_num(int num) {
    __asm__ __volatile__(
        "lsl x0, x0, 1\n"
        "str x0, [sp, #12]\n"
    );
    return num;
}

void test()
{
//    int a;
//    int *p =&a;
//
//    char c = 15;
//    char d = 12;
    
    int num = double_num(15);
    
    printf("%d \n",num);
    
//    p += 0x6;
//    printf("%p --%d \n", p, *p);
//    p += 0x2;
//    printf("%p --%d \n", p, *p);

    
    
//
//
//    printf("%d \n", *p++);
//    printf("%d \n", *p++);
//    printf("%d \n", *p++);
//    printf("%d \n", *p++);
//    printf("%d \n", *p++);
//    printf("%d \n", *p++);
//    printf("%d \n", *p++);
//    printf("%d \n", *p++);
//    printf("%d \n", *p++);
//    printf("%d \n", *p++);
//    printf("%d \n", *p++);
//    printf("%d \n", *p++);

}

int double_num_times_asm(int num, int times);

int main(int argc, char * argv[]) {
    
//    int a = 7536985;
//    int b = 258693;
//    int c = 1478552;
    
//    printf("%p \n", &c);

    int num = 120;
    printf("%p \n", &num);

    int times = 1;
    
    int ret = double_num_times_asm(num, times);
    
    printf("%d \n",ret);
    
    
//    test();
    
//    printf("%d \n", 123);
    return 0;
//    NSString * appDelegateClassName;
//    @autoreleasepool {
//        // Setup code that might create autoreleased objects goes here.
//        appDelegateClassName = NSStringFromClass([AppDelegate class]);
//    }
//    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
