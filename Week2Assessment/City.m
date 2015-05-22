//
//  City.m
//  Week2Assessment
//
//  Created by Gretchen Walker on 5/21/15.
//  Copyright (c) 2015 Gretchen Walker. All rights reserved.
//

#import "City.h"

@implementation City


-(instancetype)initWithName:(NSString *)name state:(NSString *)state wikiExtension:(NSString *)wikiExtension {

    self = [super init];
    self.name = name;
    self.state = state;
    self.wikiExtension = wikiExtension;

    self.image = [UIImage imageNamed:state];

    return self;
}

+(instancetype)cityWithName:(NSString *)name state:(NSString *)state wikiExtension:(NSString *)wikiExtension {
    return [[self alloc] initWithName:name state:state wikiExtension:wikiExtension];
}

@end
