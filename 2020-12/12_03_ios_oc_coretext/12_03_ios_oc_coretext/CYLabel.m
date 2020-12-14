//
//  CYLabel.m
//  12_03_ios_oc_coretext
//
//  Created by delims on 2020/12/4.
//

#import "CYLabel.h"
#import <CoreText/CoreText.h>

@implementation CYLabel


static CGFloat getAscent(void *refCon)
{
    NSDictionary *dict = (__bridge NSDictionary*)refCon;
    if (dict) {
        return [dict[@"height"] floatValue];
    }
    return 0.0;
}

static CGFloat getWidth(void *refCon)
{
    NSDictionary *dict = (__bridge NSDictionary*)refCon;
    if (dict) {
        return [dict[@"width"] floatValue];
    }
    return 0.0;
}

static CGFloat getDescent(void *refCon)
{
    return 0.0;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, rect.size.height);
    CGContextScaleCTM(context, 1, -1);
    
    NSAttributedString *string  = self.string;
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathAddRect(path, NULL, (CGRect){CGPointZero,rect.size});
    
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)string);
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, string.length), path, NULL);
    
    CFArrayRef lines = CTFrameGetLines(frame);
    
    CGPoint lineOrigins[CFArrayGetCount(lines)];
    CTFrameGetLineOrigins(frame, CFRangeMake(0, 0), lineOrigins);
    for (int i = 0; i < CFArrayGetCount(lines); i ++) {
        CTLineRef line = CFArrayGetValueAtIndex(lines, i);
        CFArrayRef runs = CTLineGetGlyphRuns(line);
        for (int j = 0; j < CFArrayGetCount(runs); j ++) {
            CTRunRef run = CFArrayGetValueAtIndex(runs, j);
            CFDictionaryRef attributes = CTRunGetAttributes(run);
            CTRunDelegateRef delegate = CFDictionaryGetValue(attributes, kCTRunDelegateAttributeName);
            if (delegate) {
                CGFloat ascent;
                CGFloat descent;
                CGFloat width = CTRunGetTypographicBounds(run, CFRangeMake(0, 0), &ascent, &descent, NULL);
                CGFloat offset = CTLineGetOffsetForStringIndex(line, CTRunGetStringRange(run).location, NULL);
                CGPoint origin = lineOrigins[i];
                origin.x += offset;
                CGRect imagepostion = (CGRect){origin,width,ascent+descent};
                UIImage *image = [UIImage imageNamed:@"1"];
                CGContextDrawImage(context, imagepostion, image.CGImage);
            }
            
        }
    }
    
//    NSLog(@"%@",NSStringFromCGRect(CGPathGetBoundingBox(path))) ;
//    NSDictionary *ctFrameAttributes = (NSDictionary *)CTFrameGetFrameAttributes(frame);
//    NSLog(@"FrameAttributes = %@", ctFrameAttributes);
    
    
    CTFrameDraw(frame, context);
    
}

- (NSAttributedString*)string
{
    NSMutableAttributedString *attributedString = NSMutableAttributedString.alloc.init;
    
    [attributedString appendAttributedString:[NSAttributedString.alloc initWithString:@"这是第一行\n"]];
    [attributedString appendAttributedString:[NSAttributedString.alloc initWithString:@"这是第2行"]];
    [attributedString appendAttributedString:[NSAttributedString.alloc initWithString:@"这是第3行"]];
    
    unichar imageholder = 0xFFFC;
    NSMutableAttributedString *imageAttr = [NSMutableAttributedString.alloc initWithString:
                                            [NSString stringWithCharacters:&imageholder length:1]];
    
    CTRunDelegateCallbacks callbacks;
    memset(&callbacks, 0, sizeof(callbacks));

    callbacks.getAscent = getAscent;
    callbacks.getDescent = getDescent;
    callbacks.getWidth = getWidth;
    UIImage *image = [UIImage imageNamed:@"1"];
    NSDictionary *metaData = @{@"width":@(image.size.width * 0.5),@"height":@(image.size.height* 0.5)};
    
    
    CTRunDelegateRef delegate = CTRunDelegateCreate(&callbacks, (__bridge_retained void *)metaData);
    CFAttributedStringSetAttribute((CFMutableAttributedStringRef)imageAttr, CFRangeMake(0, 1), kCTRunDelegateAttributeName, delegate);
    
    [attributedString appendAttributedString:imageAttr];
    [attributedString appendAttributedString:[NSAttributedString.alloc initWithString:@"这是后面第11行"]];
    [attributedString appendAttributedString:[NSAttributedString.alloc initWithString:@"这是后面第12行"]];
    [attributedString appendAttributedString:[NSAttributedString.alloc initWithString:@"这是第14行"]];
    
//    [attributedString addAttribute:NSForegroundColorAttributeName value:UIColor.blueColor range:NSMakeRange(0, attributedString.length)];

    return attributedString.copy;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = UIColor.whiteColor;
    }
    return self;
}

@end
