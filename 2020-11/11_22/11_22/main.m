//
//  main.m
//  11_22
//
//  Created by delims on 2020/11/21.
//

#import <Foundation/Foundation.h>
#import "TestISA.h"

#   define ISA_BITFIELD                                                      \
      uintptr_t nonpointer        : 1;                                       \
      uintptr_t has_assoc         : 1;                                       \
      uintptr_t has_cxx_dtor      : 1;                                       \
      uintptr_t shiftcls          : 33; /*MACH_VM_MAX_ADDRESS 0x1000000000*/ \
      uintptr_t magic             : 6;                                       \
      uintptr_t weakly_referenced : 1;                                       \
      uintptr_t deallocating      : 1;                                       \
      uintptr_t has_sidetable_rc  : 1;                                       \
      uintptr_t extra_rc          : 19

#   define ISA_BITFIELD_mac                                                        \
      uintptr_t nonpointer        : 1;                                         \
      uintptr_t has_assoc         : 1;                                         \
      uintptr_t has_cxx_dtor      : 1;                                         \
      uintptr_t shiftcls          : 44; /*MACH_VM_MAX_ADDRESS 0x7fffffe00000*/ \
      uintptr_t magic             : 6;                                         \
      uintptr_t weakly_referenced : 1;                                         \
      uintptr_t deallocating      : 1;                                         \
      uintptr_t has_sidetable_rc  : 1;                                         \
      uintptr_t extra_rc          : 8

struct isa_bit {
//    ISA_BITFIELD_mac;
//    ISA_BITFIELD;
    uintptr_t nonpointer        : 1;
    uintptr_t has_assoc         : 1;
    uintptr_t has_cxx_dtor      : 1;
    uintptr_t shiftcls          : 44; /*MACH_VM_MAX_ADDRESS 0x7fffffe00000*/
    uintptr_t magic             : 6;
    uintptr_t weakly_referenced : 1;
    uintptr_t deallocating      : 1;
    uintptr_t has_sidetable_rc  : 1;
    uintptr_t extra_rc          : 8;
};


int retainCount(NSObject *obj, int *rc)
{
    unsigned long isa = (unsigned long)*(void**)(__bridge void*)obj;
//    NSLog(@"has_sidetable_rc = %i",((isa >> 55)&1));
    
//    NSLog(@"nonp  %lu",isa & 1);
//    NSLog(@"assoc %lu",isa & 2);
//    NSLog(@"dtor  %lu",isa & 4);
//    NSLog(@"magic %lx",(isa >> 47 )& 0B111111L);
//    NSLog(@"weak  %lx",(isa >> 53 )& 1);
//    NSLog(@"deall %lx",(isa >> 54 )& 1);

    *rc = ((isa >> 55)&1);
    return (isa >> 56);
}

static NSObject *static_p = nil;

//struct father {
//private:
//    int isa;
//
//public:
//    void setA(int a){
//        isa = a;
//    }
//    int getA()
//    {
//        return isa;
//    }
//};
//
//struct son:father {
//
//};


int main(int argc, const char * argv[]) {
    
    
//    NSString *a = [NSString stringWithFormat:@"abcde"];
//    NSNumber *b = [NSNumber numberWithInt:128];
    
    
    
    
    
    
    
//    @autoreleasepool {
//        // insert code here...
//        NSLog(@"Hello, World!");
//    }
    NSArray *obj =  [NSArray arrayWithObjects:@"123",@"1223", nil];
//    __weak NSObject *obj2 = obj;
//    NSMutableArray *array = @[].mutableCopy;
//    int rc = 0;
//    for (int i = 0; i < 256; i ++) {
//        [array addObject:obj];
//        int count = retainCount(obj, &rc);
//        NSLog(@"引用计数 = %i  sidetable = %i",count,rc);
//    }
//
//    for (int i = 0; i < 1; i ++) {
//        [array removeObject:obj];
//        int count = retainCount(obj, &rc);
//        NSLog(@"引用计数 = %i  sidetable = %i",count,rc);
//    }

    
//    Class cls = [NSObject class];
//
//    NSLog(@"obj adress   : %p",obj);
//    NSLog(@"isa value    : %p",*(void**)(__bridge void*)obj);
//    NSLog(@"isa value    : %p",*(void**)(__bridge void*)obj);
//
//    void *p = *(void**)(__bridge void*)obj;
//    p = (void*)((unsigned long)p & (0x7ffffffffff8));
//    NSLog(@"obj suppepCls: %p",p);
//    NSLog(@"realysupCls  : %p",TestISA.class);
//
//
//    NSLog(@"TestISA's isa: %p",*(void**)p);
//    NSLog(@"TestISA's isa: %p",**(void***)p);
//
//
//
//
//    NSLog(@"NSObject Clas: %p",NSObject.class);
//    NSLog(@"NSObjectISA  : %p",*(void**)(__bridge void*)(NSObject.class));
//    NSLog(@"NSObjectISA's: %p",**(void***)(__bridge void*)(NSObject.class));
//
//
//    NSLog(@"%lx",1UL<<64);
//
//
    
//    unsigned long isa = (unsigned long)*(void**)(__bridge void*)(TestISA.new);
//    return (isa >> 56);
    
//    TestISA *weakobj = TestISA.new;
    
//        unsigned long isa = (unsigned long)*(void**)(__bridge void*)(weakobj);
    //    return (isa >> 56);
    
    
//    NSLog(@"引用计数 = %i",isa >> 56);
//
//    int a = 0x12345678;
////    NSLog(@"%x",*((char*)&a ));
//    NSLog(@"%p",&a);
    
//    NSLog(@"= %lu",sizeof(struct isa_bit));
//
//    Class clas = NSObject.class;
//    id obj =  [[clas alloc] init];
//    struct isa_bit *p = (__bridge struct isa_bit *)obj;
//
//    unsigned long isa = (unsigned long)*(void**)(__bridge void*)obj;
//
////    struct isa_bit bit;
////    memcpy(&bit, (__bridge void*)obj, sizeof(struct isa_bit));
//
//    __weak NSObject* wb  = obj;
//
    NSMutableArray *array = @[].mutableCopy;
////    int rc = 0;
    for (int i = 0; i < 100; i ++) {
        [array addObject:obj];
    }
    
    CFArrayRef arrayref = (__bridge_retained CFArrayRef)obj;
    

    CFRelease(arrayref);
//
//        for (int i = 0; i < 256; i ++) {
//            [array addObject:obj];
//            int rc;
//            int count = retainCount(obj, &rc);
//            NSLog(@"引用计数 = %i  sidetable = %i",count,rc);
//        }
//
    struct isa_bit *bit = (__bridge struct isa_bit *)obj;
    
    


    NSLog(@"nonpointer      = %i",(*bit).nonpointer);
    NSLog(@"has_assoc       = %i",(*bit).has_assoc);
    NSLog(@"has_cxx_dtor    = %i",(*bit).has_cxx_dtor);
    NSLog(@"shiftcls        = 0x%lx",(unsigned long)(*bit).shiftcls << 3);
    NSLog(@"magic           = 0x%x",(*bit).magic);
    NSLog(@"weakly_referenc = %i",(*bit).weakly_referenced);
    NSLog(@"deallocating    = %i",(*bit).deallocating);
    NSLog(@"has_sidetab_rc  = %i",(*bit).has_sidetable_rc);
    NSLog(@"extra_rc        = %x",(*bit).extra_rc);
//    NSLog(@"class class     = %p",clas);
    
    return 0;
}
