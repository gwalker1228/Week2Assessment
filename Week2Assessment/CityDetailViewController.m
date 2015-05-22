//
//  CityDetailViewController.m
//  Week2Assessment
//
//  Created by Gretchen Walker on 5/21/15.
//  Copyright (c) 2015 Gretchen Walker. All rights reserved.
//

#import "CityDetailViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "WikipediaViewController.h"

@interface CityDetailViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *cityName;
@property (weak, nonatomic) IBOutlet UITextField *cityState;

@property (weak, nonatomic) IBOutlet UIImageView *cityImage;
@property (weak, nonatomic) IBOutlet UILabel *showWiki;

@end

@implementation CityDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.cityName.text = self.city.name;
    self.cityState.text = self.city.state;


    self.cityName.layer.borderWidth = 0.0f;
    self.cityName.layer.borderColor = [UIColor clearColor].CGColor;
    self.cityName.layer.cornerRadius = 5;

    self.cityState.layer.borderWidth = 0;
    self.cityState.layer.cornerRadius = 5;

    self.showWiki.text = [NSString stringWithFormat:@"%@ on Wikipedia", self.city.name];

    self.cityName.delegate = self;
    self.cityState.delegate = self;

    self.cityImage.image = self.city.image;


}

- (IBAction)onUpdatePressed:(UIButton *)sender {
    [self.delegate cityDetailViewController:self didPressUpdateButtonForCity:self.city.name];
}

- (IBAction)screenTapped:(UIGestureRecognizer *)sender {
    CGPoint point = [sender locationInView:self.view];


    if (!(CGRectContainsPoint(self.cityName.frame, point)) &&
        !(CGRectContainsPoint(self.cityState.frame, point))) {
        [self.view endEditing:YES];

    }

    if ((CGRectContainsPoint(self.showWiki.frame, point))) {

        [self performSegueWithIdentifier:@"WikipediaSegue" sender:self];
    }

}

-(void)textFieldDidBeginEditing:(UITextField *)textField {


    textField.layer.borderWidth = 1;
    [textField setBackgroundColor:[UIColor whiteColor]];
    textField.backgroundColor = [UIColor whiteColor];
}

-(void)textFieldDidEndEditing:(UITextField *)textField {

    textField.layer.borderWidth = 0;
    [textField setBackgroundColor:self.view.backgroundColor];

    if (textField.text.length > 0) {
        if (textField.tag == 0) {
            self.city.name = textField.text;
        }
        else {
            self.city.state = textField.text;
        }
    }

    //[self resignFirstResponder];
    [self.delegate cityDetailViewController:self didEditCity:self.city];


}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    WikipediaViewController *wikiVC = segue.destinationViewController;

    wikiVC.city = self.city;
}


@end
