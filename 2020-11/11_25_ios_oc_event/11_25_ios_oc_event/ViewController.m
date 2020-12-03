//
//  ViewController.m
//  11_25_ios_oc_event
//
//  Created by delims on 2020/11/25.
//

#import "ViewController.h"

@interface MYView : UIView

@end

@implementation MYView

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    NSLog(@"%s",__func__);
//}

//- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    NSLog(@"%s",__func__);
//}
//
//- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    NSLog(@"%s",__func__);
//}
//
//- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    NSLog(@"%s",__func__);
//}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"%s",__func__);
    NSLog(@"%@",event);

}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"%s",__func__);NSLog(@"%@",event);
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"%s",__func__);NSLog(@"%@",event);
}


@end



@interface ViewController ()

@property (nonatomic,assign) int number;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.blackColor;
    
    self.title = [NSString stringWithFormat:@"%i",self.number];

    MYView *view = MYView.new;
    
    view.frame = CGRectMake(100, 100, 200, 300);
    view.backgroundColor = UIColor.grayColor;
    [self.view addSubview:view];
    
    
//    void *a = malloc(18);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
//    NSLog(@"%s",__func__);
//    ViewController *vc = ViewController.new;
//    vc.number = self.number + 1;
//    [self.navigationController pushViewController:vc animated:YES];

}
//
//- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    NSLog(@"%s",__func__);
//}
//
//- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    NSLog(@"%s",__func__);
//}

//- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    NSLog(@"%s",__func__);
//}

//
//- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
//{
//    NSLog(@"%s",__func__);
//    NSLog(@"%@",event);
//
//}
//
//- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
//{
//    NSLog(@"%s",__func__);NSLog(@"%@",event);
//}
//
//- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
//{
//    NSLog(@"%s",__func__);NSLog(@"%@",event);
//}
//
//
//- (void)remoteControlReceivedWithEvent:(UIEvent *)event
//{
//
//}

@end
