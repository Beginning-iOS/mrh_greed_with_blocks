//
//  main.m
//  greedwithblocks
//
//  Created by Mark Haskamp on 10/8/13.
//  Copyright (c) 2013 Mark Haskamp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GRDGreed.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSNumber *one, *five;
        one = [NSNumber numberWithInt:(1)];
        five = [NSNumber numberWithInt:(5)];
        

        GRDGreed *greed = [GRDGreed alloc];

        // [1] = 100
        NSMutableArray *dice;
        dice = [NSMutableArray arrayWithObjects:one, nil];
        NSLog(@"[1] = %d", [[greed initWithDice:dice] score]);

        
        // [1,1,1] = 1000
        [dice removeAllObjects];
        dice = [NSMutableArray arrayWithObjects:one, [one copy], [one copy], nil];
        NSLog(@"[1, 1, 1] = %d", [[greed initWithDice:dice] score]);
        
    }
    return 0;
}

