//
//  CityDetailViewController.h
//  Week2Assessment
//
//  Created by Gretchen Walker on 5/21/15.
//  Copyright (c) 2015 Gretchen Walker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"

@protocol CityDetailViewControllerDelegate <NSObject>

-(void)cityDetailViewController:(id)viewController didPressUpdateButtonForCity:(NSString *)cityName;
-(void)cityDetailViewController:(id)viewController didEditCity:(City *)city;

@end

@interface CityDetailViewController : UIViewController

@property City *city;
@property id<CityDetailViewControllerDelegate> delegate;


@end
