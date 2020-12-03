//
//  ViewController.m
//  12_02_ios_oc
//
//  Created by delims on 2020/12/2.
//

#import "ViewController.h"

@interface MyView : UIView <CALayerDelegate>


@end

@implementation MyView

- (void)displayLayer:(CALayer *)layer
{
//    [super displayLayer:layer];
    
    NSLog(@"display layer : %p",layer);
}

+ (Class)layerClass
{
    return CATiledLayer.class;
}

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;


    
    NSLog(@"卧槽");
    
    MyView *view = MyView.alloc.init;
    [self.view addSubview:view];
    
    view.frame = CGRectMake(10, 100, 200, 200);
//    view.backgroundColor = UIColor.lightGrayColor;
    view.layer.backgroundColor = UIColor.lightGrayColor.CGColor;
    
    [view.layer setNeedsDisplay];
    dispatch_after(dispatch_time(DISPATCH_WALLTIME_NOW, 2 *NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [view.layer setNeedsDisplay];
    });
    
    // Do any additional setup after loading the view.
}





@end
