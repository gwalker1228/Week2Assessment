//
//  City.h
//  Week2Assessment
//
//  Created by Gretchen Walker on 5/21/15.
//  Copyright (c) 2015 Gretchen Walker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface City : NSObject

@property NSString *name;
@property NSString *state;
@property NSString *wikiExtension;
@property UIImage *image;


-(instancetype)initWithName:(NSString *)name state:(NSString *)state wikiExtension:(NSString *)wikiExtension;

+(instancetype)cityWithName:(NSString *)name state:(NSString *)state wikiExtension:(NSString *)wikiExtension;


@end
