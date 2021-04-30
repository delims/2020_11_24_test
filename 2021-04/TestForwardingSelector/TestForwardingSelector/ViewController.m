//
//  ViewController.m
//  TestForwardingSelector
//
//  Created by delims on 2021/4/9.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import <objc/message.h>

@interface People : NSObject



@end

@implementation People

-(void) sayBye:(NSString *)name {
    NSLog(@"bye bye %@",name);
}

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self performSelector:@selector(sayBye:) withObject:@"张三"];
//    [self sayBye:@"zhangsan"];
    [self aaa:1];
//    [self.class aaa:1 :2];
    
}

//+ (BOOL)resolveClassMethod:(SEL)sel
//{
//    class_addMethod(self, <#SEL  _Nonnull name#>, <#IMP  _Nonnull imp#>, <#const char * _Nullable types#>)
//    return NO;
//}
+ (BOOL)resolveInstanceMethod:(SEL)sel
{

    return  NO;
}

//-(void) sayGoodBye:(NSString *)name {
//    NSLog(@"bye bye %@",name);
//}

- (void) helloGoodbye:(NSString *) name{
    NSLog(@"==========ddddd %@",name);
}

void sayGoodBye(id obj,IMP cmd,NSString *name){
    NSLog(@"=========%@",name);
}

//+ (BOOL)resolveInstanceMethod:(SEL)sel {
//    NSLog(@"resolveInstanceMethod");
////    if(@selector(sayBye:) == sel){
//////        return YES;
//////        IMP imp = class_getMethodImplementation([self class], @selector(helloGoodbye:));
//////        class_addMethod([self class],sel, imp,"v@:@");

////        class_addMethod([self class],sel, (IMP)sayGoodBye,"v@:@");
////        return YES;
////    }
//    return [super resolveInstanceMethod:sel];
////    return YES;
//}

//- (id)forwardingTargetForSelector:(SEL)aSelector {
////    NSLog(@"forwardingTargetForSelector");
////    if (aSelector == @selector(sayBye:)){
////        return [People new];
////    }
////    return [super forwardingTargetForSelector:aSelector];
//    return nil;
//}


//- (void)forwardInvocation:(NSInvocation *)anInvocation {
//    NSLog(@"forwardInvocation");
//    SEL sel = anInvocation.selector;
//    People *people = [People new];
////    if([people respondsToSelector:sel]){
////        [anInvocation invokeWithTarget:people];
////    }else{
//        NSString *arg;
////        [anInvocation getArgument:&arg atIndex:2];
////        [self helloGoodbye:arg];
////    }
//    
////    [super forwardInvocation:anInvocation];
//}



- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSLog(@"methodSignatureForSelector %@",NSStringFromSelector(aSelector));
//    if([NSStringFromSelector(aSelector) isEqualToString:@"sayBye:"]){
//        return [NSMethodSignature signatureWithObjCTypes:"v@:@"];
//    }
    
//    NSMethodSignature methodSignatureForSelector:<#(SEL)#>
    return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    
    return [super methodSignatureForSelector:aSelector];
}


@end
