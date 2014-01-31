//
//  Home.m
//  Eventus
//
//  Created by Ross Tang Him on 1/25/14.
//
//

#import "Home.h"
#import "EventView.h"
#import "EventCell.h"
#import "SharedFunctions.h"

#define URL_CONCERTS [NSURL URLWithString:@"http://ws.audioscrobbler.com/2.0/?method=geo.getevents&location=boston&api_key=32e7c43bdb5fa7ddb7c79a357a391ec9&format=json"]

@interface Home ()
@property (nonatomic) NSMutableArray *concerts;
//@property (nonatomic) NSMutableArray *images;

@end

@implementation Home

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        _concerts = [[NSMutableArray alloc]init];
//        _images = [[NSMutableArray alloc]init];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView setBackgroundColor:[UIColor lightGrayColor]];
    
    
    [self queueConcerts];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void) queueConcerts {
    NSURLRequest* request = [NSURLRequest requestWithURL:URL_CONCERTS cachePolicy:0 timeoutInterval:5];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[[NSOperationQueue alloc] init]
                           completionHandler:^(NSURLResponse *response,NSData *data, NSError *error)
     {
         if ([data length] >0 && error == nil)
         {
             [self performSelectorOnMainThread:@selector(receiveConcerts:) withObject:data waitUntilDone:YES];
         }
         else if ([data length] == 0 && error == nil)
         {
             NSLog(@"Nothing was downloaded.");
         }
         else if (error != nil){
             NSLog(@"Error = %@", error);
         }
         
     }];
}
-(void) receiveConcerts: (NSData*) data {
    NSError *e = nil;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &e];
    NSArray *events = [[dict objectForKey:@"events"] objectForKey:@"event"];
//    NSLog(@"Json array %@", events);
    
    NSMutableArray *list = [[NSMutableArray alloc] init];
    for (NSDictionary *event in events) {
//        NSLog(@"TITLE: %@", [event objectForKey:@"title"]);
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
        [dict setObject:[event objectForKey:@"title"] forKey:@"title"];
        [dict setObject:[event objectForKey:@"description"] forKey:@"description"];
        [dict setObject:[event objectForKey:@"venue"] forKey:@"location"];
        [dict setObject:[event objectForKey:@"startDate"] forKey:@"date"];
        
        NSArray *imgs = [event objectForKey:@"image"];
        NSDictionary *imgDict = [imgs objectAtIndex:3];
        NSString *imgURL = [imgDict objectForKey:@"#text"];
        NSURL * imageURL = [NSURL URLWithString:imgURL];
        NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
        UIImage * image = [UIImage imageWithData:imageData];
        
        if (image) {
            [dict setObject:image forKey:@"img"];
        }
        
        [list addObject:dict];

    }
    [self updateConcerts:list];
    
}

-(void) updateConcerts: (NSMutableArray *) concerts {
    self.concerts = concerts;
    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [_concerts count];
}

-(NSString *) parseDate: (NSString *) str {
    return nil;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    EventCell *cell = (EventCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (cell == nil) {
        cell =  [[EventCell alloc] initWithData:UITableViewCellStyleDefault
                                reuseIdentifier:CellIdentifier
                                     EventTitle:[self.concerts objectAtIndex:indexPath.row]
                                    EventDescription:@"This is a test description"
                                  EventLocation:@"Downtown Boston, MA"
                                      EventDate:@"10/2"];
//        NSDictionary *dict = [self.concerts objectAtIndex:indexPath.row];
//
//        NSURL * imageURL = [NSURL URLWithString:[dict objectForKey:@"imgURL"]];
//        NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
//        UIImage * image = [UIImage imageWithData:imageData];
//        
    }
    NSDictionary *dict = [self.concerts objectAtIndex:indexPath.row];
    cell.title.text = [dict objectForKey:@"title"];
    cell.description.text = [dict objectForKey:@"description"];
    cell.date.text = [dict objectForKey:@"date"];
    
    [cell.img setImage:[dict objectForKey:@"img"]];


//    [cell update];
//    NSLog(@"%@ concert", [self.concerts objectAtIndex:indexPath.row]);
//    [cell addSubview:[[EventView alloc] init]];
    // Configure the cell...
//    [cell setBackgroundColor:[UIColor blackColor]];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //hard code width
    return WIDTH;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
