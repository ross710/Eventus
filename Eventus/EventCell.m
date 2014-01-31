//
//  EventCell.m
//  Eventus
//
//  Created by Ross Tang Him on 1/25/14.
//
//

#import "EventCell.h"
#import "EventView.h"
#import "Constants.h"
@interface EventCell ()
//@property (nonatomic) UIImage *img;
//@property (nonatomic) UILabel *title;
//@property (nonatomic) UILabel *description;
//@property (nonatomic) UILabel *date;
@end

@implementation EventCell
//@synthesize img, title, description, date;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGSize sizeOfView = self.bounds.size;
        [self addSubview:
         [[EventView alloc] initWithFrame:
          CGRectMake(0, 0, sizeOfView.width, CELL_HEIGHT)]];

        
    }
    return self;
}

- (id)initWithData:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier EventTitle: (NSString *)title EventDescription: (NSString *)description EventLocation: (NSString *)location EventDate: (NSString *)date
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGSize sizeOfView = self.bounds.size;
        [self addSubview:
         [[EventView alloc] initWithData:CGRectMake(0, 0, sizeOfView.width, CELL_HEIGHT)
                              EventTitle:title
                        EventDescription:description
                           EventLocation:location
                               EventDate:date]];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
