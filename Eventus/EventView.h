//
//  EventView.h
//  Eventus
//
//  Created by Ross Tang Him on 1/25/14.
//
//

#import <UIKit/UIKit.h>

@interface EventView : UIView
- (id)initWithData:(CGRect)frame EventTitle: (NSString *)title EventDescription: (NSString *)description EventLocation: (NSString *)location EventDate: (NSString *)date;
-(void) uTitle: (NSString *) title;
-(void) uDescription: (NSString *) description;
-(void) uLocation: (NSString *) location;
-(void) uDate: (NSString *) date;
@end
