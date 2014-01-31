//
//  EventCell.h
//  Eventus
//
//  Created by Ross Tang Him on 1/25/14.
//
//

#import <UIKit/UIKit.h>

@interface EventCell : UITableViewCell
@property (nonatomic) UILabel *title;
@property (nonatomic) UILabel *description;
@property (nonatomic) UILabel *location;
@property (nonatomic) UILabel *date;
@property (nonatomic) UIImageView *img;



- (id)initWithData:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier EventTitle: (NSString *)title EventDescription: (NSString *)description EventLocation: (NSString *)location EventDate: (NSString *)date;

-(void) uTitle: (NSString *) title;
-(void) uDescription: (NSString *) description;
-(void) uLocation: (NSString *) location;
-(void) uDate: (NSString *) date;

-(void) update;
@end
