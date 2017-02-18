//
//  PrimeNumbersViewController.m
//  Prime Numbers
//
//  Created by Christian Deliens on 2/18/17.
//  Copyright © 2017 Christian Deliens. All rights reserved.
//

#import "PrimeNumbersViewController.h"
#import "PrimeCustomTableViewCell.h"

@interface PrimeNumbersViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray *dataSource;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation PrimeNumbersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self registerCustomCell];
    [self initializeDataSource];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PrimeCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PrimeCustomTableViewCell"];
    
    NSString *numberToDraw = self.dataSource[indexPath.row];
    [cell setupCellWithNumber:numberToDraw];
    return cell;
}

-(void) initializeDataSource{
    self.dataSource = [NSMutableArray new];
    for(int index=1; index < 1000; index++){
        if ([self isPrime:index]){

            [self.dataSource addObject:[NSString stringWithFormat:@"%d", index]];
        }
    }
}

- (BOOL) isPrime:(int)number{
    BOOL result = NO;
    
    if (number == 2 || number == 3 || number == 5)
    {
        result =  YES;
    }
    else if (number == 1)
    {
        result = NO;
    }
    else if (number % 2 != 0 && number % 3 != 0 && number % 5 != 0){
        result = YES;
    
    }
    return result;
}

- (void) registerCustomCell{
    UINib *nib = [UINib nibWithNibName:@"PrimeCustomTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"PrimeCustomTableViewCell"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
