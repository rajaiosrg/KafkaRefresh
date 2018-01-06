/**
 * Copyright (c) 2016-present, K.
 * All rights reserved.
 *
 * Email:xorshine@icloud.com
 *
 * This source code is licensed under the MIT license.
 */

#import "KafkaNativeFooter.h"
#import "KafkaRefreshCategory.h"

@interface KafkaNativeFooter()

@property (strong, nonatomic) UIActivityIndicatorView * indicator;

@end

@implementation KafkaNativeFooter

- (instancetype)initWithFrame:(CGRect)frame{
	self = [super initWithFrame:frame];
	if (self) {
		[self addSubview:self.indicator];
	}
	return self;
}

- (void)layoutSubviews{
	[super layoutSubviews];
	
	self.indicator.center = CGPointMake(self.width/2., self.height/2.);
}

- (void)kafkaDidScrollWithProgress:(CGFloat)progress max:(const CGFloat)max{
	
}

- (void)kafkaRefreshStateDidChange:(KafkaRefreshState)state{
	[super kafkaRefreshStateDidChange:state];
	switch (state) {
		case KafkaRefreshStateNone:{
			break;
		}
		case KafkaRefreshStateScrolling:{
			break;
		}
		case KafkaRefreshStateReady:{
			break;
		}
		case KafkaRefreshStateRefreshing:{
			[self.indicator startAnimating];
			break;
		}
		case KafkaRefreshStateWillEndRefresh:{
			[self.indicator stopAnimating];
			break;
		}
	}
}

#pragma mark - lazy

- (UIActivityIndicatorView *)indicator{
	if (!_indicator) {
		_indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
		_indicator.hidesWhenStopped = NO;
	}
	return _indicator;
}

@end
