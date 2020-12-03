//
//  ViewController.m
//  11_21_ios
//
//  Created by delims on 2020/11/21.
//

#import "ViewController.h"

@interface ViewController ()
{
    CALayer *_obj_layer;
    
    
}
@property (nonatomic,weak) NSObject *proper;

@end



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
    ISA_BITFIELD_mac;
//    ISA_BITFIELD;
};



//int retainCount(NSObject *obj, int *rc)
//{
//    unsigned long isa = (unsigned long)*(void**)(__bridge void*)obj;
////    NSLog(@"has_sidetable_rc = %i",((isa >> 55)&1));
//    *rc = ((isa >> 55)&1);
//    return (isa >> 56);
//}


int retainCount(NSObject *obj, int *rc)
{
    unsigned long isa = (unsigned long)*(void**)(__bridge void*)obj;
//    NSLog(@"has_sidetable_rc = %i",((isa >> 55)&1));
//        NSLog(@"nonp  %lu",isa & 1);
//        NSLog(@"assoc %lu",isa >> 1 & 1);
//        NSLog(@"dtor  %lu",isa >> 2 & 1);
    //    NSLog(@"magic %lx",(isa >> 47 )& 0B111111L);
    //    NSLog(@"weak  %lx",(isa >> 53 )& 1);
    //    NSLog(@"deall %lx",(isa >> 54 )& 1);
    *rc = ((isa >> 55)&1);
    return (isa >> 56);
}

static __weak NSObject *__obj;

struct isa_bit *bit = nil;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    Class clas = NSObject.class;
    
    id obj =  [[clas alloc] init];
    __weak UIResponder* weakobj = obj;
    self.proper = obj;
//    [self.view addSubview:obj];
    
    bit = (__bridge struct isa_bit *)obj;

    NSMutableArray *array = @[].mutableCopy;
//    int rc = 0;
    for (int i = 0; i < 300; i ++) {

        [array addObject:obj];
        NSLog(@"引用计数 = % 3i  sidetable = %i",(*bit).extra_rc,(*bit).has_sidetable_rc);

    }
    
    NSLog(@"nonpointer      = %i",(*bit).nonpointer);
    NSLog(@"has_assoc       = %i",(*bit).has_assoc);
    NSLog(@"has_cxx_dtor    = %i",(*bit).has_cxx_dtor);
    NSLog(@"shiftcls        = 0x%lx",(unsigned long)(*bit).shiftcls << 3);
    NSLog(@"magic           = %i",(*bit).magic);
    NSLog(@"weakly_referenc = %i",(*bit).weakly_referenced);
    NSLog(@"deallocating    = %i",(*bit).deallocating);
    NSLog(@"has_sidetab_rc  = %i",(*bit).has_sidetable_rc);
    NSLog(@"extra_rc        = %x",(*bit).extra_rc);
    
    NSLog(@"UIResponder clas= %p",clas);

    
    
    
    
//    NSLog(@"UIResponder clas= %d",__arm64__);

 
//    NSObject *obj2 = obj;
//    NSMutableArray *array = @[].mutableCopy;
//    int rc = 0;
//    for (int i = 0; i < 500; i ++) {
//
//        [array addObject:obj];
//        int count = retainCount(obj, &rc);
//        NSLog(@"引用计数 = %i  sidetable = %i",count,rc);
//
//    }
//    // Do any additional setup after loading the view.
//
//    NSLog(@"__arm64__ = %i",__arm64__);
//
//    Class cls = [NSObject class];
//
//    NSLog(@"obj adress   : %p",obj);
//    NSLog(@"isa value    : %p",*(void**)(__bridge void*)obj);
////    NSLog(@"isa value    : %p",*(void**)(__bridge void*)obj);
//
//    void *p = *(void**)(__bridge void*)obj;
//    p = (void*)((unsigned long)p & (0x0000000ffffffff8ULL));
//    NSLog(@"obj isa clas : %p",p);
//    NSLog(@"realysupCls  : %p",UIResponder.class);
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
    
    int a = 0x12345678;
    NSLog(@"%x",*((char*)&a ));
    NSLog(@"stack= %p",&a);
    
    int *b = malloc(4);
    NSLog(@"heap = %p",b);
    NSLog(@"stack = %p",&b);
}




- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    int multiple = 100;
    
    int (^block)(int) = ^(int argument) {
        NSLog(@"%i",argument);
        return multiple;
    };
    
    block(200);
    
    
//    NSLog(@"weakly_referenc = %i",(*bit).weakly_referenced);

//#ifdef __arm64__
//    // volatile修饰符能够防止汇编指令被编译器忽略
//    int a = 1;
//    __asm__ __volatile__(
//                         "mov x0, #31\n"
//                         "mov x1, #0\n"
//                         "mov x2, #0\n"
//                         "mov x3, #0\n"
//                         "mov x16, #26\n"
////                         "svc #0x80\n"
//                         );
//#endif
//    NSLog(@"%i",double_num_times(123,2));


}





@end

@interface MYView : UIView

@end

@implementation MYView

- (void)drawRect:(CGRect)rect
{
    
}



@end
