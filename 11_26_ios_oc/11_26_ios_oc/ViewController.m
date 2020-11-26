//
//  ViewController.m
//  11_26_ios_oc
//
//  Created by delims on 2020/11/26.
//

#import "ViewController.h"
#import <objc/runtime.h>

@protocol DelimsDelegate <NSObject>

@optional
- (void)run1;

@end

@interface ViewController () <DelimsDelegate>

@property (atomic,assign) int age;
@property (nonatomic,strong) NSString *name;

//{
//    int _age;
//    int age;
//}

@end

//void test()
//{
//    void *p1 = test;
//    void *p2 = &test;
////    NSLog(@"%p",test);
////    NSLog(@"%p",&test);
//} 可以看到通过 方法名和方法取地址获取到的值是一样的。说明这个不是一个变量
//11_26_ios_oc`test:
//    0x10e5f1e60 <+0>:  pushq  %rbp
//    0x10e5f1e61 <+1>:  movq   %rsp, %rbp
//    0x10e5f1e64 <+4>:  leaq   -0xb(%rip), %rax          ; <+0> at ViewController.m:15
//    0x10e5f1e6b <+11>: movq   %rax, -0x8(%rbp)
//    0x10e5f1e6f <+15>: movq   %rax, -0x10(%rbp)
//->  0x10e5f1e73 <+19>: popq   %rbp
//    0x10e5f1e74 <+20>: retq


void test()
{
    void *p1 = test;
    void *p2 = &test;
    
    NSLog(@"%p",test);
    NSLog(@"%p",&p2);
    void *p = malloc(1);
    
    NSLog(@"%p",p);
    
    
    
    

//    NSLog(@"%p",&test);
}



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self func];
    
//    test();
    
//    self.age = 100;
    self.name = @"delims";
    
    char *str = "234";
    NSLog(@"%p",[[ViewController copy] copy]);
    NSLog(@"%p",[ViewController copy]);
    NSLog(@"%p",[ViewController copy]);

//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        self.age = 102;
//    });

    
    [self performSelector:@selector(workman)];
    
}

void impp(id self, SEL _cmd)
{
    NSLog(@"执行了");
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    if ([NSStringFromSelector(sel) isEqualToString:@"workman"]) {
        NSLog(@"没有找到 %p",sel);
        
//        NSLog(@"这是方法吗 %s",(char *)sel);

        class_addMethod(self, sel, (void (*)(void))impp, "v@:");
    }
    
    return YES;
}


- (void)func
{
    NSLog(@"origin method");
}

+ (BOOL)accessInstanceVariablesDirectly
{
    return YES;
    
}
@end



//
//@interface ViewController (delims)
//- (void)func;
//@end
//
//
//@implementation ViewController (delims)
//
//- (void)func
//{
//    NSLog(@"category method");
//}
//
//@end
//
//@interface ViewController (delims2)
//- (void)func;
//@end
//
//
//@implementation ViewController (delims2)
//
//- (void)func
//{
//    NSLog(@"category method2");
//}
//
//@end
