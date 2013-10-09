//
//  GRDGreed.h
//  greedwithblocks
//
//  Created by Mark Haskamp on 10/8/13.
//  Copyright (c) 2013 Mark Haskamp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GRDGreed : NSObject

@property(nonatomic) int score;

- (id) initWithDice:(NSMutableArray *)dice;
- (void) buildScore:(NSMutableArray *)dice;

- (bool) threeOfAKindForDice:(NSMutableArray *)dice
                      ForDie:(int)die;


@end
