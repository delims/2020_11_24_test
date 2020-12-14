//
//  ViewController.m
//  12_03_ios_oc_coretext
//
//  Created by delims on 2020/12/3.
//

#import "ViewController.h"
#include <CoreText/CoreText.h>
#import "CYImageView.h"
#import "CYLabel.h"

@interface CoreTextView : UIView

@end

@implementation CoreTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.whiteColor;
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    NSLog(@"调用了drawrect");
    
    
//
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
//    CGContextTranslateCTM(context, 0, self.bounds.size.height);
//    CGContextScaleCTM(context, 1, -1);
//
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathAddRect(path, NULL, self.bounds);
//
//    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:18],
//                                 NSForegroundColorAttributeName:UIColor.blueColor,
//    };
//    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:@"Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Hello world Helello world Hello world Hello world Hello world Helello world Hello world Hello world Hello world Helello world Hello world Hello world Hello world Helello world Hello world Hello world Hello world Helello world Hello world Hello world Hello world Hello world" attributes:attributes];
//
//    UIImage *image = [UIImage imageNamed:@"1"];
//    CGFloat scale = 0.3;
//    CGRect imageFrame = CGRectMake(100, 300, image.size.width * scale, image.size.height * scale);
//
//    imageFrame.origin.y = rect.size.height - imageFrame.size.height - imageFrame.origin.y;
//
//    CGContextDrawImage(context, imageFrame, image.CGImage);
//
//
//    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attrStr);
//    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, attrStr.length), path, NULL);
//    NSArray *lines = (NSArray *)CTFrameGetLines(frame);
//    CGPoint origins[lines.count];
//    CTFrameGetLineOrigins(frame, CFRangeMake(0, 0), origins);
//
//    for (int i = 0;i < lines.count; i ++) {
//        NSLog(@"%@",NSStringFromCGPoint(origins[i]));
//        UIView *view = UIView.new;
//        view.backgroundColor = UIColor.redColor;
//        view.frame = (CGRect){origins[i],{20,20}};
//        [self addSubview:view];
//    }
//
//    NSLog(@"%f",6.9531702083771615e-310);
//
//    CTFrameDraw(frame, context);
//
        
//    UIBezierPath* p = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10,10,100,100)];
//
//    [[UIColor blueColor] setFill];
//
//    [p fill];
    
//    CGContextRef con = UIGraphicsGetCurrentContext();
//
//    CGContextAddEllipseInRect(con, CGRectMake(0,0,100,100));
//
//    CGContextSetFillColorWithColor(con, [UIColor blueColor].CGColor);
//
//    CGContextFillPath(con);



}



- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    NSLog(@"%s",__func__);
    
    UIGraphicsPushContext(ctx);

    UIBezierPath* p = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0,0,100,100)];

    [[UIColor blueColor] setFill];

    [p fill];

    UIGraphicsPopContext();

}

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
////    [view setNeedsDisplay];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
//        CoreTextView *view = CoreTextView.new;
////        view.frame = CGRectMake(10, 100, 300, 300);
//        view.frame = CGRectMake(0, 44, UIScreen.mainScreen.bounds.size.width, self.view.frame.size.height - 78);
//        [self.view addSubview:view];
//        self.view.backgroundColor = UIColor.grayColor;
//        [view setNeedsDisplay];
//    });
    
//    CYImageView *view = CYImageView.alloc.init;
//    view.image = [UIImage imageNamed:@"1"];
//    view.frame = CGRectMake(0, 100, view.image.size.width * 0.5, view.image.size.height * 0.5);
//    [self.view addSubview:view];
    
    CYLabel *label = CYLabel.new;
    label.frame = CGRectMake(0, 44, UIScreen.mainScreen.bounds.size.width, UIScreen.mainScreen.bounds.size.height-78);
    
    [self.view addSubview:label];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
}


@end
