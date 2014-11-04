//
//  ViewController.m
//  BI-IOS-REST
//
//  Created by Dominik Vesely on 03/11/14.
//  Copyright (c) 2014 Ackee s.r.o. All rights reserved.
//

#import "ViewController.h"
#import "MovieCellTableViewCell.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,weak) UITableView* tableView;
@property (nonatomic,strong) NSMutableArray* data;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    UITableView* tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.tableView = tableView;
    [self.view addSubview:tableView];
    [self.tableView registerClass:[MovieCellTableViewCell class] forCellReuseIdentifier:@"MovieCell"];
    
    [super viewDidLoad];
    
    [APIWrapper moviesSuccess:^(NSArray *movies) {
        for(Movie* movie in movies) {
            TRC_LOG(@"%@",movie);
        }
    } failure:^{
        TRC_LOG(@"neco se pokazilo");
    }];
    
    // Do any additional setup after loading the view, typically from a nib.
}


#pragma mark -
#pragma mark Tableview Stuff

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _data.count;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MovieCellTableViewCell* cell = [_tableView dequeueReusableCellWithIdentifier:@"MovieCell" forIndexPath:indexPath];
    
    
    
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController* detail = [[DetailViewController alloc] initWithTraining:_trainings[indexPath.row]];
    [self.parentViewController.navigationController pushViewController:detail animated:YES];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
