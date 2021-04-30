//
//  ViewController.m
//  openGL
//
//  Created by delims on 2021/4/25.
//

#import "ViewController.h"
#import <OpenGLES/ES1/gl.h>
#include <CoreText/CoreText.h>

@interface MYView : UIView

@end

@implementation MYView

//+ (Class)layerClass
//{
////    return cag.class;
//
//}

@end

@interface ViewController ()
- (void)delims;
@end


static int staic_int = 0;

@implementation ViewController

- (void)delims
{
    NSLog(@"你弄个我看看");
    
    NSLog(@"%p",&staic_int);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SEL sel = (SEL)"delims";
//    [self performSelector:sel];
    SEL sel2 = @selector(delims);
    
    
    [self delims];
    
//    NSString *path = [NSBundle.mainBundle pathForResource:@"12" ofType:@".png"];
//    NSString *path3 = [NSBundle.mainBundle pathForResource:@"13" ofType:@".png"];
//
//    printf("%s\n",path.cString);
//
//    UIImage *image = [UIImage imageWithContentsOfFile:path];
//    UIImage *image3 = [UIImage imageWithContentsOfFile:path3];
//
//    self.view.layer.contents = (__bridge id _Nullable)(image.CGImage);
//
//
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
//
//        UIGraphicsBeginImageContextWithOptions(CGSizeMake(self.view.frame.size.width, self.view.frame.size.height), YES, UIScreen.mainScreen.scale);
//        CGContextRef context = UIGraphicsGetCurrentContext();
//        UIGraphicsBeginImageContextWithOptions(CGSizeMake(100, 100), YES, 2)
//        CGContextSetLineWidth(context, 2);
//        CGContextSetStrokeColorWithColor(context, UIColor.redColor.CGColor);
//        CGContextMoveToPoint(context, 10, 1000);
//        CGContextAddLineToPoint(context, 300, 300);
//        CGContextStrokePath(context);
//        CGContextDrawImage(context, CGRectMake(100, 100, 200, 200), image3.CGImage);
////        CGShadingRef shading;
//        CGContextDrawTiledImage(context, CGRectMake(0, 200,  50 , 50), image3.CGImage);
//        NSAttributedString *string = [NSAttributedString.alloc initWithString:@"12344556"];
//
//        CTFramesetterRef setter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)string);
//        CTFrameRef frame = CTFramesetterCreateFrame(setter, CFRangeMake(0, string.length), NULL,NULL);
//
//        CTFrameDraw(frame, context);
//
//        UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
//        self.view.layer.contents = (__bridge id _Nullable)resultImage.CGImage;
//
//    });
    // Do any additional setup after loading the view.
}

// 大图缩小为显示尺寸的图
- (UIImage *)downsampleImageAt:(NSURL *)imageURL to:(CGSize)pointSize scale:(CGFloat)scale {
    // 利用图像文件地址创建 image source
    NSDictionary *imageSourceOptions = @{
        (__bridge NSString *)kCGImageSourceShouldCache: @NO // 原始图像不要解码
    };
    CGImageSourceRef imageSource = CGImageSourceCreateWithURL((__bridge CFURLRef)imageURL, (__bridge CFDictionaryRef)imageSourceOptions);

    // 下采样
    CGFloat maxDimensionInPixels = MAX(pointSize.width, pointSize.height) * scale;
    NSDictionary *downsampleOptions =
    @{
      (__bridge NSString *)kCGImageSourceCreateThumbnailFromImageAlways: @YES,
      (__bridge NSString *)kCGImageSourceShouldCacheImmediately: @YES,  // 缩小图像的同时进行解码
      (__bridge NSString *)kCGImageSourceCreateThumbnailWithTransform: @YES,
      (__bridge NSString *)kCGImageSourceThumbnailMaxPixelSize: @(maxDimensionInPixels)
       };
    CGImageRef downsampledImage =
    CGImageSourceCreateThumbnailAtIndex(imageSource, 0, (__bridge CFDictionaryRef)downsampleOptions);
    UIImage *image = [[UIImage alloc] initWithCGImage:downsampledImage];
    CGImageRelease(downsampledImage);
    CFRelease(imageSource);

    return image;
}

- (UIImage*)downloadImage:(NSURL *)imageURL to:(CGSize)pointSize scale:(CGFloat)scale
{
    NSDictionary *imageSourceOptions = @{
        (__bridge NSString*)kCGImageSourceShouldCache: @NO
    };
    CGImageSourceRef imageSource = CGImageSourceCreateWithURL((__bridge CFURLRef)imageURL, (__bridge CFDictionaryRef)imageSourceOptions);
    CGFloat maxDimension = MAX(pointSize.width, pointSize.height) * scale;
    NSDictionary *dwonsampleOptions = @{
        (__bridge NSString*)kCGImageSourceCreateThumbnailFromImageAlways:@YES,
        (__bridge NSString*)kCGImageSourceShouldCacheImmediately:@YES,
        (__bridge NSString*)kCGImageSourceCreateThumbnailWithTransform:@YES,
        (__bridge NSString*)kCGImageSourceThumbnailMaxPixelSize:@(maxDimension)
    };
    
    CGImageRef downsampleImage = CGImageSourceCreateThumbnailAtIndex(imageSource, 0,(__bridge CFDictionaryRef)dwonsampleOptions);
    UIImage *image = [UIImage.alloc initWithCGImage:downsampleImage];
    CGImageRelease(downsampleImage);
    CFRelease(imageSource);
    return image;

    
}

@end
