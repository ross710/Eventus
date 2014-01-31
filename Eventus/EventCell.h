//
//  EventCell.h
//  Eventus
//
//  Created by Ross Tang Him on 1/25/14.
//
//

#import <UIKit/UIKit.h>

@interface EventCell : UITableViewCell
- (id)initWithData:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier EventTitle: (NSString *)title EventDescription: (NSString *)description EventLocation: (NSString *)location EventDate: (NSString *)date;
@end
