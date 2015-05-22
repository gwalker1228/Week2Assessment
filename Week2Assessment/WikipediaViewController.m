//
//  WikipediaViewController.m
//  Week2Assessment
//
//  Created by Gretchen Walker on 5/21/15.
//  Copyright (c) 2015 Gretchen Walker. All rights reserved.
//

#import "WikipediaViewController.h"
#import "CityDetailViewController.h"


@interface WikipediaViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *wikipediaWebView;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingIndicator;


@end

@implementation WikipediaViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.wikipediaWebView.delegate = self;

    City* city = self.city;

    NSLog(@"%@", city);

    NSString *urlText = [NSString stringWithFormat:@"http://en.wikipedia.org/wiki/%@", city.wikiExtension];

    NSLog(@"%@", urlText);


    NSURL *url = [[NSURL alloc] initWithString:urlText];
    NSURLRequest *urlRequest = [[NSURLRequest alloc ] initWithURL:url];
    [self.wikipediaWebView loadRequest:urlRequest];



}

- (IBAction)onBackPressed:(UIButton *)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"Loading failed");
}

-(void)webViewDidStartLoad:(UIWebView *)webView {
    [self.loadingIndicator startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    self.loadingIndicator.hidden = true;
}

@end
