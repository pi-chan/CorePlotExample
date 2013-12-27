//
//  PieViewController.m
//  CorePlotExample
//
//  Created by Hiromasa OHNO on 2013/12/27.
//  Copyright (c) 2013年 xoyip. All rights reserved.
//

#import "PieViewController.h"

@interface PieViewController ()

@end

@implementation PieViewController

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
    hostingView.backgroundColor = [UIColor lightGrayColor];
    CPTGraph* graph = [[CPTXYGraph alloc] initWithFrame:rect];
    graph.axisSet = nil;
    hostingView.hostedGraph = graph;
    [self.view addSubview:hostingView];
    
    CPTPieChart* plot = [[CPTPieChart alloc] init];
    plot.identifier = @"PIE";
    plot.dataSource = self;
    plot.delegate = self;
    [graph addPlot:plot];
    
    plot.pieRadius = 100;

    _data.clear();
    _data.push_back(50);
    _data.push_back(20);
    _data.push_back(15);
    _data.push_back(3);
    _data.push_back(12);
}

- (NSUInteger)numberOfRecordsForPlot:(CPTPlot *)plot
{
    return (int)_data.size();
}

- (NSNumber *)numberForPlot:(CPTPlot *)plot field:(NSUInteger)fieldEnum recordIndex:(NSUInteger)idx
{
    return [NSNumber numberWithFloat:_data[idx]];
}

- (CGFloat)radialOffsetForPieChart:(CPTPieChart *)pieChart recordIndex:(NSUInteger)idx
{
    if(idx==2){
        return 20;
    }
    return 0;
}

@end
