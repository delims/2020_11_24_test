//
//  main.m
//  11_21_ios
//
//  Created by delims on 2020/11/21.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
//    NSString * appDelegateClassName;
    
    int multiple = 100;
    
    int (^block)(int) = ^(int argument) {
        NSLog(@"%i",argument);
        return multiple;
    };
    
    block(200);
    
    
    return  0;
//    @autoreleasepool {
//        // Setup code that might create autoreleased objects goes here.
//        appDelegateClassName = NSStringFromClass([AppDelegate class]);
//    }
//    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
