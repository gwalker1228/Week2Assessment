//
//  ViewController.m
//  Week2Assessment
//
//  Created by Gretchen Walker on 5/21/15.
//  Copyright (c) 2015 Gretchen Walker. All rights reserved.
//

#import "RootViewController.h"
#import "CityDetailViewController.h"
#import "City.h"

@interface RootViewController () <UITableViewDataSource, UITableViewDelegate, CityDetailViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property NSMutableArray *cities;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSArray *cityNames = @[@"Washington", @"San Francisco", @"Chevy Chase", @"Clinton"];
    NSArray *cityStates = @[@"District of Columbia", @"California", @"Maryland", @"New York"];
    NSArray *cityWikiExtensions = @[@"Washington,_D.C.", @"San_Francisco", @"Chevy_Chase,_Maryland", @"Clinton,_Oneida_County,_New_York"];

    self.cities = [NSMutableArray new];

    for (int i = 0; i < cityNames.count; i++) {
        City* city = [City cityWithName:cityNames[i] state:cityStates[i] wikiExtension:cityWikiExtensions[i]];
        [self.cities addObject:city];
    }
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CityCell" forIndexPath:indexPath];

    City* city = [self.cities objectAtIndex:indexPath.row];

    cell.textLabel.text = city.name;
    cell.detailTextLabel.text = city.state;
    cell.imageView.image = city.image;

    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.cities.count;
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {

    [self.cities removeObjectAtIndex:indexPath.row];
    [tableView reloadData];
}


-(void)cityDetailViewController:(id)viewController didPressUpdateButtonForCity:(NSString *)cityName {

    self.title = cityName;
}

-(void)cityDetailViewController:(id)viewController didEditCity:(City *)city {

    [self.tableView reloadData];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)sender {

    CityDetailViewController *cityDetailVC = segue.destinationViewController;
    City* city = [self.cities objectAtIndex:[self.tableView indexPathForCell:sender].row];

    cityDetailVC.city = city;
    cityDetailVC.delegate = self;
}

@end
