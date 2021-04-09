//
//  ViewController.m
//  TestForwardingSelector
//
//  Created by delims on 2021/4/9.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import <objc/message.h>

void helle2(id self,SEL sel)
{
    printf("这是新添加的方法");
}

@interface ViewController ()
- (void)hello;
+ (void)hello;
@end




@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    

//    @try {
//
//        NSLog(@"invoke hello");
//        [self.class hello];
//
//    } @catch (NSException *exception) {
//        NSLog(@"%@",exception.reason);
//    } @finally {
//
//    }
    [self hello];
    
}


+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    NSLog(@"%s -- %s",__FUNCTION__,sel);

    if (sel == @selector(hello)) {
        class_addMethod(self, sel, (IMP)helle2, "v@:");
        return  YES;
    }
    return NO;
}


+ (BOOL)resolveClassMethod:(SEL)sel
{
    NSLog(@"%s -- %s",__FUNCTION__,sel);
    return false;
}


- (id)forwardingTargetForSelector:(SEL)aSelector
{
    NSLog(@"%s -- %s",__FUNCTION__,aSelector);
    return nil;
}




@end

