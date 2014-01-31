//
//  EventView.m
//  Eventus
//
//  Created by Ross Tang Him on 1/25/14.
//
//

#import "EventView.h"

@interface EventView ()
@property (nonatomic) UIImage *img;
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *description;
@property (nonatomic) NSString *location;
@property (nonatomic) NSString *date;


@end

@implementation EventView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSString *imgPath = [[NSBundle mainBundle] pathForResource:@"default" ofType:@"jpg"];
        _img = [[UIImage alloc] initWithContentsOfFile:imgPath];
        
        [self setOpaque:NO];
        
    }
    return self;
}

- (id)initWithData:(CGRect)frame EventTitle: (NSString *)title EventDescription: (NSString *)description EventLocation: (NSString *)location EventDate: (NSString *)date
{
    self = [super initWithFrame:frame];
    if (self) {
//        NSString *imgPath = [[NSBundle mainBundle] pathForResource:@"default" ofType:@"jpg"];
//        _img = [[UIImage alloc] initWithContentsOfFile:imgPath];
//        _title = title;
//        _description = description;
//        _location = location;
//        _date = date;
        
        [self setOpaque:NO];
        
    }
    return self;
}

-(void) uTitle: (NSString *) title {
    _title = title;
}
-(void) uDescription: (NSString *) description {
    _description = description;
}
-(void) uLocation: (NSString *) location {
    _location = location;
}
-(void) uDate: (NSString *) date {
    _date = date;
}


- (void)drawRect:(CGRect)rect
{
    //background color
    [[UIColor lightGrayColor] setFill];
    UIRectFill(rect);
    
    const CGFloat p = 10; //padding

    const CGFloat shadowOffset = 0.5;
    const CGFloat shadowBlur = 4;
    const CGFloat cornerRadii = 1;


    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, 1.0);
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);

    CGContextSetShadow(context, CGSizeMake(shadowOffset, shadowOffset), shadowBlur);

    //frame of cell
    CGRect frame = CGRectMake(p, p, rect.size.width-2*p, rect.size.height-2*p);

    UIBezierPath *framePath =
    [UIBezierPath bezierPathWithRoundedRect:frame
                          byRoundingCorners:UIRectCornerAllCorners
                                cornerRadii:CGSizeMake(cornerRadii, cornerRadii)
     ];
    CGContextAddPath(context, framePath.CGPath);
    CGContextFillPath(context);

    CGRect imgFrame = CGRectMake(p+frame.origin.x, p+frame.origin.y,
                                 frame.size.width-2*p, frame.size.height*0.75-2*p);
//    [_img drawInRect: imgFrame];
    
    CGRect detailFrame = CGRectMake(imgFrame.origin.x, imgFrame.origin.y + imgFrame.size.height, imgFrame.size.width, frame.size.height*0.25-p);
    CGContextSetRGBFillColor(context, 0.9, 0.9, 0.9, 1.0);

    CGContextAddRect(context, detailFrame);
    CGContextFillPath(context);
    
    //draw frames of detail and img
    CGContextSetShadow(context, CGSizeMake(0, 0), 0);
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1.0);
    CGContextAddRect(context, imgFrame);
    CGContextAddRect(context, detailFrame);
    CGContextSetLineWidth(context, 0.2);
    CGContextStrokePath(context);

    //detail frames
//    CGRect titleRect = CGRectMake(detailFrame.origin.x+tp, detailFrame.origin.y+tp, detailFrame.size.width/2-2*tp, detailFrame.size.height/2-2*tp);
//    CGRect descriptionRect = CGRectMake(titleRect.origin.x, titleRect.origin.y + titleRect.size.height + tp, titleRect.size.width, titleRect.size.height);
//    CGRect locationRect = CGRectMake(titleRect.origin.x + titleRect.size.width + tp, detailFrame.origin.y+tp, titleRect.size.width, titleRect.size.height);
//    CGRect dateRect = CGRectMake(titleRect.origin.x + titleRect.size.width + tp, titleRect.origin.y + titleRect.size.height + tp, titleRect.size.width, titleRect.size.height);
//
//    UIFont *font = [UIFont systemFontOfSize:20];
//    NSDictionary *titleA = @{ NSFontAttributeName: font
//                                  };
//    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
//    [style setAlignment:NSTextAlignmentRight];
//    NSDictionary *rightAttr = [NSDictionary dictionaryWithObject:style forKey:NSParagraphStyleAttributeName];
//
//    //draw detail
//    [_title drawInRect:titleRect withAttributes:titleA];
//    [_description drawInRect:descriptionRect withAttributes:nil];
//    [_location drawInRect:locationRect withAttributes:rightAttr];
//    [_date drawInRect:dateRect withAttributes:rightAttr];


}


@end
