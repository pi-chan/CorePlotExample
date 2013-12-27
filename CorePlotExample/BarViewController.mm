//
//  BarViewController.m
//  CorePlotExample
//
//  Created by Hiromasa OHNO on 2013/12/27.
//  Copyright (c) 2013年 xoyip. All rights reserved.
//

#import "BarViewController.h"

@interface BarViewController ()

@end

@implementation BarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self setupChartA];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupChartA
{
    CGRect rect = CGRectMake(10, 40, 300, 300);
    CPTGraphHostingView* hostingView = [[CPTGraphHostingView alloc] initWithFrame:rect];
    hostingView.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    CPTGraph* graph = [[CPTXYGraph alloc] initWithFrame:rect];
    hostingView.hostedGraph = graph;
    [self.view addSubview:hostingView];
    
    CPTTheme* theme = [CPTTheme themeNamed:kCPTPlainWhiteTheme];
    [graph applyTheme:theme];
    
    CPTBarPlot* plot = [[CPTBarPlot alloc] init];
    plot.identifier = @"BAR";
    plot.dataSource = self;
    [graph addPlot:plot];
    graph.axisSet = nil;
    
    CPTXYPlotSpace* plotSpace = (CPTXYPlotSpace*)graph.defaultPlotSpace;
    plotSpace.xRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromInt(-1) length:CPTDecimalFromInt(6)];
    plotSpace.yRange = [CPTPlotRange plotRangeWithLocation:CPTDecimalFromInt(0) length:CPTDecimalFromInt(16)];

    _data.clear();
    _data.push_back(10);
    _data.push_back(5);
    _data.push_back(15);
    _data.push_back(8);
    _data.push_back(2);
}

- (NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot
{
    return (int)_data.size();
}

- (NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)idx
{
    if(fieldEnum == CPTBarPlotFieldBarLocation){
        return [NSNumber numberWithInt:idx];
    }
    return [NSNumber numberWithFloat:_data[idx]];
}

@end
