//
//  ViewController.m
//  CrapChat
//
//  Created by Marc Baselga on 25/01/14.
//  Copyright (c) 2014 Marc Baselga. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *TextField;
@property (strong,nonatomic)NSArray * fontArray;

@property (strong,nonatomic)NSArray * fontNameArray;
@property (weak, nonatomic) IBOutlet UITableView *fontTableView;
@property (assign, nonatomic) BOOL isAlreadyDragging;
@property (assign, nonatomic) CGPoint oldTouchPoint;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.fontNameArray = [[NSArray alloc] initWithObjects:@"AppleGothic",
                          @"HelveticNeue-UltraLight",
                          @"MarkerFelt-Thin",
                          @"Georgia",
                          @"Courier",
                          @"Verdana-Bold",
                          nil];
    int fontSize = 20;
    
    //create an array of fonts
    UIFont* AppleGothic = [UIFont fontWithName:@"AppleGothic" size:fontSize];
    UIFont* ultraLigth = [UIFont fontWithName:@"HelveticNeue-UltraLight" size:fontSize];
    UIFont* marketFelt= [UIFont fontWithName:@"MarkerFelt-Thin" size:fontSize];
    UIFont* georgia = [UIFont fontWithName:@"Georgia" size:fontSize];
    UIFont* courier = [UIFont fontWithName:@"Courier" size:fontSize];
    UIFont* verdana = [UIFont fontWithName:@"Verdana-Bold" size:fontSize];
    
    self.fontArray = [[NSArray alloc] initWithObjects: AppleGothic,ultraLigth, marketFelt, georgia, courier, verdana, nil];
    UIPanGestureRecognizer*panGestureREcognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureDidDrag:)];
    [self.TextField addGestureRecognizer:panGestureREcognizer];
    
}

- (void) panGestureDidDrag: (UIGestureRecognizer*) sender{
    NSLog(@"user is panning");
    CGPoint newTouchPoint = [sender locationInView:self.view];
    self.TextField.center = newTouchPoint;
    if(!self.isAlreadyDragging){
        self.oldTouchPoint = newTouchPoint;
    }
    float dx = newTouchPoint.x - self.oldTouchPoint.x;
     float dy= newTouchPoint.y - self.oldTouchPoint.y;
    
    
    
}
- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString*CellIdentifier = @"Cell";
    UITableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
if (cell==nil)
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    cell.textLabel.text = [NSString stringWithFormat:@"row %d", indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)StampedButtonPressed:(id)sender {
    NSLog(@ "Stamp button pressed: %@", self.TextField.text);
}
- (IBAction)TextFieldDidEndOnExit:(id)sender {
    [sender resignFirstResponder];
}


@end
