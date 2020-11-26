//
//  AppDelegate.m
//  11_26_ios_oc
//
//  Created by delims on 2020/11/26.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end


struct bits {
    uintptr_t nonpointer        : 1;                                       \
    uintptr_t has_assoc         : 1;                                       \
    uintptr_t has_cxx_dtor      : 1;                                       \
    uintptr_t shiftcls          : 33; /*MACH_VM_MAX_ADDRESS 0x1000000000*/ \
    uintptr_t magic             : 6;                                       \
    uintptr_t weakly_referenced : 1;                                       \
    uintptr_t deallocating      : 1;                                       \
    uintptr_t has_sidetable_rc  : 1;                                       \
    uintptr_t extra_rc          : 19;
};

@interface MyObj : NSObject

@end

@implementation MyObj

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        class A{
            int a = 100;
        };
        
        A a;
    }
    return self;
}

@end

@implementation AppDelegate



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    ViewController *vc = ViewController.new;
//    
//    [vc setValue:@"123" forKey:@"age"];
//    [vc setValue:@"456" forKey:@"_age"];

//    NSLog(@"%@",[[vc valueForKey:@"__age"] stringValue]);
//    NSLog(@"%@",[[vc valueForKey:@"_age"] stringValue]);
    
    NSObject *obj = NSObject.alloc.init;
    
    struct bits *bit = (__bridge struct bits *)obj;
    
     __weak AppDelegate *weakself = obj;
    
//    static __strong AppDelegate *strself = obj;
    
     NSMutableArray *array = @[].mutableCopy;
    
//    [array addObject:self];
//    [array addObject:self];
//    [array addObject:self];
//    [array addObject:self];
    
    for (int i = 0; i < 0x80000; i ++) {
        [array addObject:self];
    }

    NSLog(@"%i",(*bit).nonpointer);
    NSLog(@"%i",(*bit).has_assoc);
    NSLog(@"%i",(*bit).has_cxx_dtor);
    NSLog(@"0x%lx",(*bit).shiftcls);
    NSLog(@"%i",(*bit).magic);
    NSLog(@"%i",(*bit).weakly_referenced);
    NSLog(@"%i",(*bit).deallocating);
    NSLog(@"%i",(*bit).has_sidetable_rc);
    NSLog(@"0x%x",(*bit).extra_rc);

    NSLog(@"%lu",sizeof(struct bits));

    return YES;
}




@end
