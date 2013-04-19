//
//  PlayerEntity.m
//  GossipLeague
//
//  Created by Oriol Blanc on 25/03/13.
//  Copyright (c) 2013 Gossip. All rights reserved.
//

#import "PlayerEntity.h"

@implementation PlayerEntity

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    if ((self = [self init]))
    {
        if ([dictionary isKindOfClass:[NSDictionary class]])
            [self parseDictionary:dictionary];
    }
    
    return self;
}

- (void)parseDictionary:(NSDictionary *)feed
{
    if([[feed allKeys] count] == 0) return;
    
    [feed enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        
        if ([key isEqualToString:@"username"])
        {
            self.username = [NSString stringWithFormat:@"%@",obj];
        }
        else if ([key isEqualToString:@"email"])
        {
            self.email = [NSString stringWithFormat:@"%@",obj];
        }
        else if (([key isEqualToString:@"score"]))
        {
            self.score = [obj doubleValue];
        }
        else if (([key isEqualToString:@"countWins"]))
        {
            self.winGames = [obj intValue];
        }
        else if (([key isEqualToString:@"countLosts"]))
        {
            self.lostGames = [obj intValue];
        }
        else if (([key isEqualToString:@"countGames"]))
        {
            self.games = [obj intValue];
        }
        else if (([key isEqualToString:@"countDraws"]))
        {
            self.drawGames = [obj intValue];
        }
    }];
}

@end
