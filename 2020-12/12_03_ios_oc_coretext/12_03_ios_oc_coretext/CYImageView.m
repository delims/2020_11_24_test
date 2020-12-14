//
//  CYImageView.m
//  12_03_ios_oc_coretext
//
//  Created by delims on 2020/12/4.
//

#import "CYImageView.h"

@implementation CYImageView

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    if (self.image == nil) return;
    CGContextRef context =  UIGraphicsGetCurrentContext();
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, rect.size.height * 1);
    CGContextScaleCTM(context, 1, -1);
    CGContextDrawImage(context, rect, self.image.CGImage);
    
    
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    [self setNeedsDisplay];
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    [self setNeedsDisplay];
}

@end
