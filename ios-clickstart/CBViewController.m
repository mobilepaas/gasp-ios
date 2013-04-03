#import "CBViewController.h"
#import "CBNetworkClient.h"

@interface CBViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *restaurantList;

@end

@implementation CBViewController


NSMutableArray *arrayColors;

//TODO: UPDATE ME TO YOUR REAL APP!
static NSString *const HOST = @"http://localhost:8080";

/*
 * Initialise the view on loading.
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    arrayColors = [[NSMutableArray alloc] init];
    [arrayColors addObject:@"Red"];
    [arrayColors addObject:@"Orange"];
    [arrayColors addObject:@"Yellow"];
    [arrayColors addObject:@"Green"];
    [arrayColors addObject:@"Blue"];
    [arrayColors addObject:@"Indigo"];
    [arrayColors addObject:@"Violet"];
    
    self.restaurantList.dataSource = self;
    self.restaurantList.delegate = self;
    
    //[[self restaurantList] reloadAllComponents];
}


- (void)loadInitialRestaurants {    
    CBNetworkClient *client = [CBNetworkClient sharedNetworkClient];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSArray *data = [client listRestaurants:HOST];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (data != nil) {
                
            }
        });
    });
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}


- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [arrayColors count];
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [arrayColors objectAtIndex:row];
}


/*
 * this is a placeholder for a method that you can unit tests
 * even if it is in a controller 
 */
- (NSString *)hello:(NSString *)name more:(NSString *)more {
    return name;
}




- (void) showMessage:(NSString *)heading message:(NSString *)message {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:heading
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];

}

@end
