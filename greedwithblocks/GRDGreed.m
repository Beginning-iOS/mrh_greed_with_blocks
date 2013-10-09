//
//  GRDGreed.m
//  greedwithblocks
//
//  Created by Mark Haskamp on 10/8/13.
//  Copyright (c) 2013 Mark Haskamp. All rights reserved.
//

#import "GRDGreed.h"

@implementation GRDGreed {
    // reset dice block variable
    int score;
    NSMutableArray * (^resetDice)(NSMutableArray *);

}

@synthesize score;



- (id) initWithDice:(NSMutableArray *)dice {
    self = [super init];
    [self buildScore:dice];
    
    return self;
}

- (void)buildScore:(NSMutableArray *)dice {
    int totalScore = 0;
    
    while (dice != nil && ([dice count] > 0)) {

        if ([self threeOfAKindForDice:dice ForDie:1]) {
            resetDice = ^NSMutableArray *(NSMutableArray *dice) {
                int counter = 0;
                int diceTotal = (int)[dice count];
                for (int ndx = (diceTotal - 1); ndx >= 0; ndx-- ) {

                    if ([dice objectAtIndex:ndx] == [NSNumber numberWithInt:(1)]) {
                        [dice removeObjectAtIndex:ndx];
                        
                        if (++counter == 3) {
                            break;
                        }
                    }
                }
                
                return dice;
            };
            score = 1000;
        }
        else if ([self oneOfAKindForDice:dice ForDie:1]) {
            resetDice =^NSMutableArray *(NSMutableArray *dice) {
                int ndx = 0;
                NSNumber *currentDice = [dice objectAtIndex:ndx];
                
                while ([currentDice intValue] != 1) {
                    ndx++;
                    currentDice = [dice objectAtIndex:ndx];
                }
                [dice removeObjectAtIndex:ndx];
                return dice;
            };
            score = 100;
            
        }
        
        totalScore += score;
        dice = resetDice(dice);
        
    }
}

- (bool) threeOfAKindForDice:(NSMutableArray *)dice ForDie:(int)die {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF == %d", die];
    NSArray *filteredDice = [dice filteredArrayUsingPredicate:predicate];
    
    if ([filteredDice count] >= 3) {
        return true;
    }
    
    return false;
}

- (bool) oneOfAKindForDice:(NSMutableArray *)dice ForDie:(int)die {
    for (int ndx = 0; ndx < [dice count]; ndx++) {
        if ([[dice objectAtIndex:ndx] integerValue] == die) {
            return true;
        }
    }
    
    return false;
}






@end
