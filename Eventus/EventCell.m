//
//  EventCell.m
//  Eventus
//
//  Created by Ross Tang Him on 1/25/14.
//
//

#import "EventCell.h"
#import "EventView.h"
#import "SharedFunctions.h"
@interface EventCell ()
@property (nonatomic) EventView *v;
@end

@implementation EventCell

@synthesize img, title, description, location, date;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGSize sizeOfView = self.bounds.size;
        _v = [[EventView alloc] initWithFrame:
                CGRectMake(0, 0, sizeOfView.width, CELL_HEIGHT)];
        [self addSubview:_v];

        
    }
    return self;
}

- (id)initWithData:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier EventTitle: (NSString *)title EventDescription: (NSString *)description EventLocation: (NSString *)location EventDate: (NSString *)date
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGSize sizeOfView = self.bounds.size;
        _v = [[EventView alloc] initWithData:CGRectMake(0, 0, sizeOfView.width, CELL_HEIGHT)
                                     EventTitle:title
                               EventDescription:description
                                  EventLocation:location
                                      EventDate:date];
        [self addSubview: _v];
         
        const CGFloat p = 10; //padding
        const CGFloat tp = 5; //textPadding

        CGRect frame = CGRectMake(p, p, sizeOfView.width-2*p, CELL_HEIGHT-2*p);

        
        CGRect imgFrame = CGRectMake(p+frame.origin.x, p+frame.origin.y,
                                     frame.size.width-2*p, frame.size.height*0.75-2*p);
        
        CGRect detailFrame = CGRectMake(imgFrame.origin.x, imgFrame.origin.y + imgFrame.size.height, imgFrame.size.width, frame.size.height*0.25-p);

        //detail frames
        CGRect titleRect = CGRectMake(detailFrame.origin.x+tp, detailFrame.origin.y+tp, detailFrame.size.width-2*tp, detailFrame.size.height/2-2*tp);
        CGRect descriptionRect = CGRectMake(titleRect.origin.x, titleRect.origin.y + titleRect.size.height + tp, titleRect.size.width/2, titleRect.size.height);
        CGRect locationRect = CGRectMake(titleRect.origin.x + titleRect.size.width/2 + tp, detailFrame.origin.y+tp, titleRect.size.width/2, titleRect.size.height);
        CGRect dateRect = CGRectMake(titleRect.origin.x + titleRect.size.width/2 + tp, titleRect.origin.y + titleRect.size.height + tp, titleRect.size.width/2 -tp, titleRect.size.height);
        
        self.img = [[UIImageView alloc] initWithFrame:imgFrame];
        self.title = [[UILabel alloc] initWithFrame:titleRect];
        self.description = [[UILabel alloc] initWithFrame:descriptionRect];
        self.location = [[UILabel alloc] initWithFrame:locationRect];
        self.date = [[UILabel alloc] initWithFrame:dateRect];
        
        [self.img setContentMode:UIViewContentModeScaleAspectFill];
        [self.img setClipsToBounds:YES];
        [self.title setFont:[UIFont systemFontOfSize:20]];
        [self.description setFont:[UIFont systemFontOfSize:10]];
        [self.location setFont:[UIFont systemFontOfSize:10]];
        [self.date setFont:[UIFont systemFontOfSize:10]];
        
        [self.location setTextAlignment:NSTextAlignmentRight];
        [self.date setTextAlignment:NSTextAlignmentRight];

        [self addSubview:self.img];
        [self addSubview:self.title];
        [self addSubview:self.description];
        [self addSubview:self.location];
        [self addSubview:self.date];



    }
    return self;
}
-(void) update {
    [self.v setNeedsDisplay];
}
//update
-(void) uTitle: (NSString *) title {
    [self.v uTitle:title];
}
-(void) uDescription: (NSString *) description {
    [self.v uDescription:description];
}
-(void) uLocation: (NSString *) location {
    [self.v uLocation:location];
}
-(void) uDate: (NSString *) date {
    [self.v uDate:date];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
